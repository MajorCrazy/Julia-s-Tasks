function n29(r)
    if !ismarker(r)
        putmarker!(r)
        for side in (Nord, West, Sud, Ost)
            move!(r, side)
            n29(r)
            move!(r, inverse(side))
        end
    end
end

function inverse(side)
    HorizonSide(mod(Int(side)+2,4))
end
