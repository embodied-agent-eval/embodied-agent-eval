(define (problem Wash_clothes)
    (:domain virtualhome)
    (:objects
    character - character
    bathroom clothes_jacket washing_machine basket_for_clothes dining_room soap - object
)
    (:init
    (obj_next_to soap basket_for_clothes)
    (grabbable clothes_jacket)
    (off washing_machine)
    (movable clothes_jacket)
    (inside_room basket_for_clothes dining_room)
    (hangable clothes_jacket)
    (containers washing_machine)
    (plugged_in washing_machine)
    (can_open basket_for_clothes)
    (obj_next_to washing_machine basket_for_clothes)
    (inside_room washing_machine dining_room)
    (has_switch washing_machine)
    (obj_next_to basket_for_clothes soap)
    (grabbable basket_for_clothes)
    (movable soap)
    (has_plug washing_machine)
    (containers basket_for_clothes)
    (can_open washing_machine)
    (clothes clothes_jacket)
    (inside_room soap dining_room)
    (closed washing_machine)
    (clean washing_machine)
    (obj_inside basket_for_clothes basket_for_clothes)
    (inside_room clothes_jacket dining_room)
    (obj_next_to clothes_jacket basket_for_clothes)
    (obj_inside clothes_jacket washing_machine)
    (obj_ontop washing_machine basket_for_clothes)
    (recipient washing_machine)
    (obj_next_to basket_for_clothes washing_machine)
    (obj_next_to basket_for_clothes basket_for_clothes)
    (obj_next_to basket_for_clothes clothes_jacket)
    (inside character bathroom)
    (movable basket_for_clothes)
    (cream soap)
    (grabbable soap)
)
    (:goal
    (and
        (closed washing_machine)
        (on washing_machine)
        (plugged_in washing_machine)
        (obj_ontop soap washing_machine)
        (obj_ontop clothes_jacket washing_machine)
    )
)
    )
    