using System; // Получаем доступ к классам и методам, определенным в пространстве имен System. 
using System.Numerics; // Позволяет работать с числовыми типами данных и математическими функциями
using System.Runtime.Intrinsics; // Позволяет работать с аппаратными встроенными функциями для оптимизации производительности

class Program{ // Основной класс 
    static void Main(){ // Ключевое слово "static" означает, что метод Main принадлежит классу, а не экземпляру класса

        Console.WriteLine("Введите номер задания: ");
        int Exercise = int.Parse(Console.ReadLine()); //Ввод числа, которое преобразуется в int

        switch (Exercise){
            case 1: // Вызывается, если пользователь ввел 1
                Number_One(); // Вызывается функция Number_One()
                break; // Завершаем блок кода 
            case 2:
                Number_Two();
                break;
            case 3:
                Number_Three();
                break;
            default:
                break;
        }
    }


    static void Number_One() {

        Console.WriteLine("Введите количество дней на острове: ");
        int counter_of_Day = int.Parse(Console.ReadLine());

        Console.WriteLine("Введите максимальное количество еды, которое можно купить в день: ");
        int max_bought_of_eat = int.Parse(Console.ReadLine());

        Console.WriteLine("Введите количество еды, которое необходимо съедать в день: ");
        int eaten_of_food = int.Parse(Console.ReadLine());
 
        int cout_of_days = 1; // Количество дней когда мы пойдем в магазин. 1 (Сходит сразу в первый день)
        int eaten_food_island = 0; // Количество съеденной еды

        if (eaten_of_food > max_bought_of_eat){ // Проверка на количество потребляемой и купленной еды
            Console.WriteLine("Выжить невозможно, в день он потребляет еды больше, чем может купить ");
        }else {
            for (int i = 0; i < counter_of_Day; i++) { // Проходимся по каждому дню
                if (i % 7 == 0) { // Если не воскресенье
                    if (eaten_food_island < eaten_of_food){ // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
                        eaten_food_island += max_bought_of_eat;
                        cout_of_days++; 
                    }
                    eaten_food_island -= eaten_of_food;
                }

            }
            Console.WriteLine("Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: " + cout_of_days);
        }
    }

    static void Number_Two(){
        Console.WriteLine("Введите количество цветов: ");
        int number_of_flowers = int.Parse(Console.ReadLine());

        Console.WriteLine("Введите емкость лейки: ");
        int capacity_of_leica = int.Parse(Console.ReadLine());

        List<int> watering_the_flower = new List<int>(new int[number_of_flowers]); // Список watering_the_flower, который содержит целочисленные значения

        int count_of_liter_in_leica = capacity_of_leica; // Набираем полную емкость лейки
        int steps = 0;  // Количество шагов
        int x = -1; // Начальная позиция
        int remain_in_leica = 0; // Остаток в лейке
        int water_in_leica = remain_in_leica + capacity_of_leica; // Начальное количество воды в лейке

        if (capacity_of_leica < 0) { // Если пользователь ввел отрицательное значение в емкость лейки
            Console.WriteLine("Ошибка ввода ");
        }else {
            for (int j = 0; j < number_of_flowers; j++)
            {// Цикл для ввода полива для каждого цветка
                Console.WriteLine("Введите количество литров нужное " + j + " для цветка: ");
                watering_the_flower[j] = int.Parse(Console.ReadLine());

            }
            for (int i = 0; i < number_of_flowers; i++)
            { // Цикл для полива каждого цветка
                if (water_in_leica < watering_the_flower[i])
                { // Условие на проверку хватает ли емкости лейки для полива цветка
                    steps += (i * 2); // Идем к реке и возвращаемся обратно
                    capacity_of_leica = count_of_liter_in_leica; //Наполняем лейку
                }
                water_in_leica = capacity_of_leica - watering_the_flower[i]; // Поливаем цветок
                steps++; // Шаг + 1 
                x++; // Переходим на следующий цветок
            }
        }
        Console.WriteLine("Количество шагов для полива всех цветов: " + steps);
    }

    static void Number_Three() {
        Console.WriteLine("Введите количество чисел: ");
        int n = int.Parse(Console.ReadLine());
        int counter = 0; // Счетчик чисел чья сумма цифр > 10
        for (int i = 0; i < n; i++){ // Проходимся по каждому введенному числу
            Console.WriteLine("Введите " + i + " число ");
            int chislo = int.Parse(Console.ReadLine());
            int sum = 0; 
            while (chislo != 0){ // Сумма цифр введенного числа
                sum += chislo % 10;
                chislo /= 10;
            }

            if (sum > 10){ // Счетчик + 1
                counter++;
            }
        }
        Console.WriteLine("Количество чисел чья сумма больше 10: " + counter); // Вывод

    }
}









//static void Number_One()
//{
//    Console.WriteLine("Введите строку:");
//    string stroka = Console.ReadLine();
//    string vowels = "AaEeIiOoUu";
//    string consonants = "BbCcDdFfGgHhJjKkLlMmNnPpQqRrSsTtVvWwXxZz";
//    int count_of_vowels = 0;
//    int count_of_consonant = 0;

//    foreach (char c in stroka)
//    {// Функция,которая проходится по каждому элементу в строке

//        if (char.IsLetter(c))
//        { // Счетчик гласных
//            if (vowels.Contains(c))
//            {
//                count_of_vowels++;
//            }
//        }
//        if (char.IsLetter(c))
//        { // Счетчик гласных
//            if (consonants.Contains(c))
//            {
//                count_of_consonant++;
//            }
//        }
//    }

//    if (count_of_vowels > count_of_consonant)
//    {
//        Console.WriteLine("Да");
//    }
//    else if (count_of_vowels < count_of_consonant)
//    {
//        Console.WriteLine("Нет");
//    }
//    else
//    {
//        Console.WriteLine("Одинаково");
//    }
//}