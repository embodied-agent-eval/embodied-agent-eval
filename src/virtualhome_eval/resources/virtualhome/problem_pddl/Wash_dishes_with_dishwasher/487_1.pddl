(define (problem Wash_dishes_with_dishwasher)
    (:domain virtualhome)
    (:objects
    character - character
    fork spoon cup dishwasher bedroom dish_soap plate dining_room - object
)
    (:init
    (inside_room plate dining_room)
    (recipient plate)
    (recipient cup)
    (obj_inside dish_soap dishwasher)
    (movable cup)
    (inside_room cup dining_room)
    (grabbable dish_soap)
    (obj_next_to spoon plate)
    (movable spoon)
    (grabbable cup)
    (plugged_out dishwasher)
    (grabbable plate)
    (inside_room dishwasher dining_room)
    (grabbable fork)
    (movable dish_soap)
    (obj_next_to plate fork)
    (movable fork)
    (inside_room spoon dining_room)
    (obj_next_to dish_soap plate)
    (obj_inside spoon dishwasher)
    (inside_room fork dining_room)
    (obj_next_to plate dish_soap)
    (cream dish_soap)
    (surfaces plate)
    (obj_inside fork dishwasher)
    (pourable dish_soap)
    (grabbable spoon)
    (obj_next_to plate dishwasher)
    (closed dishwasher)
    (obj_next_to cup plate)
    (clean dishwasher)
    (inside_room dish_soap dining_room)
    (can_open dishwasher)
    (has_switch dishwasher)
    (off dishwasher)
    (obj_next_to plate spoon)
    (obj_next_to plate cup)
    (movable plate)
    (inside character bedroom)
    (obj_next_to dishwasher plate)
    (containers dishwasher)
    (obj_next_to fork plate)
    (obj_inside cup dishwasher)
    (pourable cup)
)
    (:goal
    (and
        (closed dishwasher)
        (on dishwasher)
        (obj_ontop cup dishwasher)
        (obj_ontop spoon dishwasher)
        (obj_ontop dish_soap dishwasher)
        (obj_ontop fork dishwasher)
        (obj_ontop plate dishwasher)
    )
)
    )
    