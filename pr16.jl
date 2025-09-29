using HorizonSideFix
function task6()
    r  = Robot("16.sit",animate = true)
    # проверяем все 4 направления
    function paintAll(r)
    if !ismarker(r)
        putmarker!(r)
    end
    for dir in 0:3
        side = HorizonSide(dir)
        if !isborder(r, side)
            move!(r, side)
            
            # если в новой клетке ещё нет маркера, идём рекурсивно
            if !ismarker(r)
                paintAll(r)
            end
            
            # возвращаемся обратно
            back = HorizonSide(mod(dir+2, 4))
            move!(r, back)
        end
    end
    end
    paintAll(r)
end
task6()