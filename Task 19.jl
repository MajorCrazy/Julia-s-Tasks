using HorizonSideRobots
r = Robot(11,11;animate=true)

function move_to_border!(r::Robot)
    if !isborder(r, Ost)
        move!(r, Ost)
        move_to_border!(r)
    end
end
