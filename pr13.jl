using HorizonSideFix
r=Robot("исходник.sit",animate=true)
function bikinibottom_chess(r::Robot,n::Int)
    x=y=0
    while !isborder(r,West)
        n=marker_chess(r,n)
        move!(r,West)
        x+=1
    end
    while !isborder(r,Sud)
        n=marker_chess(r,n)
        move!(r,Sud)
        y+=1
    end
    return x,y,n
end
function marker_chess(r::Robot,n::Int)
    if !ismarker(r) && n==0
        putmarker!(r)
        n+=1
    elseif n==1
        n-=1
    elseif ismarker(r)
        n+=1
    end
    return n
end
function move!!chess(r::Robot,side::HorizonSide,n::Int)
    while !isborder(r,side)
        n=marker_chess(r,n)
        move!(r,side)
    end
    n=marker_chess(r,n)
    return n
end
function turnbase(r::Robot,x,y)
    while !isborder(r,West)
        move!(r,West)
    end
    while !isborder(r,Sud)
        move!(r,Sud)
    end
    for i in 1:x
        move!(r,Ost)
    end
    for i in 1:y
        move!(r,Nord)
    end
end
function bucket_chess(r::Robot,n::Int)
    while !isborder(r,Ost)
        if isborder(r,Nord)
            n=move!!chess(r,Sud,n)
            move!(r,Ost)
        else
            n=move!!chess(r,Nord,n)
            move!(r,Ost)
        end
    end
    if isborder(r,Nord)
        move!!chess(r,Sud,n)   
    else
        move!!chess(r,Nord,n)
    end
end
#bikinibottom_chess(r,0)
#x,y,n=bikinibottom_chess(r,0)
#move!!chess(r,Nord,n)
function final3(r::Robot)
    bikinibottom_chess(r,0)
    x,y,n=bikinibottom_chess(r,0)
    bucket_chess(r,n)
    turnbase(r,x,y)

end
final3(r)