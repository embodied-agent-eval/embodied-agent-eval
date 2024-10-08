(define (problem Relax_on_sofa)
    (:domain virtualhome)
    (:objects
    character - character
    home_office couch light stereo television dining_room - object
)
    (:init
    (has_plug television)
    (obj_inside stereo home_office)
    (has_switch light)
    (has_plug light)
    (surfaces couch)
    (inside_room television dining_room)
    (obj_inside couch home_office)
    (can_open stereo)
    (plugged_in light)
    (lieable couch)
    (obj_next_to couch television)
    (obj_next_to light light)
    (has_plug stereo)
    (off stereo)
    (lookable television)
    (surfaces stereo)
    (clean light)
    (plugged_out stereo)
    (closed stereo)
    (inside character dining_room)
    (movable couch)
    (clean stereo)
    (has_switch stereo)
    (facing couch television)
    (sittable couch)
    (has_switch television)
    (grabbable stereo)
    (off light)
    (facing light television)
    (movable stereo)
    (obj_inside television home_office)
    (obj_next_to television couch)
    (inside_room light dining_room)
    (obj_inside light home_office)
)
    (:goal
    (and
        (lying character)
        (ontop character couch)
    )
)
    )
    