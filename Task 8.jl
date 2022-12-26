using HorizonSideRobots
r = Robot(11,11;animate=true)

function findmarker!(r::Robot)
    max_n_steps = 1
    side = Nord
    while !ismarker(r)
        along!(r, side, max_n_steps)
        side = right(side)
        along!(r, side, max_n_steps)
        max_n_steps += 1
        side = right(side)
    end
end

function along!(r::Robot, side::HorizonSide, max_n_steps)
    n_steps = 0
    while !ismarker(r) && n_steps < max_n_steps
        move!(r, side)
        n_steps += 1
    end
end

function right(side::HorizonSide)
    HorizonSide(mod(Int(side)-1,4))
end
