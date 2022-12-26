using HorizonSideRobobts
r=Robot(11,11;animate=true)

function krest!(r::Robot)
    for side in(HorizonSide(i) for i=0:3)
        putmarkers!(r, side)
        moveback(r, inverse(side))
    end
    putmarker!(r)
end

function putmarkers!(r::Robot, side::HorizonSide)
    while !isborder(r, side)
        move!(r, side)
        putmarker!(r)
    end
end

function moveback(r::Robot, side::HorizonSide)
    while ismarker(r)
        move!(r, side)
    end
end
function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end

