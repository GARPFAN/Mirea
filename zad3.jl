using HorizonSideRobots
include("Project1.jl")

# 3. Написать функцию с контрактом:
# ДАНО: Робот - в произвольной клетке прямоугольного поля без внуренних
# перегородок
# РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промаркированы в шахматном порятке 


function zad3!(robot)
    # идём в нижний левый угол + записываем начальные координаты
    x, y = go_to_corner!(robot)
    # если переменная нечётная - ставим 
    mark_or_not_mark = x + y + 1
    # задаём направление (право)
    direction = Ost
    # местный костыль 
    putmarker_if_can!(robot, mark_or_not_mark + 1)
    # функция работает пока робот не будет сверху
    while !(isborder(robot, Nord))
        # идёт по строкам, шагает наверх после прохода по строке и меняет направление
        mark_or_not_mark = go_to_border_chess!(robot, direction, mark_or_not_mark)
        move!(robot, Nord)
        putmarker_if_can!(robot, mark_or_not_mark)
        mark_or_not_mark += 1
        direction = reverse_direction(direction)
    end
    # проход по последней (самой верхней) строке
    go_to_border_chess!(robot, direction, mark_or_not_mark)
    go_to_corner!(robot)
    # возвращаемся в начальное положение
    move!(robot, Nord, y)
    move!(robot, Ost, x)
end


robot = Robot("исходник.sit", animate=true)
zad3!(robot)
