function chess!(robot)
    if !isborder(robot, side)
        move!(r, side)
        putmarker!(r)
        chess2!(r, side)
    end
end

function chess2!(robot, side)
    if !isborder(robot, side)
        move!(r, side)
        chess!(robot)
    end
end
