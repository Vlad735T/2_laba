#include <iostream>
#include <vector>

using namespace std;

void Number_One() {
	int counter_of_Day = 0;
	cout << "Введите количество дней на острове: ";
	cin >> counter_of_Day;
	///
	int max_bought_of_eat = 0;
	cout << "Введите максимальное количество еды, которое можно купить в день: ";
	cin >> max_bought_of_eat;
	///
	int eaten_of_food = 0;
	cout << "Введите количество еды, которое необходимо съедать в день: ";
	cin >> eaten_of_food;
	///
	int cout_of_days = 1 ; // Количество дней когда мы пойдем в магазин.
	int eaten_food_island = 0; // Количество съеденной еды

	if (eaten_of_food > max_bought_of_eat) {  // Проверка на количество потребляемой и купленной еды
		cout << "Выжить невозможно, в день он потребляет еды больше, чем может купить " << -1 << endl;
	}else {
		for (int i = 0; i < counter_of_Day; i++) {// Проходимся по каждому дню
			if (i % 7 != 0) { // Если не воскресенье
				if (eaten_food_island < eaten_of_food) { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
					eaten_food_island += max_bought_of_eat;
					cout_of_days++;
				}
			eaten_food_island -= eaten_of_food;
			}

		}
		cout << "Минимальное количество дней, когда нужно покупать еду в магазине чтобы выжить: " << cout_of_days << endl;
	}
}

void Number_Two() {
	cout << "Введите количество цветов: ";
	int number_of_flowers; //Вводим количество цветов на даче
	cin >> number_of_flowers;
	cout << "Введите емкость лейки: ";
	int capacity_of_leica; 	//Вводим емкость лейки
	cin >> capacity_of_leica;
	vector<int> watering_the_flower(number_of_flowers);// Контейнер, который хранит в себе определенный полив для каждого цветка

	int count_of_liter_in_leica = capacity_of_leica; // Набираем полную емкость лейки
	int steps = 0;  // Количество шагов
	int x = -1; // Начальная позиция
	int remain_in_leica = 0; // Остаток в лейке
	int water_in_leica = remain_in_leica + capacity_of_leica; // Начальное количество воды в лейке

	if (capacity_of_leica < 0) { // Если пользователь ввел отрицательное значение в емкость лейки
		cout << "Ошибка ввода " << endl;
	}
	else {
		for (int j = 0; j < number_of_flowers; j++) {// Цикл для ввода полива для каждого цветка
			cout << "Введите количество литров нужное " << j << " для цветка: ";
			cin >> watering_the_flower[j];
		}
		for (int i = 0; i < number_of_flowers; i++) { // Цикл для полива каждого цветка
			if (water_in_leica < watering_the_flower[i]) { // Условие на проверку хватает ли емкости лейки для полива цветка
				steps += (i * 2); // Идем к реке и возвращаемся обратно
				capacity_of_leica = count_of_liter_in_leica; //Наполняем лейку
			}
			water_in_leica = capacity_of_leica - watering_the_flower[i]; // Поливаем цветок
			steps++; // Шаг + 1 
			x++; // Переходим на следующий цветок
		}
	}
	cout << "Количество шагов для полива всех цветов: " << steps << endl;
}

void Number_Three() {
	cout << "Введите количество чисел: ";
	int n;
	cin >> n;
	int counter = 0; // Счетчик чисел чья сумма цифр > 10

	for (int i = 0; i < n; i++) { // Проходимся по каждому введенному числу
		int chislo;
		cin >> chislo;
		int sum = 0;
		while (chislo != 0) { // Сумма цифр введенного числа
			sum += chislo % 10;
			chislo /= 10;
		}
		if (sum > 10) { // Счетчик + 1
			counter++;
		}
	}
	cout << "Количество чисел чья сумма больше 10: " << counter;
}

int main() {
	setlocale(LC_ALL, "RUSSIAN");
	cout << "Выберите номер задания: ";
	int Exercise = 0;
	cin >> Exercise;
	switch (Exercise) { // Выбираем номер задания с помощью оператора switch
	case 1:
		Number_One(); // Вызываем функцию с именем Number_One, если значение Exercise = 1.
		break;
	case 2:
		Number_Two();
		break;
	case 3:
		Number_Three();
		break;
	default:
		break;
	}
	return 0;
}


