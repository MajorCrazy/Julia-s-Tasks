using HorizonSideRobots
r=Robot(15,15;animate=true)

function square!(r)
    num_stepsv=0
    num_stepsg=0
    while !isborder(r, Sud)
        move!(r, Sud)
        num_stepsv+=1
    end
    while !isborder(r, West)
        move!(r, West)
        num_stepsg+=1
    end
    for side in (Nord, Ost, Sud, West)    
        while !isborder(r, side) && !ismarker(r)
            along!(r)
        end
    end
    num_stepsg1=0
    num_stepsv1=0
    while num_stepsg1!=num_stepsg
        move!(r, Ost)
        num_stepsg1+=1
    end
    while num_stepsv1!=num_stepsv
        move!(r, Nord)
        num_stepsv1+=1
    end
end

function along!(r)
    for side in (Nord, Ost, Sud, West)
        while !isborder(r, side)
            putmarker!(r)
            move!(r, side)
        end
    end
end