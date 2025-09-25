using HorizonSideFix
r=Robot("исходник.sit",animate=true)
function move!!x(r,side)
    x=y=0
    side2=HorizonSide(mod(Int64(side)+1,4))
    while !isborder(r,side) && !isborder(r,side2)
        move!(r,side)
        move!(r,side2)
        x+=1
        y+=1
        putmarker!(r)
    end
    return x,y
end
function movebackx(r,x,y,side)
    for i in 1:x
        move!(r,HorizonSide(mod(Int64(side)+2,4)))
    end
    for i in 1:y
        move!(r,HorizonSide(mod(Int64(side)+3,4)))
    end
end
inverse(side::HorizonSide)=HorizonSide(mod(Int64(side)+2,4))
function crossx(r)
    for i in 0:3
        x,y=move!!x(r,HorizonSide(i))
        movebackx(r,x,y,HorizonSide(i))
    end
end
crossx(r)

