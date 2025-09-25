#скопировано первое задание
using HorizonSideFix
r=Robot("исходник.sit",animate=true)
function move!!count(r,side,x,y)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
        if side in [Nord,Sud]
            y+=1
        end
        if side in [West,Ost]
            x+=1
        end
    end
    return x,y
end
function moveback!(r,side)
    while ismarker(r)==true
        move!(r,side)
    end
end
inverse(side::HorizonSide)=HorizonSide(mod(Int64(side)+2,4))
function crosscount(r)
    x=y=0
    for i in 0:3
        side=HorizonSide(i)
        x,y=move!!count(r,HorizonSide(i),x,y)
        moveback!(r,inverse(HorizonSide(i)))
    end
    print(x+1,y+1)
end
crosscount(r)