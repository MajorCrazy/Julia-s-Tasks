function chess!(robot)
    if !isborder(robot, side)
        putmarker!(r)
        move!(r, side)
        chess2!(r, side)
    end
    putmarker!(r)
end

function chess2!(robot, side)
    if !isborder(robot, side)
        move!(r, side)
        chess!(robot)
    end
end
