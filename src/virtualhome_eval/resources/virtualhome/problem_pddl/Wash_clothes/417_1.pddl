(define (problem Wash_clothes)
    (:domain virtualhome)
    (:objects
    character - character
    clothes_shirt clothes_pants soap washing_machine - object
)
    (:init
    (clothes clothes_pants)
    (movable clothes_pants)
    (obj_inside clothes_shirt washing_machine)
    (off washing_machine)
    (hangable clothes_shirt)
    (grabbable soap)
    (containers washing_machine)
    (plugged_in washing_machine)
    (has_switch washing_machine)
    (movable soap)
    (has_plug washing_machine)
    (obj_inside soap washing_machine)
    (can_open washing_machine)
    (closed washing_machine)
    (clean washing_machine)
    (grabbable clothes_pants)
    (grabbable clothes_shirt)
    (obj_inside clothes_pants washing_machine)
    (hangable clothes_pants)
    (recipient washing_machine)
    (clothes clothes_shirt)
    (cream soap)
    (movable clothes_shirt)
)
    (:goal
    (and
        (closed washing_machine)
        (on washing_machine)
        (plugged_in washing_machine)
        (obj_ontop soap washing_machine)
        (obj_ontop clothes_shirt washing_machine)
        (obj_ontop clothes_pants washing_machine)
    )
)
    )
    