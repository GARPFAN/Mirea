#в левый нижний угол с выводом координат начальной точки
function bikinibottom(r::Robot)
    x=y=0
    while isborder(r,West)==false
        move!(r,West)
        x+=1
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
        y+=1
    end
    return x,y
end
#inverse(side::HorizonSide)=HorizonSide(mod(Int64(side)+2,4))
#заливка строки
function move!!(r,side)
    putmarker!(r)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
#возврат на начало
function turnbase(r::Robot,x=Int,y=Int)
    while isborder(r,West)==false
        move!(r,West)
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
    end
    for i in range(1,x)
        move!(r,Ost)
    end
    for i in range(1,y)
        move!(r,Nord)
    end
end
#заливка поля
function bucket(r::Robot)
    while !isborder(r,Ost)
        if isborder(r,Nord)
            move!!(r,Sud)
            move!(r,Ost)
        else
            move!!(r,Nord)
            move!(r,Ost)
        end
    end
    if isborder(r,Nord)
        move!!(r,Sud)
    
    else
        move!!(r,Nord)
    end
end