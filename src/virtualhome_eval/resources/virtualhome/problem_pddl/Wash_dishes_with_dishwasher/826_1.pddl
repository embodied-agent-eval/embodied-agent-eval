(define (problem Wash_dishes_with_dishwasher)
    (:domain virtualhome)
    (:objects
    character - character
    bathroom fork knife spoon cup dishwasher dish_soap plate dining_room - object
)
    (:init
    (inside_room plate dining_room)
    (recipient plate)
    (obj_next_to dishwasher fork)
    (recipient cup)
    (obj_inside dish_soap dishwasher)
    (obj_next_to dishwasher dish_soap)
    (movable cup)
    (obj_inside knife dishwasher)
    (inside_room cup dining_room)
    (grabbable dish_soap)
    (obj_next_to dishwasher spoon)
    (movable spoon)
    (grabbable cup)
    (plugged_out dishwasher)
    (inside_room knife dining_room)
    (grabbable plate)
    (inside_room dishwasher dining_room)
    (grabbable fork)
    (movable dish_soap)
    (obj_next_to dishwasher knife)
    (movable fork)
    (inside_room spoon dining_room)
    (obj_inside spoon dishwasher)
    (inside_room fork dining_room)
    (cream dish_soap)
    (obj_next_to fork dishwasher)
    (surfaces plate)
    (obj_inside fork dishwasher)
    (pourable dish_soap)
    (obj_next_to knife dishwasher)
    (grabbable spoon)
    (obj_next_to plate dishwasher)
    (closed dishwasher)
    (clean dishwasher)
    (obj_next_to spoon dishwasher)
    (movable knife)
    (can_open dishwasher)
    (off dishwasher)
    (has_switch dishwasher)
    (inside_room dish_soap dining_room)
    (grabbable knife)
    (obj_next_to dishwasher cup)
    (obj_next_to cup dishwasher)
    (movable plate)
    (inside character bathroom)
    (obj_next_to dishwasher plate)
    (containers dishwasher)
    (obj_inside cup dishwasher)
    (obj_inside plate dishwasher)
    (pourable cup)
    (obj_next_to dish_soap dishwasher)
)
    (:goal
    (and
        (closed dishwasher)
        (on dishwasher)
        (obj_ontop cup dishwasher)
        (obj_ontop spoon dishwasher)
        (obj_ontop dish_soap dishwasher)
        (obj_ontop knife dishwasher)
        (obj_ontop fork dishwasher)
        (obj_ontop plate dishwasher)
    )
)
    )
    