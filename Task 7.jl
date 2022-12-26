function find_passage(robot)
    n = 0; 
    side = Ost
    while isborder(robot, Nord)
        n += 1
        moves!(robot, side, n)
        side = inverse(side)
    end
end

function inverse(side)
    HorizonSide(mod(Int(side)+2,4))
end
