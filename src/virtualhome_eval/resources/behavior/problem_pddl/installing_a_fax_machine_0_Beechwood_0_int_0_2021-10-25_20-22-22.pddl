(define (problem installing_a_fax_machine)
    (:domain igibson)
    (:objects agent_n_01_1 - agent facsimile_n_02_1 - facsimile_n_02 floor_n_01_1 - floor_n_01 table_n_02_1 - table_n_02)
    (:init (not (toggled_on facsimile_n_02_1)) (onfloor facsimile_n_02_1 floor_n_01_1) (same_obj facsimile_n_02_1 facsimile_n_02_1) (same_obj floor_n_01_1 floor_n_01_1) (same_obj table_n_02_1 table_n_02_1))
    (:goal (and (toggled_on facsimile_n_02_1) (ontop facsimile_n_02_1 table_n_02_1)))
)