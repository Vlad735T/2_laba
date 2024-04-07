import Foundation // Импорт фреймворка Foundation,
// Включает в себя множество классов, структур и функций

func Number_One() {
    var counter_of_Day = 0 // Объявляем переменную и присваиваем ей значение 0
    print("Введите количество дней на острове: ", terminator: "") // Выводим строка " без перехода на новую строку
    counter_of_Day = Int(readLine()!) ?? 0 // Считываем ввод пользователя с клавиатуры, преобразовываем его в целое число и присваиваем значение переменной 
    
    var max_bought_of_eat = 0
    print("Введите максимальное количество еды, которое можно купить в день: ", terminator: "")
    max_bought_of_eat = Int(readLine()!) ?? 0
    
    var eaten_of_food = 0
    print("Введите количество еды, которое необходимо съедать в день: ", terminator: "")
    eaten_of_food = Int(readLine()!) ?? 0
    
    var cout_of_days = 1 // Количество дней когда мы пойдем в магазин. 1 (Сходит сразу в первый день)
    var eaten_food_island = 0 // Количество съеденной еды
    
    if eaten_of_food > max_bought_of_eat {  // Проверка на количество потребляемой и купленной еды
        print("Выжить невозможно, в день он потребляет еды больше, чем может купить -1")
    } else {
        for i in 0..<counter_of_Day {
            if i % 7 == 0 { // Если не воскресенье
                if eaten_food_island < eaten_of_food { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
                    eaten_food_island += max_bought_of_eat
                    cout_of_days += 1
                }
                eaten_food_island -= eaten_of_food
            }
        }
        print("Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: \(cout_of_days)")
    }
}

func Number_Two() {
    print("Введите количество цветов: ")
    var number_of_flowers = 0 //Вводим количество цветов на даче
    number_of_flowers = Int(readLine()!) ?? 0
    print("Введите емкость лейки: ")
    var capacity_of_leica = 0 //Вводим емкость лейки
    capacity_of_leica = Int(readLine()!) ?? 0
    var watering_the_flower = [Int](repeating: 0, count: number_of_flowers) // массив типа Int, который инициализируется с нулевыми значениями и длиной number_of_flowers
    
    var count_of_liter_in_leica = capacity_of_leica // Набираем полную емкость лейки
    var steps = 0  // Количество шагов
    var x = -1 // Начальная позиция
    var remain_in_leica = 0 // Остаток в лейке
    var water_in_leica = remain_in_leica + capacity_of_leica // Начальное количество воды в лейке
    
    if capacity_of_leica < 0 { // Если пользователь ввел отрицательное значение в емкость лейки
        print("Ошибка ввода")
    } else {
        for j in 0..<number_of_flowers { // Цикл для ввода полива для каждого цветка
            print("Введите количество литров нужное \(j) для цветка")
            watering_the_flower[j] = Int(readLine()!) ?? 0
        }
        for i in 0..<number_of_flowers { // Цикл для полива каждого цветка
            if water_in_leica < watering_the_flower[i] { // Условие на проверку хватает ли емкости лейки для полива цветка
                steps += (i * 2) // Идем к реке и возвращаемся обратно
                capacity_of_leica = count_of_liter_in_leica //Наполняем лейку
            }
            water_in_leica = capacity_of_leica - watering_the_flower[i] // Поливаем цветок
            steps += 1 // Шаг + 1
            x += 1 // Переходим на следующий цветок
        }
    }
    print("Количество шагов для полива всех цветов: \(steps)")
}

func Number_Three() {
    print("Введите количество чисел")
    var n = 0
    n = Int(readLine()!) ?? 0
    var counter = 0 // Счетчик чисел чья сумма цифр > 10
    
    for _ in 0..<n { // Проходимся по каждому введенному числу
        print("Введите число: ")
        var chislo = 0
        chislo = Int(readLine()!) ?? 0
        var sum = 0
        while chislo != 0 { // Сумма цифр введенного числа
            sum += chislo % 10
            chislo /= 10
        }
        if sum > 10 { // Счетчик + 1
            counter += 1
        }
    }
    print("Количество чисел чья сумма больше 10: \(counter)")
}

func main() {
    setlocale(LC_ALL, "RUSSIAN")
    print("Выберите номер задания: ")
    var Exercise = 0
    Exercise = Int(readLine()!) ?? 0 // Считываем ввод пользователя и преобразовываем его в целое число
    switch Exercise { // Проверяем значение переменной Exercise
    case 1: // Если Exercise = 1, то вызываем функцию Number_One()
        Number_One() // Вызов функции
    case 2:
        Number_Two()
    case 3:
        Number_Three()
    default:
        break
    }
}
main()