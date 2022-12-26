function num_of_borders!(robot)
    start_pos_define(r)
    total = 0
    while !isborder(r, Nord)
        num_borders!(robot, Ost)
        while !isborder(r, West)
            move!(r, West)
        end
        move!(r, Nord)
        total += num_borders
    end
    sw(r)
    goto_start_pos(r)
    return total
end

function num_borders!(robot, side)
    state = 0
    global num_borders = 0
    while try_move!(robot, side)
        if state == 0
            if isborder(robot, Nord)
                state = 1
            end
        else
            if !isborder(robot, Nord)
                state = 0
                num_borders += 1
            end
        end
    end
    return num_borders
end

function try_move!(robot, direct)
    if isborder(robot, direct)
        return false
    end
    move!(robot, direct)
    return true
end

function start_pos_define(robot)
    global x_pos = 0
    global y_pos = 0
    global z_pos = 0
    while !isborder(robot, Sud)
        x_pos += 1
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
        y_pos += 1
    end
    while !isborder(robot, Sud)
        move!(robot, Sud)
        z_pos += 1
    end
end

function goto_start_pos(robot)
    for i = 1:z_pos
        move!(robot, Nord)
    end
    for i = 1:y_pos
        move!(robot, Ost)
    end
    for i = 1:x_pos
        move!(robot, Nord)
    end
end

function sw(robot)
    along!(robot, West)
    along!(robot, Sud)
end

function along!(robot, side)
    while !isborder(robot, side)
        move!(robot, side)
    end
end
