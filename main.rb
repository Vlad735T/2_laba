# Подключаем модуль. Предоставляет доступ к операциям ввода-вывода
require 'io/console' 

def number_one
  print "Введите количество дней на острове: "
# Функция gets.chomp используется для получения ввода с клавиатуры
# Метод to_i преобразует введенное значение в целое число
  counter_of_day = gets.chomp.to_i
  
  print "Введите максимальное количество еды, которое можно купить в день: "
  max_bought_of_eat = gets.chomp.to_i
  
  print "Введите количество еды, которое необходимо съедать в день: "
  eaten_of_food = gets.chomp.to_i
  
  count_of_days = 1 # Количество дней когда мы пойдем в магазин. 1 (Сходит сразу в первый день)
  eaten_food_island = 0 # Количество съеденной еды
  
  if eaten_of_food > max_bought_of_eat
    puts "Выжить невозможно, в день он потребляет еды больше, чем может купить -1"
  else
    (0...counter_of_day).each do |i|
      if i % 7 == 0 # Если не воскресенье
        if eaten_food_island < eaten_of_food # Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
          eaten_food_island += max_bought_of_eat
          count_of_days += 1
        end
        eaten_food_island -= eaten_of_food
      end
    end
    puts "Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: #{count_of_days}"
  end
end

def number_two
  print "Введите количество цветов: "
  number_of_flowers = gets.chomp.to_i # Вводим количество цветов на даче
  
  print "Введите емкость лейки: "
  capacity_of_leica = gets.chomp.to_i # Вводим емкость лейки
  
  watering_the_flower = Array.new(number_of_flowers) # массив с заданным количеством элементов
  
  count_of_liter_in_leica = capacity_of_leica # Набираем полную емкость лейки
  steps = 0 # Количество шагов
  x = -1 # Начальная позиция
  remain_in_leica = 0 # Остаток в лейке
  water_in_leica = remain_in_leica + capacity_of_leica # Начальное количество воды в лейке
  
  if capacity_of_leica < 0 # Если пользователь ввел отрицательное значение в емкость лейки
    puts "Ошибка ввода"
  else
    (0...number_of_flowers).each do |j| # Цикл для ввода полива для каждого цветка
      print "Введите количество литров нужное #{j} для цветка: "
      watering_the_flower[j] = gets.chomp.to_i
    end
    (0...number_of_flowers).each do |i| # Цикл для полива каждого цветка
      if water_in_leica < watering_the_flower[i] # Условие на проверку хватает ли емкости лейки для полива цветка
        steps += (i * 2) # Идем к реке и возвращаемся обратно
        capacity_of_leica = count_of_liter_in_leica # Наполняем лейку
      end
      water_in_leica = capacity_of_leica - watering_the_flower[i] # Поливаем цветок
      steps += 1 # Шаг + 1
      x += 1 # Переходим на следующий цветок
    end
  end
  puts "Количество шагов для полива всех цветов: #{steps}"
end

def number_three
  print "Введите количество чисел"
  n = gets.chomp.to_i
  counter = 0 # Счетчик чисел чья сумма цифр > 10
  
  (0...n).each do |i| # Проходимся по каждому введенному числу
    print "Введите число: "
    chislo = gets.chomp.to_i
    sum = 0
    while chislo != 0 # Сумма цифр введенного числа
      sum += chislo % 10
      chislo /= 10
    end
    counter += 1 if sum > 10 # Счетчик + 1
  end
  puts "Количество чисел чья сумма больше 10: #{counter}"
end


puts "Выберите номер задания" # Вывод текста
exercise = gets.chomp.to_i # Ввод числа от пользователя и преобразовываем его в целое число
case exercise # Конструкции case, которая проверяет значение переменной 
    when 1 # Если exercise = 1, то вызываем функцию number_one
        number_one 
    when 2
        number_two
    when 3
        number_three
end

