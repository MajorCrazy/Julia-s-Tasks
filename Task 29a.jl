function n29a(r)
    if !ismarker(r)
        putmarker!(r)
        for side in (Nord, West, Sud, Ost)
            try_move!(r, side)
            n29a(r)
            try_move!(r, inverse(side))
        end
    end
end

function inverse(side)
    HorizonSide(mod(Int(side)+2,4))
end

try_move!(r, side) = (!isborder(r, side) && (move!(r, side); return true); false)