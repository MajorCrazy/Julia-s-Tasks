function chess(robot)
    x = 0
    y = 0
    while !isborder(r, Sud)
        move!(robot, Sud)
        y+=1
    end
    while !isborder(r, West)
        move!(robot, West)
        x+=1
    end
    if mod(Int(x+y), 2) == 0
        while !isborder(r, Ost)
            goup1case(robot)
            if !isborder(r, Ost)
                move!(r, Ost)
            end
            godown1case(robot)
            if !isborder(r, Ost)
                move!(r, Ost)
                if isborder(r, Ost)
                    goup1case(robot)
                end
            end
        end
    else
        while !isborder(r, Ost)
            goup2case(robot)
            if !isborder(r, Ost)
                move!(r, Ost)
            end
            godown2case(robot)
            if !isborder(r, Ost)
                move!(r, Ost)
                if isborder(r, Ost)
                    goup2case(robot)
                end
            end
        end
    end
    while !isborder(r, West)
        move!(r, West)
    end
    while !isborder(r, Sud)
        move!(r, Sud)
    end
    for i = 1:x
        move!(r, Ost)
    end
    for i = 1:y
        move!(r, Nord)
    end
end

function goup1case(robot)
    countup = 1
    putmarker!(robot)
    while !isborder(r, Nord)
        countup += 1
        move!(r, Nord)
        if mod(countup, 2) == 1
            putmarker!(r)
        end
    end
end

function godown1case(robot)
    countdown = 0
    while !isborder(r, Sud)
        move!(r, Sud)
        countdown += 1
        if mod(countdown, 2) == 1
            putmarker!(r)
        end
    end
end

function goup2case(robot)
    countup = 0
    while !isborder(r, Nord)
        countup += 1
        move!(r, Nord)
        if mod(countup, 2) == 1
            putmarker!(r)
        end
    end    
end

function godown2case(robot)
    countdown = 0
    putmarker!(r)
    while !isborder(r, Sud)
        move!(r, Sud)
        countdown += 1
        if mod(countdown, 2) == 0
            putmarker!(r)
        end
    end
end
