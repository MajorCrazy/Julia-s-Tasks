function chess!(r::Robot, cell_size::Int)
    path = go_to_ws_corner_and_return_path!(r)
    x=0; y=0
    xDirection = Ost
    
    while !(isborder(r, Nord) && isborder(r, Ost))
        marker_special!(r, x, y, cell_size)
        if move_up_condition(r)
            move!(r, Nord)
            y += 1
            marker_special!(r, x, y, cell_size)
            xDirection = inverse(xDirection)
        end
        
        move!(r, xDirection)
        (xDirection == Ost) ? x += 1 : x -= 1
    end

    marker_special!(r, x, y, cell_size)

    go_to_ws_corner_and_return_path!(r)
    go_by_path!(r, path)
end

function marker_special!(r, x, y, cell_size)
    if (mod(x, 2 * cell_size)) < cell_size && (mod(y, 2 * cell_size)) < cell_size || 
        (mod(x + cell_size, 2 * cell_size)) < cell_size && (mod(y, 2 * cell_size)) >= cell_size
        putmarker!(r)
    end
end

function go_to_ws_corner_and_return_path!(r::Robot; go_around_barriers::Bool = false, markers = false)::Array{Tuple{HorizonSide,Int64},1}
    my_ans = []
    a = go_to_border_and_return_path!(r, West; go_around_barriers, markers)
    b = go_to_border_and_return_path!(r, Sud; go_around_barriers, markers)

    for i in a
        push!(my_ans, i)
    end
    for i in b
        push!(my_ans, i)
    end
    return my_ans
end

function move_up_condition(r)
    return isborder(r, Ost) || isborder(r, West) && !(isborder(r, Sud) && isborder(r, West))
end

function inverse(side::HorizonSide)
    HorizonSide(mod(Int(side)+2,4))
end

function go_by_path!(r::Robot, path::Array{Tuple{HorizonSide,Int64},1})
    new_path = reverse(path)
    for i in new_path
        go!(r, i[1]; steps = i[2])
    end
end

