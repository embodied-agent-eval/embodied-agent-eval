(define (problem Work)
    (:domain virtualhome)
    (:objects
    character - character
    bathroom home_office desk mouse hair keyboard cpuscreen check homework computer chair mousepad - object
)
    (:init
    (obj_next_to homework desk)
    (obj_next_to cpuscreen mousepad)
    (obj_next_to check chair)
    (surfaces chair)
    (movable mousepad)
    (obj_next_to keyboard computer)
    (obj_next_to desk check)
    (movable check)
    (plugged_out computer)
    (obj_next_to computer cpuscreen)
    (has_plug keyboard)
    (sittable chair)
    (movable hair)
    (has_paper homework)
    (obj_ontop mousepad desk)
    (readable check)
    (obj_next_to mouse chair)
    (obj_next_to chair homework)
    (obj_ontop mouse desk)
    (movable mouse)
    (obj_ontop cpuscreen desk)
    (obj_next_to keyboard mousepad)
    (movable keyboard)
    (obj_next_to chair computer)
    (obj_inside check home_office)
    (obj_next_to chair mouse)
    (obj_next_to homework chair)
    (obj_next_to chair keyboard)
    (obj_next_to mousepad mouse)
    (surfaces mousepad)
    (obj_next_to desk keyboard)
    (obj_next_to mouse mousepad)
    (obj_ontop keyboard desk)
    (obj_next_to cpuscreen mouse)
    (obj_next_to mousepad keyboard)
    (obj_next_to cpuscreen desk)
    (readable homework)
    (lookable computer)
    (obj_next_to cpuscreen computer)
    (obj_next_to mousepad cpuscreen)
    (obj_next_to desk computer)
    (obj_inside desk home_office)
    (grabbable hair)
    (obj_next_to computer desk)
    (obj_next_to computer mousepad)
    (obj_inside chair home_office)
    (obj_next_to desk mousepad)
    (obj_next_to chair check)
    (obj_next_to mousepad desk)
    (grabbable mouse)
    (obj_next_to desk homework)
    (obj_next_to computer chair)
    (obj_next_to mouse desk)
    (obj_next_to keyboard mouse)
    (obj_inside keyboard home_office)
    (obj_inside mousepad home_office)
    (grabbable chair)
    (obj_next_to cpuscreen chair)
    (cuttable hair)
    (obj_next_to computer mouse)
    (has_paper check)
    (obj_inside computer home_office)
    (inside character bathroom)
    (movable desk)
    (obj_next_to cpuscreen keyboard)
    (grabbable homework)
    (obj_next_to mousepad chair)
    (obj_next_to keyboard cpuscreen)
    (obj_next_to chair mousepad)
    (obj_inside mouse home_office)
    (obj_next_to mousepad computer)
    (body_part hair)
    (surfaces desk)
    (obj_next_to computer keyboard)
    (facing chair computer)
    (obj_next_to desk mouse)
    (movable chair)
    (obj_next_to check desk)
    (obj_next_to desk chair)
    (has_switch computer)
    (obj_next_to chair cpuscreen)
    (obj_next_to keyboard chair)
    (grabbable check)
    (grabbable keyboard)
    (obj_next_to desk cpuscreen)
    (obj_next_to mouse computer)
    (obj_next_to chair desk)
    (obj_next_to mouse keyboard)
    (has_plug mouse)
    (obj_inside cpuscreen home_office)
    (clean computer)
    (obj_next_to mouse cpuscreen)
    (off computer)
    (obj_inside homework home_office)
    (obj_next_to keyboard desk)
    (obj_ontop mouse mousepad)
    (movable homework)
)
    (:goal
    (and
        (on computer)
    )
)
    )
    