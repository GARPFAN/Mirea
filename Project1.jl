using HorizonSideRobots
# ВСЕ ВСПОМОГАТЕЛЬНЫЕ ФУНКИИ И ОТМЕТКА ЗАДАНИЙ, ГДЕ ОНИ ИСПОЛЛЬЗУЮТСЯ


#  3
function HorizonSideRobots.move!(robot, side, steps)
    for _ in 1:steps
    move!(robot, side)
    end
end


# 1 2 3
# для 3 модификация в виде ретурна с количеством шагов
function go_to_border!(robot, side::HorizonSide)
    steps = 0
    while !isborder(robot, side)
        move!(robot, side)
        steps += 1
    end
    return steps
end


function go_to_border_with_skoring_markers!(robot, side::HorizonSide)
    steps = 0
    marks = 0 
    while !isborder(robot, side)
        move!(robot, side)
        steps += 1
    end
    return steps
end


# 1 2 3 
function go_to_corner!(robot, first_side=Sud, second_side=West)
    # по дефолту нижний левый угол 
    y = go_to_border!(robot, first_side) 
    x = go_to_border!(robot, second_side) 
    return x, y
end 

# 1 
function go_to_border_withmarker!(robot, side::HorizonSide)
    putmarker!(robot)
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
end


# 3 
function go_to_border_chess!(robot, side::HorizonSide, mark_or_not_mark )
    while !isborder(robot, side)
        move!(robot, side)
        if mark_or_not_mark % 2 == 0
            putmarker!(robot)
        end
        mark_or_not_mark += 1
    end
    return mark_or_not_mark
end


# 3 
function putmarker_if_can!(robot, mark_or_not_mark)
    if mark_or_not_mark % 2 == 0
            putmarker!(robot)
    end
end


# 1
function reverse_direction(side::HorizonSide)
    if side == West
        return Ost
    elseif side == Ost
        return West
    end
end



# Функции из заданий 
# -------------------------------------------


# + используется в 3 задании 
function zad1!(robot)
    # сначала идём в угол (нижний левый)
    go_to_corner!(robot)
    # задаём направление (право)
    direction = Ost
    # функция работает пока робот не будет сверху
    while !(isborder(robot, Nord))
        # идёт по строкам, шагает наверх после прохода по строке и меняет направление
        go_to_border_withmarker!(robot, direction)
        move!(robot, Nord)
        direction = reverse_direction(direction)
    end
    # проход по последней (самой верхней) строке
    go_to_border_withmarker!(robot, direction)
end 


function zad2!(robot)
    # идём в нижний левый угол 
    go_to_corner(robot)
    # выполняем цикл "ползём по краю"
    for side in (Nord, Ost, Sud, West)
        while !(isborder(robot, side))
            putmarker!(robot)
            move!(robot, side)
        end
        putmarker!(robot)
    end
end


function zad3!(robot)
    # идём в нижний левый угол + записываем начальные координаты
    x, y = go_to_corner!(robot)
    zad1!(robot)
    go_to_corner!(robot)
    move!(robot, Nord, y)
    move!(robot, Ost, x)
end



# --------------------------------------------
# реализовать бы inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 
