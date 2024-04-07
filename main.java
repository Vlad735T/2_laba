import java.util.*; // Импорт всех классов из пакета java.util. 

class Program{ 
	public static void main(String[] args){
	Scanner scanner = new Scanner(System.in); // Создаем Scanner для считывания ввода с клавиатуры
	System.out.println("Введите номер задания: ");
	int Exercise = scanner.nextInt();
	switch (Exercise) {
		case 1:
		Number_One();
		break;
		case 2:
		Number_Two();
		break;
		case 3:
		Number_Three();
		break;
	}

	}
	static void Number_One() {
		System.out.print("Введите количество дней на острове: ");
		Scanner scanner = new Scanner(System.in);
		int counter_of_Day = scanner.nextInt();
		
		System.out.print("Введите максимальное количество еды, которое можно купить в день: ");
		int max_bought_of_eat = scanner.nextInt();

		System.out.print("Введите количество еды, которое необходимо съедать в день: ");
		int eaten_of_food = scanner.nextInt();
		
		int cout_of_days = 1; // Количество дней когда мы пойдем в магазин. 1 (потому что один раз путешественник точно сходит в магазин)
		int eaten_food_island = 0; // Количество съеденной еды
	
		if (eaten_of_food > max_bought_of_eat) {  // Проверка на количество потребляемой и купленной еды
			System.out.print("Выжить невозможно, в день он потребляет еды больше, чем может купить ");
		}else {
			for (int i = 0; i < counter_of_Day; i++) { // Проходимся по каждому дню
				if (i % 7 == 0) { // Если не воскресенье
					if (eaten_food_island < eaten_of_food) { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
						eaten_food_island += max_bought_of_eat;
						cout_of_days++;
					}
					eaten_food_island -= eaten_of_food;
				}
	
			}
			System.out.print("Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: " + cout_of_days);
		}
	}
	
    static void Number_Two(){
		Scanner scanner = new Scanner(System.in);

		System.out.print("Введите количество цветов: ");
		int number_of_flowers = scanner.nextInt();

		System.out.print("Введите емкость лейки: ");
		int capacity_of_leica = scanner.nextInt();
   
        List<Integer> watering_the_flower = new ArrayList<>(); // Новый список, который содержит целочисленные значения.

        int count_of_liter_in_leica = capacity_of_leica; // Набираем полную емкость лейки
        int steps = 0;  // Количество шагов
        int x = -1; // Начальная позиция
        int remain_in_leica = 0; // Остаток в лейке
        int water_in_leica = remain_in_leica + capacity_of_leica; // Начальное количество воды в лейке

        if (capacity_of_leica < 0) { // Если пользователь ввел отрицательное значение в емкость лейки
			System.out.print("Ошибка ввода ");
        }else {
            for (int j = 0; j < number_of_flowers; j++){// Цикл для ввода полива для каждого цветка
				System.out.print("Введите количество литров нужное " + j + " для цветка: ");
				int input = scanner.nextInt();
				watering_the_flower.add(input);
            }
            for (int i = 0; i < number_of_flowers; i++){ // Цикл для полива каждого цветка
                if (water_in_leica < watering_the_flower.get(i)){ // Условие на проверку хватает ли емкости лейки для полива цветка
                    steps += (i * 2); // Идем к реке и возвращаемся обратно
                    capacity_of_leica = count_of_liter_in_leica; //Наполняем лейку
                }
                water_in_leica = capacity_of_leica - watering_the_flower.get(i); // Поливаем цветок
                steps++; // Шаг + 1 
                x++; // Переходим на следующий цветок
            }
        }
		System.out.printf("Количество шагов для полива всех цветов: %d",  steps);
    }

	
	static void Number_Three() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Введите количество чисел");
		int n = sc.nextInt();
		int counter = 0; // Счетчик чисел чья сумма цифр > 10
		for (int i = 0; i < n; i++) { // Проходимся по каждому введенному числу
			int chislo = sc.nextInt();
			int sum = 0;
			while (chislo != 0) { // Сумма цифр введенного числа
				sum += chislo % 10;
				chislo /= 10;
			}
			if (sum > 10) { // Счетчик + 1
				counter++;
			}
		}
		System.out.printf("Введите количество чисел = %d", counter);
	}
}




// static void Number_One() {
	// 	String vowels = "AaEeIiOoUuYy";
	// 	String consonants = "BbCcDdFfGgHhJjKkLlMmNnPpQqRrSsTtVvWwXxZz";
	
// 	Scanner scanner = new Scanner(System.in);
	// 	System.out.print("Введите строку: ");
	// 	String stroka = scanner.nextLine();
	
// 	int count_of_vowels = 0; // Количество гласных
	// 	int count_of_consonant = 0; // Количество согласных
	
// toCharArray - преобразует введенную строку в массив символов
	// /glasnie - индекс
	// 	for (char glasnie : stroka.toCharArray()) {// Функция считает количество гласных в строке (проходя по каждому символу)
	// 		if (vowels.indexOf(glasnie) != -1) { // -1 означет,что мы не нашли символ в массиве
	// 			count_of_vowels++;
	// 		} 
	// 	}
	
// 	  for (char soglasnie : stroka.toCharArray()) {
	// 		if (consonants.indexOf(soglasnie) != -1) {
	// 			count_of_consonant++;
	// 		} 
	// 	}

// 	if (count_of_vowels > count_of_consonant) {
	// 		System.out.println("Yes");
	// 	} else if (count_of_vowels < count_of_consonant) {
	// 		System.out.println("No");
	// 	} else {
	// 		System.out.println("Identical");
	// 	}
	
// }
