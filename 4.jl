using HorizonSideRobots

function main(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)

    paint()
    
    vygol()
    home(num_vert,num_hor)
end

function home(num_vert,num_hor)
    moves!(r, Nord, num_vert) 
    moves!(r, Ost, num_hor)
end 

function paint()
    i = 0
    while isborder(r,Nord)==false
        
        moves!(r,Ost)
        
        for i in 1:i
            move!(r,West)
        end
        putmarker!(r)
        putmarkers!(r,West)
        
        move!(r,Nord)
        putmarker!(r)
        i = i + 1
    end
end

function vygol()
    moves!(r, Sud)
    moves!(r, West)
end




function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end

function moves!(r::Robot, side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps # символ "_" заменяет фактически не используемую переменную
        move!(r,side)
    end
end


r=Robot(5,5,animate=true)
