using HorizonSideRobots
r=Robot(11, 11;animate=true)

function allmarked!(r)
    steps_v=0
    steps_g=0
    while !isborder(r, Sud)
        move!(r, Sud)
        steps_v+=1
    end
    while !isborder(r, West)
        move!(r, West)
        steps_g+=1
    end
    putmarker!(r)
    while !isborder(r, West) && !isborder(r, Nord) || !isborder(r, Ost) && !isborder(r, Nord)
        if !isborder(r, Ost)
            while !isborder(r, Ost)
                move!(r, Ost)
                putmarker!(r)
            end
            if !isborder(r, Nord)
                move!(r, Nord)
                putmarker!(r)
            end
        elseif !isborder(r, West)
            while !isborder(r, West)
                move!(r, West)
                putmarker!(r)
            end
            if !isborder(r, Nord)
                move!(r, Nord)
                putmarker!(r)
            end
        end
    end
    if isborder(r, West)
        while !isborder(r, Ost)
            move!(r, Ost)
            putmarker!(r)
        end
    elseif isborder(r, Ost)
        while !isborder(r, West)
            move!(r, West)
            putmarker!(r)
        end
    end
    steps_v1=0
    steps_g1=0
    if isborder(r, West)
        while !isborder(r, Sud)
            move!(r, Sud)
        end
    elseif isborder(r, Ost)
        while !isborder(r, Sud)
            move!(r, Sud)
        end
        while !isborder(r, West)
            move!(r, West)
        end
    end
    while steps_g1!=steps_g
        move!(r, Ost)
        steps_g1+=1
    end
    while steps_v1!=steps_v
        move!(r, Nord)
        steps_v1+=1
    end
end     
# Код большой, так как он гибкий(то есть, можно менять размер поля по которому двигается робот и его точку старта. Результат все равно будет положительный)
