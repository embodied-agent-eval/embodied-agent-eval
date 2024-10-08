(define (problem Go_to_toilet)
    (:domain virtualhome)
    (:objects
    character - character
    bathroom home_office toilet bathroom_counter sink toilet_paper soap - object
)
    (:init
    (containers sink)
    (obj_next_to toilet_paper toilet)
    (containers toilet)
    (obj_next_to toilet toilet_paper)
    (obj_next_to soap sink)
    (inside_room sink bathroom)
    (obj_next_to toilet sink)
    (inside_room soap bathroom)
    (obj_next_to sink bathroom_counter)
    (sittable toilet)
    (movable toilet_paper)
    (inside_room toilet_paper bathroom)
    (obj_next_to sink soap)
    (movable soap)
    (obj_next_to bathroom_counter sink)
    (cuttable toilet_paper)
    (can_open toilet)
    (obj_ontop soap sink)
    (hangable toilet_paper)
    (obj_inside sink bathroom_counter)
    (inside_room toilet bathroom)
    (cover_object toilet_paper)
    (inside_room bathroom_counter bathroom)
    (recipient sink)
    (grabbable toilet_paper)
    (surfaces bathroom_counter)
    (cream soap)
    (inside character home_office)
    (grabbable soap)
    (has_paper toilet_paper)
    (obj_next_to sink toilet)
)
    (:goal
    (and
        (ontop character toilet)
    )
)
    )
    