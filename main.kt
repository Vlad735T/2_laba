fun Number_One(){
    println("Enter the number of days on the island: ")
    val counter_of_Day = readLine()?.toInt()?:0 // Объявляем переменную и присваиваем ей значение, которое пользователь вводит с клавиатуры.
    // readLine() считывает строку ввода пользователя, а функция toInt() преобразует эту строку в целое число. 
    // оператор ? присваивает 0 counter_of_Day, если пользователь ничего не ввел
    println("Enter the maximum amount of food you can buy per day: ")
    val max_bought_of_eat = readLine()?.toInt()?:0

    println("Enter the amount of food you need to eat per day: ")
    val eaten_of_food = readLine()?.toInt()?:0

	var cout_of_days = 1 // Количество дней когда мы пойдем в магазин. 1 (Сходит сразу в первый день)
	var eaten_food_island = 0 // Количество съеденной еды

	if (eaten_of_food > max_bought_of_eat) {  // Проверка на количество потребляемой и купленной еды
        println("It is impossible to survive, he consumes more food per day than he can buy ")
	}else {
		for (i in 0 until counter_of_Day) { // Проходимся по каждому дню
			if (i % 7 == 0) { // Если не воскресенье
				if (eaten_food_island < eaten_of_food) { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
					eaten_food_island += max_bought_of_eat
					cout_of_days++
				}
				eaten_food_island -= eaten_of_food
			}
		}
        println("The minimum number of days when you need to buy food in the store to survive: $cout_of_days")
	}
}

fun Number_Two() {
    println("Enter the number of flowers: ") // Объявляем переменную и присваиваем ей значение, которое пользователь вводит с клавиатуры.
    val number_of_flowers = readLine()?.toInt()?:0

    println("Enter the watering can capacity: ")
    var capacity_of_leica = readLine()?.toInt()?:0
    
    val watering_the_flower = mutableListOf<Int>() // Изменяемый список  типа Int с помощью функции mutableListOf().


	val count_of_liter_in_leica = capacity_of_leica // Набираем полную емкость лейки
	var steps = 0  // Количество шагов
	var x = -1 // Начальная позиция
	var remain_in_leica = 0 // Остаток в лейке
	var water_in_leica = remain_in_leica + capacity_of_leica // Начальное количество воды в лейке

	if (capacity_of_leica < 0) { // Если пользователь ввел отрицательное значение в емкость лейки
        println("Input error")
	}else {

		for (j in 0 until number_of_flowers) {// Цикл для ввода полива для каждого цветка
            println("Enter the required number of liters $j for flower")
            watering_the_flower.add(readLine()?.toInt()?:0)
		}
		for (i in 0 until number_of_flowers) { // Цикл для полива каждого цветка
			if (water_in_leica < watering_the_flower[i]) { // Условие на проверку хватает ли емкости лейки для полива цветка
				steps += (i * 2) // Идем к реке и возвращаемся обратно
                capacity_of_leica = count_of_liter_in_leica //Наполняем лейку
			}
            water_in_leica = capacity_of_leica - watering_the_flower[i] // Поливаем цветок
			steps++ // Шаг + 1 
			x++ // Переходим на следующий цветок
		}
	}
    println("The number of steps for watering all flowers: $steps")
}

fun Number_Three() {
    var count = 0
    println("Enter the number of numbers: ")
    val n = readLine()?.toInt() ?: 0 // Объявляем переменную и присваиваем ей значение, которое пользователь вводит с клавиатуры.
    for (i in 0 until n) { // Проходимся по каждому введенному числу
        println("Enter a number: ")
        val number = readLine()?.toInt() ?: 0
        var sum = 0
        var temp = number
        while (temp != 0) { // Сумма цифр введенного числа
            sum += temp % 10
            temp /= 10
        }
        if (sum > 10) { // Счетчик + 1
            count++
        }
    }
    println("The number of numbers whose sum of digits is greater than 10: $count")
}
    
fun main() { // Функия main
    println("Select a number") // Выберите номер
    when(readLine()?.toInt()) { // Конструкция when считывает ввод пользователя 
        1 -> Number_One() // Если пользователь ввел 1, то вызывается функция Number_One()
        2 -> Number_Two()
        3 -> Number_Three()
        else -> println("Некорректный выбор")
    }
}