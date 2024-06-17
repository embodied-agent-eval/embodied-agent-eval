(define (problem packing_adult_s_bags)
    (:domain igibson)
    (:objects agent_n_01_1 - agent backpack_n_01_1 - backpack_n_01 bed_n_01_1 - bed_n_01 floor_n_01_1 - floor_n_01 jewelry_n_01_1 jewelry_n_01_2 - jewelry_n_01 makeup_n_01_1 - makeup_n_01 mouse_n_04_1 - mouse_n_04)
    (:init (onfloor backpack_n_01_1 floor_n_01_1) (onfloor jewelry_n_01_1 floor_n_01_1) (onfloor jewelry_n_01_2 floor_n_01_1) (ontop makeup_n_01_1 bed_n_01_1) (ontop mouse_n_04_1 bed_n_01_1) (same_obj backpack_n_01_1 backpack_n_01_1) (same_obj bed_n_01_1 bed_n_01_1) (same_obj floor_n_01_1 floor_n_01_1) (same_obj jewelry_n_01_1 jewelry_n_01_1) (same_obj jewelry_n_01_2 jewelry_n_01_2) (same_obj makeup_n_01_1 makeup_n_01_1) (same_obj mouse_n_04_1 mouse_n_04_1))
    (:goal (and (inside makeup_n_01_1 backpack_n_01_1) (inside mouse_n_04_1 backpack_n_01_1) (inside jewelry_n_01_2 backpack_n_01_1) (inside jewelry_n_01_1 backpack_n_01_1)))
)