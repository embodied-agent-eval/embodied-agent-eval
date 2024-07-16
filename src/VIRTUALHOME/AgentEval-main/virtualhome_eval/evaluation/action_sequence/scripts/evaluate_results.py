import json
import copy
import os
import copy
import os.path as osp

import virtualhome_eval.simulation.evolving_graph.utils as utils
from virtualhome_eval.simulation.evolving_graph.eval_utils import *
from virtualhome_eval.simulation.evolving_graph.checker import TemporalOrderChecker


def evaluate_results(args):
    dataset = args.dataset
    model_name = args.model_name
    if args.llm_response_path == "":
        llm_response_path = f"virtualhome_eval/llm_response/action_sequence/{model_name}_outputs.json"
    else:
        llm_response_path = args.llm_response_path

    resource_root = osp.join(args.resource_dir, dataset)
    data_dir = osp.join(
        args.dataset_dir, "programs_processed_precond_nograb_morepreconds"
    )

    # indexing path
    task_dict_dir = osp.join(resource_root, "task_state_LTL_formula_accurate.json")
    id_to_task_path = os.path.join(resource_root, "id2task.json")

    # load data
    task_dicts = json.load(open(task_dict_dir, "r"))
    llm_response = json.load(open(llm_response_path, "r"))
    print(f'Load llm response from {llm_response_path}')
    id2task = json.load(open(id_to_task_path, "r"))

    properties_data = utils.load_properties_data()
    object_placing = utils.load_object_placing()
    name_equivalence = utils.load_name_equivalence()

    scenegraph_id = 1
    scene_id = f"scene_{scenegraph_id}"
    task_dicts = task_dicts[scene_id]

    # trajectory metrics
    program_num = 0

    all_parsing_wrong = 0
    all_hallucination = 0
    all_parameter_wrong = 0
    all_executable_plan = 0
    all_correct_plan = 0

    error_code_to_number = {
        0: 0,
        1: 0,
        2: 0,
        4: 0,
    }
    error_code_to_type = {
        0: "WRONG_TEMPORAL_ORDER",
        1: "MISSING_STEP",
        2: "AFFORDANCE_ERROR",
        3: "UNSEEN_OBJECT",
        4: "ADDITIONAL_STEP",
        5: "UNKNOWN_ERROR",
    }

    # scene metrics
    all_matched_node = 0
    all_matched_edge = 0
    all_matched_action = 0
    all_matched_all = 0

    all_node_goals = 0
    all_edge_goals = 0
    all_action_goals = 0
    all_goals = 0

    error_info = {}
    for output_dict in llm_response:
        file_id = output_dict["identifier"]

        # get symbolic goals
        task = id2task[file_id]
        print(f"Task is {task}, file_id is {file_id}")
        program_num += 1

        program_dict = task_dicts[task][file_id]
        goals = program_dict["vh_goal"]
        gold_action_goals = goals["actions"]
        scene_goals = goals["goal"]
        gold_node_goals = []
        gold_edge_goals = []
        for scene_goal in scene_goals:
            if (
                "id" in scene_goal
                and "class_name" in scene_goal
                and "state" in scene_goal
            ):
                gold_node_goals.append(scene_goal)
            elif (
                "from_id" in scene_goal
                and "to_id" in scene_goal
                and "relation_type" in scene_goal
            ):
                gold_edge_goals.append(scene_goal)
            else:
                raise ValueError("Scene goal is not in correct format")

        gold_node_goals = remove_duplicate_dicts(gold_node_goals)
        gold_edge_goals = remove_duplicate_dicts(gold_edge_goals)
        gold_action_goals = list(set(gold_action_goals))

        motion_planner, relevant_id, gd_actions, task_name, _ = construct_planner(
            name_equivalence,
            properties_data,
            object_placing,
            scenegraph_id=scenegraph_id,
            script_id=file_id,
            dataset_root=data_dir,
        )
        _, _, _, _, _, relevant_name_to_id = motion_planner.get_symbolic_goal_nl(
            gold_node_goals, gold_edge_goals, action_goals=gold_action_goals
        )

        _, _, _, all_success, _, _, _ = scene_evaluate_wID(
            motion_planner.final_state_dict,
            gold_node_goals,
            gold_edge_goals,
            motion_planner.acting_char_id,
        )

        if not all_success:
            program_num -= 1
            print(f"Program {file_id} did not pass gold test")
            continue

        all_node_goals += len(gold_node_goals)
        all_edge_goals += len(gold_edge_goals)
        all_action_goals += len(gold_action_goals)
        all_goals += (
            len(gold_node_goals) + len(gold_edge_goals) + len(gold_action_goals)
        )

        executable = False
        format_error = False
        hallucination_error = False
        parameter_error = False

        actions = output_dict["llm_output"]
        # if llm output starts with ```json
        if actions.startswith("```json"):
            actions = actions[7:]
        actions = actions.strip().replace("\n", "")
        actions = actions.replace("'", '"')
        # format check
        try:
            actions = json.loads(actions)
        except Exception as e:
            print(f"Task {task_name}, file {file_id} prediction has format error")
            all_parsing_wrong += 1
            actions = None
            format_error = True

        if len(actions) == 0:
            all_parsing_wrong += 1
            print(f"Task {task_name}, file {file_id} prediction has no prediction")
            format_error = True

        # hallucination check
        if not format_error:
            if check_no_hallucination_in_action(
                actions
            ) and check_no_hallucination_in_arg(actions, relevant_name_to_id):
                hallucination_error = False
            else:
                print(
                    f"Task {task_name}, file {file_id} has hallucination error",
                    flush=True,
                )
                all_hallucination += 1
                hallucination_error = True

        # parameters number check
        if not format_error and not hallucination_error:
            print(f"{actions=}")
            pass_check, err = check_action_grammar(actions)
            if pass_check:
                actions = json_to_action(
                    actions, relevant_name_to_id=relevant_name_to_id
                )
                parameter_error = False
            else:
                print(
                    f"Task {task_name}, file {file_id} has arguments number error",
                    flush=True,
                )
                all_parameter_wrong += 1
                parameter_error = True

        if not format_error and not hallucination_error and not parameter_error:
            print(f"{actions=}")
            if actions == gd_actions:
                all_executable_plan += 1
            else:
                motion_planner.reset()
                exe_flag = True
                history_actions = []
                executable = True
                error_action = None
                prev_env_states = copy.deepcopy(motion_planner.env_state)
                history_env_states = [copy.deepcopy(prev_env_states.to_dict())]
                if len(actions) == 0:
                    exe_flag = False
                    executable = False
                for action in actions:
                    print(f"Current {action=}")
                    history_env_states_cp = copy.deepcopy(history_env_states)
                    exe_flag, my_info = motion_planner.my_execute_primitive_action_eval(
                        action
                    )
                    if not exe_flag:
                        print(f"Current action {action} not executable.")
                        print(f"{my_info=}")
                        error_action = action
                        formal_info_checker = TemporalOrderChecker(
                            my_info, history_env_states_cp
                        )
                        formal_info = formal_info_checker.run_checker()
                        failed_error_code = formal_info.get_error_type()
                        ADDITIONAL_ERRROR_CODE = 4
                        assert (
                            failed_error_code in error_code_to_number
                        ), f"Unknown error code {failed_error_code}"
                        error_code_to_number[failed_error_code] += 1
                        print(
                            f"Encounter error: {error_code_to_type[failed_error_code]}"
                        )
                        if failed_error_code != ADDITIONAL_ERRROR_CODE:
                            if failed_error_code == 0:
                                print(
                                    f"Current action {action} has wrong order error on task {file_id}."
                                )
                            executable = False
                            history_actions_cp = copy.deepcopy(history_actions)
                            print(f"{failed_error_code=}")
                            print(f"{history_actions_cp=}")
                            break
                    else:
                        print(f"Current action {action} executable.", flush=True)
                        history_actions.append(action)
                        new_env_state = copy.deepcopy(
                            motion_planner.env_state.to_dict()
                        )
                        history_env_states.append(new_env_state)

                if executable:
                    all_executable_plan += 1
                    print("Executable!", flush=True)
                    error_info[file_id] = {
                        "executable": executable,
                        "actions": actions,
                        "error_type": None,
                        "error_action": None,
                    }
                else:
                    error_info[file_id] = {
                        "executable": executable,
                        "actions": actions,
                        "error_type": error_code_to_type[failed_error_code].lower(),
                        "error_action": error_action,
                    }

                (
                    node_match_num,
                    edge_match_num,
                    action_match_num,
                    all_pred_success,
                    _,
                    _,
                    _,
                ) = scene_evaluate_wID(
                    motion_planner.env_state.to_dict(),
                    gold_node_goals,
                    gold_edge_goals,
                    motion_planner.acting_char_id,
                    action_seq=history_actions,
                    action_goals=gold_action_goals,
                )
                print(
                    f"Predicted: {node_match_num=}, {edge_match_num=}, {action_match_num=}"
                )
                print(
                    f"Gold: {len(gold_node_goals)=}, {len(gold_edge_goals)=}, {len(gold_action_goals)=}"
                )
                print(f"Goals all satisfied: {all_pred_success=}")
                all_matched_node += node_match_num
                all_matched_edge += edge_match_num
                all_matched_action += action_match_num
                all_matched_all += node_match_num + edge_match_num + action_match_num

                if all_pred_success:
                    all_correct_plan += 1
                    print("EVERYTHING SUCCEED!", flush=True)

        else:
            if format_error:
                error_info[file_id] = {
                    "executable": False,
                    "actions": actions,
                    "error_type": "parsing error",
                    "error_action": None,
                }
            elif hallucination_error:
                error_info[file_id] = {
                    "executable": False,
                    "actions": actions,
                    "error_type": "hallucination error",
                    "error_action": None,
                }
            elif parameter_error:
                error_info[file_id] = {
                    "executable": False,
                    "actions": actions,
                    "error_type": "parameter error",
                    "error_action": None,
                }
            else:
                raise ValueError("Unknown error type")

    # calculate metrics, keep two decimal digits with percentage
    print(f"Program number: {program_num}")
    print(
        f"Parsing wrong: {all_parsing_wrong}, rate = {100.0 * all_parsing_wrong/program_num:.2f}%"
    )
    print(
        f"Hallucination: {all_hallucination}, rate = {100.0 * all_hallucination/program_num:.2f}%"
    )
    print(
        f"Parameter wrong: {all_parameter_wrong}, rate = {100.0 * all_parameter_wrong/program_num:.2f}%"
    )
    print(
        f"Executable plan: {all_executable_plan}, rate = {100.0 * all_executable_plan/program_num:.2f}%"
    )
    print(
        f"Correct plan: {all_correct_plan}, rate = {100.0 * all_correct_plan/program_num:.2f}%"
    )

    all_wrong_order_num = error_code_to_number[0]
    all_missing_step_num = error_code_to_number[1]
    all_affordance_num = error_code_to_number[2]
    all_additional_step_num = error_code_to_number[4]
    print("For not executable plans:")
    print(
        f"Wrong order: {all_wrong_order_num}, rate = {100.0 * all_wrong_order_num/program_num:.2f}%"
    )
    print(
        f"Missing step: {all_missing_step_num}, rate = {100.0 * all_missing_step_num/program_num:.2f}%"
    )
    print(
        f"Affordance error: {all_affordance_num}, rate = {100.0 * all_affordance_num/program_num:.2f}%"
    )
    print(
        f"Additional step: {all_additional_step_num}, rate = {100.0 * all_additional_step_num/program_num:.2f}%"
    )

    # keep three decimal digits
    print("For scene metrics:")
    print(
        f"Matched node: {all_matched_node}, rate = {100.0 *all_matched_node/all_node_goals:.2f}"
    )
    print(
        f"Matched edge: {all_matched_edge}, rate = {100.0 *all_matched_edge/all_edge_goals:.2f}"
    )
    print(
        f"Matched action: {all_matched_action}, rate = {100.0 *all_matched_action/all_action_goals:.2f}"
    )
    print(
        f"Matched all: {all_matched_all}, rate = {100.0 *all_matched_all/all_goals:.2f}"
    )

    summary = {
        "goal_evaluation": {
            "task_success_rate": round(100.0 * all_correct_plan / program_num, 4),
            "state_goal": round(100.0 * all_matched_node / all_node_goals, 4),
            "relation_goal": round(100.0 * all_matched_edge / all_edge_goals, 4),
            "action_goal": round(100.0 * all_matched_action / all_action_goals, 4),
            "total_goal": round(100.0 * all_matched_all / all_goals, 4),
        },
        "trajectory_evaluation": {
            "execution_success_rate": round(
                100.0 * all_executable_plan / program_num, 1
            ),
            "grammar_error": {
                "parsing": round(100.0 * all_parsing_wrong / program_num, 4),
                "hallucination": round(100.0 * all_hallucination / program_num, 4),
                "predicate_argument_number": round(
                    100.0 * all_parameter_wrong / program_num, 4
                ),
            },
            "runtime_error": {
                "wrong_order": round(100.0 * all_wrong_order_num / program_num, 4),
                "missing_step": round(100.0 * all_missing_step_num / program_num, 4),
                "affordance_error": round(100.0 * all_affordance_num / program_num, 4),
                "additional_step": round(
                    100.0 * all_additional_step_num / program_num, 4
                ),
            },
        },
    }

    return summary, error_info
