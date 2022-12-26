using HorizonSideRobots
r=Robot()
r=Robot(11,11;animate=true)

function koskrest!(r::Robot)
    for side in (Nord, West, Sud, Ost)
        movekos!(r, side)
    end
    putmarker!(r)
end 

function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end

function left(side::HorizonSide)
    HorizonSide(mod(Int(side)+1,4))
end

function movekos!(r::Robot, side::HorizonSide)
    while !isborder(r,side) && !isborder(r, left(side))
        move!(r, side)
        move!(r, left(side))
        putmarker!(r)
    end
    while ismarker(r)
        move!(r, inverse(left(side)))
        move!(r, inverse(side))
    end
end
