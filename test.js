function Number_One() {

    let counter_of_Day = prompt("Введите количество дней на острове: ");
    let max_bought_of_eat = prompt("Введите максимальное количество еды, которое можно купить в день: ");
    let eaten_of_food = prompt("Введите количество еды, которое необходимо съедать в день: ");

    let cout_of_days = 1; // Количество дней когда мы пойдем в магазин. 1 (потому что один раз путешественник точно сходит в магазин)
    let eaten_food_island = 0; // Количество съеденной еды

    if (eaten_of_food > max_bought_of_eat) { // Проверка на количество потребляемой и купленной еды
    console.log("Выжить невозможно, в день он потребляет еды больше, чем может купить");
    } else {
        for (let i = 0; i < counter_of_Day; i++) { // Проходимся по каждому дню
                if (i % 7 === 0) {  // Если не воскресенье
                    if (eaten_food_island < eaten_of_food) { // Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
                        eaten_food_island += max_bought_of_eat; 
                        cout_of_days++;
                    }
                eaten_food_island -= eaten_of_food;
                }
            }
        console.log("Минимальное количество дней, когда нужно покупать еду в магазине чтобы выжить: " + cout_of_days);
        }
    }

Number_One(); // Вызов функции Number_One()


function Number_Two() {
    let number_of_flowers = prompt("Введите количество цветов: ");
    let capacity_of_leica = prompt("Введите емкость лейки: ");

    let watering_the_flower = []; // Массив, который хранит в себе определенный полив для каждого цветка

    let count_of_liter_in_leica = capacity_of_leica; // Набираем полную емкость лейки
    let steps = 0;  // Количество шагов
    let x = -1; // Начальная позиция
    let remain_in_leica = 0; // Остаток в лейке
    let water_in_leica = remain_in_leica + capacity_of_leica; // Начальное количество воды в лейке

    if (capacity_of_leica < 0) { // Если пользователь ввел отрицательное значение в емкость лейки
        console.log("Ошибка ввода");
    }
    else {
        for (let j = 0; j < number_of_flowers; j++) {// Цикл для ввода полива для каждого цветка
            let input = prompt("Введите количество литров нужное для " + j + " цветка: ");
            watering_the_flower.push(parseInt(input));
        }
        for (let i = 0; i < number_of_flowers; i++) { // Цикл для полива каждого цветка
            if (water_in_leica < watering_the_flower[i]) { // Условие на проверку хватает ли емкости лейки для полива цветка
                steps += (i * 2); // Идем к реке и возвращаемся обратно
                capacity_of_leica = count_of_liter_in_leica; //Наполняем лейку
            }
            water_in_leica = capacity_of_leica - watering_the_flower[i]; // Поливаем цветок
            steps++; // Шаг + 1 
            x++; // Переходим на следующий цветок
        }
    }
    console.log("Количество шагов для полива всех цветов: " + steps);
}

Number_Two()


function Number_Three() {
    console.log("Введите количество чисел");
    let n = parseInt(prompt());
    let counter = 0; // Счетчик чисел чья сумма цифр > 10
    
    for (let i = 0; i < n; i++) { // Проходимся по каждому введенному числу
        console.log("Введите " + i + " число: ");
        let chislo = parseInt(prompt());
        let sum = 0;
        while (chislo !== 0) { // Сумма цифр введенного числа
        sum += chislo % 10;
        chislo = Math.floor(chislo / 10);
        }
        if (sum > 10) { // Счетчик + 1
        counter++;
        }
    }
    console.log("Количество чисел чья сумма больше 10: " + counter);
}
Number_Three()
 



    


// function Number_One(s) {
//     let vowels = /[AaEeIiOoUu]/;
//     let consonants = /[BbCcDdFfGgHhJjKkLlMmNnPpQqRrSsTtVvWwXxZz]/;
//     let count_of_vowels = 0;
//     let count_of_consonant = 0;

//     for (let i = 0; i < stroka.length; i++) {
//         if (vowels.test(s[i])) {
//             count_of_vowels++;
//         } 
//         if (consonants.test(s[i])) {
//             count_of_consonant++;
//         }
//     }

//     if (count_of_vowels > count_of_consonant) {
//         console.log("Да");
//     } else if (count_of_vowels < count_of_consonant) {
//         console.log("Нет");
//     } else {
//         console.log("Одинаково");
//     }
//     }
    
//     let stroka = prompt("Введите строку:");

//     Number_One(stroka);

