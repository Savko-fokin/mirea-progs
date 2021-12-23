using HorizonSideRobots


function main(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    print(num_vert)
    print(num_hor)

    height_box = moves!(r, Nord)
    print(height_box)

    z_down(height_box)
    vygol()
    home(num_vert,num_hor)
end

function home(num_vert,num_hor)
    moves!(r, Nord, num_vert)
    moves!(r, Ost, num_hor)
end 

function z_down(height_box)
    for i in 1:height_box 
        putmarker!(r)
        putmarkers!(r, Ost)
        move!(r,Sud)
        
        moves!(r,West)
    end
    putmarker!(r)
    putmarkers!(r, Ost)
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

r=Robot(5,5, animate=true)
