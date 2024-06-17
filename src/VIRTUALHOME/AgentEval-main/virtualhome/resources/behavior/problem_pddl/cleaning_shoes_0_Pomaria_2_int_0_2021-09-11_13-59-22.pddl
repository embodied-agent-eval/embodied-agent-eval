(define (problem cleaning_shoes)
    (:domain igibson)
    (:objects agent_n_01_1 - agent bed_n_01_1 - bed_n_01 floor_n_01_1 - floor_n_01 rag_n_01_1 - rag_n_01 shoe_n_01_1 shoe_n_01_2 shoe_n_01_3 shoe_n_01_4 - shoe_n_01 sink_n_01_1 - sink_n_01 towel_n_01_1 - towel_n_01)
    (:init (dusty shoe_n_01_3) (dusty shoe_n_01_4) (not (soaked rag_n_01_1)) (onfloor towel_n_01_1 floor_n_01_1) (ontop rag_n_01_1 bed_n_01_1) (ontop shoe_n_01_1 bed_n_01_1) (ontop shoe_n_01_2 bed_n_01_1) (ontop shoe_n_01_3 bed_n_01_1) (ontop shoe_n_01_4 bed_n_01_1) (same_obj bed_n_01_1 bed_n_01_1) (same_obj floor_n_01_1 floor_n_01_1) (same_obj rag_n_01_1 rag_n_01_1) (same_obj shoe_n_01_1 shoe_n_01_1) (same_obj shoe_n_01_2 shoe_n_01_2) (same_obj shoe_n_01_3 shoe_n_01_3) (same_obj shoe_n_01_4 shoe_n_01_4) (same_obj sink_n_01_1 sink_n_01_1) (same_obj towel_n_01_1 towel_n_01_1) (stained shoe_n_01_1) (stained shoe_n_01_2))
    (:goal (and (not (dusty shoe_n_01_4)) (not (dusty shoe_n_01_2)) (not (stained shoe_n_01_1)) (not (stained shoe_n_01_3))))
)