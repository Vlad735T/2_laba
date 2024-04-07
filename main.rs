//Импорт модуля std::io, который предоставляет работу с вводом и выводом данных. 
//Он содержит различные структуры, типы и функции, которые могут быть использованы для чтения и записи данных.
use std::io;

fn number_one() {
    let mut counter_of_day = String::new(); // Создаем переменную типа String и инициализируем ее пустой строкой
    println!("Введите количество дней на острове: "); // Вывод сообщения
    io::stdin().read_line(&mut counter_of_day).expect("Failed to read line"); // Чтение ввода пользователя с помощью io::stdin() и запись введенного значения в переменную. .expect ошибка при чтении
    let counter_of_day: i32 = counter_of_day.trim().parse().expect("Please enter a number"); // Преобразуем строку в int32 , .trim удаляет пробелы

    let mut max_bought_of_eat = String::new();
    println!("Введите максимальное количество еды, которое можно купить в день: ");
    io::stdin().read_line(&mut max_bought_of_eat).expect("Failed to read line");
    let max_bought_of_eat: i32 = max_bought_of_eat.trim().parse().expect("Please enter a number");

    let mut eaten_of_food = String::new();
    println!("Введите количество еды, которое необходимо съедать в день: ");
    io::stdin().read_line(&mut eaten_of_food).expect("Failed to read line");
    let eaten_of_food: i32 = eaten_of_food.trim().parse().expect("Please enter a number");

    let mut cout_of_days = 1; // Количество дней когда мы пойдем в магазин. 1 (Сходит сразу в первый день)
    let mut eaten_food_island = 0; // Количество съеденной еды

    if eaten_of_food > max_bought_of_eat { // Проверка на количество потребляемой и купленной еды
        println!("Выжить невозможно, в день он потребляет еды больше, чем может купить {}", -1);
    } else {
        for i in 0..counter_of_day { // Проходимся по каждому дню
            if i % 7 == 0 { // Если не воскресенье
                if eaten_food_island < eaten_of_food { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
                    eaten_food_island += max_bought_of_eat;
                    cout_of_days += 1;
                }
                eaten_food_island -= eaten_of_food;
            }
        }
        println!("Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: {}", cout_of_days);
    }
}

fn number_two() {
    let mut number_of_flowers = String::new();
    println!("Введите количество цветов: ");
    io::stdin().read_line(&mut number_of_flowers).expect("Failed to read line");
    let number_of_flowers: i32 = number_of_flowers.trim().parse().expect("Please enter a number");

    let mut capacity_of_leica = String::new();
    println!("Введите емкость лейки: ");
    io::stdin().read_line(&mut capacity_of_leica).expect("Failed to read line");
    let capacity_of_leica: i32 = capacity_of_leica.trim().parse().expect("Please enter a number");

    // Инициализируем watering_the_flower вектором с нулями длиной, равной числу цветов number_of_flowers.
    let mut watering_the_flower: Vec<i32> = vec![0; number_of_flowers as usize]; 

    let mut count_of_liter_in_leica = capacity_of_leica; // Набираем полную емкость лейки
    let mut steps = 0; // Количество шагов
    let mut x = -1; // Начальная позиция
    let mut remain_in_leica = 0; // Остаток в лейке
    let mut water_in_leica = remain_in_leica + capacity_of_leica; // Начальное количество воды в лейке

    if capacity_of_leica < 0 { // Если пользователь ввел отрицательное значение в емкость лейки
        println!("Ошибка ввода ");
    } else {
        for j in 0..number_of_flowers { // Цикл для ввода полива для каждого цветка
            let mut watering_flower = String::new();
            println!("Введите количество литров нужное {} для цветка", j);
            io::stdin().read_line(&mut watering_flower).expect("Failed to read line");
            watering_the_flower[j as usize] = watering_flower.trim().parse().expect("Please enter a number");
        }
        for i in 0..number_of_flowers { // Цикл для полива каждого цветка
            if water_in_leica < watering_the_flower[i as usize] { // Условие на проверку хватает ли емкости лейки для полива цветка
                steps += (i * 2); // Идем к реке и возвращаемся обратно
                count_of_liter_in_leica = capacity_of_leica; // Наполняем лейку
            }
            water_in_leica = capacity_of_leica - watering_the_flower[i as usize]; // Поливаем цветок
            steps += 1; // Шаг + 1
            x += 1; // Переходим на следующий цветок
        }
    }
    println!("Количество шагов для полива всех цветов: {}", steps);
}

fn number_three() {
    let mut n = String::new();
    println!("Введите количество чисел");
    io::stdin().read_line(&mut n).expect("Failed to read line");
    let n: i32 = n.trim().parse().expect("Please enter a number");
    let mut counter = 0; // Счетчик чисел чья сумма цифр > 10

    for _ in 0..n { // Проходимся по каждому введенному числу
        let mut chislo = String::new();
        io::stdin().read_line(&mut chislo).expect("Failed to read line");
        let chislo: i32 = chislo.trim().parse().expect("Please enter a number");
        let mut sum = 0;
        let mut temp_chislo = chislo;
        while temp_chislo != 0 { // Сумма цифр введенного числа
            sum += temp_chislo % 10;
            temp_chislo /= 10;
        }
        if sum > 10 { // Счетчик + 1
            counter += 1;
        }
    }
    println!("Количество чисел чья сумма больше 10: {}", counter);
}

fn main() {
    println!("Выберите номер задания");
    let mut exercise = String::new();
    io::stdin().read_line(&mut exercise).expect("Failed to read line");
    let exercise: i32 = exercise.trim().parse().expect("Please enter a number");
    // Конструкция match, которая сопоставляет значение переменной exercise 
    // с различными вариантами и выполняет соответствующую функцию
    match exercise {
        1 => number_one(),
        2 => number_two(),
        3 => number_three(),
        _ => println!("Invalid exercise number"),
    }
}

