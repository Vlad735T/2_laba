package main

import (
	"fmt"
)

func Number_One() {
	fmt.Print("Введите количество дней на острове: ")
	var counter_of_Day int    // Объявляем переменную типа int
	fmt.Scan(&counter_of_Day) // Используем для считывания значения, введенного пользователем, и сохраняем его

	fmt.Print("Введите максимальное количество еды, которое можно купить в день: ")
	var max_bought_of_eat int
	fmt.Scan(&max_bought_of_eat)

	fmt.Print("Введите количество еды, которое необходимо съедать в день: ")
	var eaten_of_food int
	fmt.Scan(&eaten_of_food)

	cout_of_days := 1      // Количество дней когда мы пойдем в магазин. 1 (Сходит сразу в первый день)
	eaten_food_island := 0 // Количество съеденной еды

	if eaten_of_food > max_bought_of_eat { // Проверка на количество потребляемой и купленной еды
		fmt.Print(" Выжить невозможно, в день он потребляет еды больше, чем может купить ")
	} else {
		for i := 0; i < counter_of_Day; i++ { // Проходимся по каждому дню
			if i%7 == 0 { // Если не воскресенье
				if eaten_food_island < eaten_of_food { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
					eaten_food_island += max_bought_of_eat
					cout_of_days++
				}
				eaten_food_island -= eaten_of_food
			}

		}

		fmt.Print("Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: ", cout_of_days)

	}
}

func Number_Two() {

	fmt.Print("Введите количество цветов: ")
	var number_of_flowers int
	fmt.Scan(&number_of_flowers)

	fmt.Print("Введите емкость лейки: ")
	var capacity_of_leica int
	fmt.Scan(&capacity_of_leica)

	//Создаем срез с именем watering_the_flower, который содержит целочисленные значения и инициализируется
	//с помощью функции make. Функция make создает срез типа  int и указанной длины
	watering_the_flower := make([]int, number_of_flowers)

	count_of_liter_in_leica := capacity_of_leica          // Набираем полную емкость лейки
	steps := 0                                            // Количество шагов
	x := -1                                               // Начальная позиция
	remain_in_leica := 0                                  // Остаток в лейке
	water_in_leica := remain_in_leica + capacity_of_leica // Начальное количество воды в лейке

	if capacity_of_leica < 0 { // Если пользователь ввел отрицательное значение в емкость лейки
		fmt.Print("Ошибка ввода ")

	} else {
		for j := 0; j < number_of_flowers; j++ { // Цикл для ввода полива для каждого цветка
			fmt.Printf("Введите количество литров нужное %d для цветка\n", j)
			fmt.Scan(&watering_the_flower[j])
		}
		for i := 0; i < number_of_flowers; i++ { // Цикл для полива каждого цветка
			if water_in_leica < watering_the_flower[i] { // Условие на проверку хватает ли емкости лейки для полива цветка
				steps += (i * 2)                            // Идем к реке и возвращаемся обратно
				capacity_of_leica = count_of_liter_in_leica //Наполняем лейку
			}
			water_in_leica = capacity_of_leica - watering_the_flower[i] // Поливаем цветок
			steps++                                                     // Шаг + 1
			x++                                                         // Переходим на следующий цветок
		}
	}
	fmt.Printf("Количество шагов для полива всех цветов: %d\n", steps)
}

func Number_Three() {
	fmt.Print("Введите количество чисел: ")
	var n int
	fmt.Scan(&n)
	counter := 0              // Счетчик чисел чья сумма цифр > 10
	for i := 0; i <= n; i++ { // Проходимся по каждому введенному числу
		var chislo int
		fmt.Scan(&chislo)
		sum := 0
		for chislo > 0 { // Сумма цифр введенного числа
			sum += chislo % 10
			chislo /= 10
		}

		if sum > 10 { // Счетчик + 1
			counter++
		}
	}
	fmt.Printf("Количество чисел с суммой цифр больше 10: %d\n", counter)
}

func main() {
	var Exercise int // Объявляем переменную Exercise
	fmt.Println("Выберите задание: ")
	fmt.Scan(&Exercise) // Считываем значение и сохраняем его в переменную
	switch Exercise {   // Проверяем значение переменной Exercise
	case 1: // если Exercise = 1
		Number_One() // Вызов функции
	case 2:
		Number_Two()
	case 3:
		Number_Three()
	default:
		fmt.Println("Invalid choice")
	}
}
