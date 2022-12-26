function movef!(robot)
    if !isborder(robot, side)
        move!(robot, side)
        movef!(robot)
    else
        move!(robot, left(side))
        movef!(robot)
        move!(robot, right(side))
    end
end

function left(side)
    HorizonSide(mod(Int(side)+1,4))
end

function right(side)
    HorizonSide(mod(Int(side)-1,4))
end


