using HorizonSideRobots
function main(r::Robot)
    ugol(Nord,Ost)
end

function ugol(west1,west2)
    
    while (isborder(r,west1)==false) || (isborder(r,west2)==false)
        while isborder(r,west1)==false
            moves!(r,west1)
        end
        while isborder(r,west2)==false
            moves!(r,west2)
        end
        #move!(r,west2)
        #move!(r,west1)
        #move!(r,inverse(west1))
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


r=Robot("5.sit", animate=true)
