(define (problem Work)
    (:domain virtualhome)
    (:objects
    character - character
    home_office desk mouse keyboard powersocket cpuscreen doorjamb bedroom chair mousepad computer wall floor - object
)
    (:init
    (obj_inside powersocket home_office)
    (obj_next_to cpuscreen mousepad)
    (obj_next_to wall powersocket)
    (surfaces chair)
    (obj_next_to cpuscreen floor)
    (movable mousepad)
    (obj_next_to keyboard computer)
    (plugged_out computer)
    (obj_next_to computer cpuscreen)
    (has_plug keyboard)
    (obj_next_to mouse powersocket)
    (obj_next_to mousepad doorjamb)
    (sittable chair)
    (obj_next_to floor computer)
    (obj_next_to mousepad wall)
    (obj_next_to computer doorjamb)
    (obj_ontop mousepad desk)
    (inside_room chair bedroom)
    (facing floor computer)
    (obj_next_to mouse chair)
    (obj_inside wall home_office)
    (obj_next_to floor powersocket)
    (inside_room mouse bedroom)
    (obj_next_to computer floor)
    (obj_ontop mouse desk)
    (obj_next_to computer wall)
    (movable mouse)
    (obj_next_to wall mousepad)
    (obj_ontop cpuscreen desk)
    (obj_next_to keyboard mousepad)
    (movable keyboard)
    (obj_next_to chair computer)
    (obj_next_to chair mouse)
    (obj_next_to wall cpuscreen)
    (surfaces floor)
    (obj_next_to chair keyboard)
    (obj_next_to mousepad mouse)
    (obj_next_to wall mouse)
    (surfaces mousepad)
    (obj_next_to desk keyboard)
    (inside_room mousepad bedroom)
    (obj_ontop doorjamb floor)
    (obj_next_to mouse mousepad)
    (obj_ontop keyboard desk)
    (obj_next_to cpuscreen mouse)
    (obj_next_to doorjamb wall)
    (obj_next_to wall doorjamb)
    (obj_next_to floor mouse)
    (obj_next_to mousepad keyboard)
    (obj_next_to desk doorjamb)
    (obj_inside floor home_office)
    (obj_next_to cpuscreen desk)
    (obj_inside doorjamb home_office)
    (obj_next_to mousepad powersocket)
    (facing wall computer)
    (inside_room doorjamb bedroom)
    (obj_next_to floor mousepad)
    (lookable computer)
    (obj_next_to cpuscreen computer)
    (obj_next_to mousepad cpuscreen)
    (obj_next_to wall keyboard)
    (obj_next_to desk computer)
    (obj_inside desk home_office)
    (obj_next_to computer desk)
    (inside character bedroom)
    (obj_next_to desk wall)
    (obj_next_to computer mousepad)
    (obj_inside chair home_office)
    (obj_next_to desk mousepad)
    (obj_next_to mousepad floor)
    (obj_next_to mousepad desk)
    (inside_room wall bedroom)
    (obj_next_to keyboard floor)
    (grabbable mouse)
    (obj_next_to doorjamb computer)
    (obj_next_to mouse wall)
    (obj_next_to computer chair)
    (obj_next_to mouse desk)
    (obj_next_to desk floor)
    (obj_next_to keyboard mouse)
    (obj_inside keyboard home_office)
    (obj_inside mousepad home_office)
    (obj_next_to chair floor)
    (inside_room floor bedroom)
    (obj_next_to mouse floor)
    (grabbable chair)
    (obj_next_to cpuscreen chair)
    (obj_next_to powersocket wall)
    (obj_next_to floor floor)
    (obj_next_to doorjamb mousepad)
    (obj_next_to doorjamb desk)
    (obj_next_to computer mouse)
    (obj_next_to floor keyboard)
    (obj_next_to desk powersocket)
    (obj_next_to wall floor)
    (obj_inside computer home_office)
    (movable desk)
    (obj_next_to cpuscreen keyboard)
    (obj_next_to wall chair)
    (inside_room desk bedroom)
    (obj_next_to mousepad chair)
    (obj_next_to keyboard cpuscreen)
    (obj_next_to chair mousepad)
    (obj_next_to powersocket doorjamb)
    (obj_next_to floor wall)
    (obj_inside mouse home_office)
    (obj_next_to mousepad computer)
    (obj_next_to powersocket mousepad)
    (obj_next_to wall computer)
    (obj_next_to powersocket floor)
    (obj_next_to mouse doorjamb)
    (surfaces desk)
    (obj_next_to computer keyboard)
    (facing chair computer)
    (obj_next_to desk mouse)
    (movable chair)
    (obj_next_to wall wall)
    (obj_next_to floor desk)
    (obj_next_to desk chair)
    (has_switch computer)
    (obj_next_to chair cpuscreen)
    (obj_next_to keyboard chair)
    (obj_next_to powersocket desk)
    (obj_next_to powersocket mouse)
    (grabbable keyboard)
    (inside_room cpuscreen bedroom)
    (obj_next_to desk cpuscreen)
    (obj_next_to doorjamb powersocket)
    (obj_next_to chair desk)
    (obj_next_to mouse computer)
    (obj_ontop desk floor)
    (obj_next_to doorjamb floor)
    (obj_next_to computer powersocket)
    (obj_next_to floor doorjamb)
    (obj_next_to wall desk)
    (obj_next_to mouse keyboard)
    (has_plug mouse)
    (obj_next_to cpuscreen wall)
    (obj_next_to chair wall)
    (obj_inside cpuscreen home_office)
    (obj_next_to doorjamb mouse)
    (obj_next_to powersocket computer)
    (obj_next_to keyboard wall)
    (clean computer)
    (obj_next_to mouse cpuscreen)
    (off computer)
    (obj_next_to floor cpuscreen)
    (inside_room keyboard bedroom)
    (facing doorjamb computer)
    (obj_next_to floor chair)
    (inside_room computer bedroom)
    (obj_next_to keyboard desk)
    (obj_ontop mouse mousepad)
)
    (:goal
    (and
        (on computer)
    )
)
    )
    