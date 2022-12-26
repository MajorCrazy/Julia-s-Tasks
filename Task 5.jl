function markedsquare!(robot)
    start_pos_define(robot)
    perimeter_area!(robot)
    side = Ost
    count = 0
    while !isborder(robot, Nord)
          while !isborder(robot, side)
                move!(robot, side)
                if isborder(robot, left(side))
                      for side in (Ost, Nord, West, Sud)
                            while isborder(robot, left(side))
                                  putmarker!(robot)
                                  move!(robot, side)
                            end
                            move!(robot, left(side))
                            count += 1
                      end
                      if count == 4
                            break
                      end          
                end
          end
          along!(robot, inverse(side))
          move!(robot, Nord)
    end
    south_west(robot)
    goto_start_pos(robot)    
end

function perimeter_area!(robot)
    putmarker!(robot)
    for side in (Nord, Ost, Sud, West)
        along_markers!(robot, side)
    end
end

function left(side)
    HorizonSide(mod(Int(side)+1,4))
end

function along_markers!(robot, side)
    while !isborder(robot, side)
        putmarker!(robot)
        move!(robot, side)
        putmarker!(robot)
    end
end

function inverse(side)
    HorizonSide(mod(Int(side)+2,4))
end

function along!(robot, side)
    while !isborder(robot, side)
        move!(robot, side)
    end
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

function south_west(robot)
    along!(robot, West)
    along!(robot, Sud)
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

