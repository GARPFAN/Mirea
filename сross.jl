using HorizonSideFix
r=Robot("исходник.sit",animate=true)
function move!!(r,side)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
function moveback!(r,side)
    while ismarker(r)==true
        move!(r,side)
    end
end
inverse(side::HorizonSide)=HorizonSide(mod(Int64(side)+2,4))
function cross(r)
    for i in 0:3
        side=HorizonSide(i)
        move!!(r,HorizonSide(i))
        moveback!(r,inverse(HorizonSide(i))) 
    end
end
cross(r)

