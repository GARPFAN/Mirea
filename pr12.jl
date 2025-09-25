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
function move!!(r,side)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
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
function final2(r::Robot)
    bikinibottom(r)
    x,y=bikinibottom(r)
    sides=[Ost,Nord,West,Sud]
    for side in sides
        move!!(r,side)
    end
    turnbase(r,x,y)
end
r=Robot("исходник.sit",animate=true)
final2(r)

