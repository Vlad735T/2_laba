def Number_One():
    counter_of_Day = int(input("Введите количество дней на острове: "))
    max_bought_of_eat = int(input("Введите максимальное количество еды, которое можно купить в день: "))
    eaten_of_food = int(input("Введите количество еды, которое необходимо съедать в день: "))
    cout_of_days = 1 # Количество дней когда мы пойдем в магазин. 1 (потому что один раз путешественник точно сходит в магазин)
    eaten_food_island = 0 # Количество съеденной еды
    if (eaten_of_food > max_bought_of_eat): # Проверка на количество потребляемой и купленной еды
        print("Выжить невозможно, в день он потребляет еды больше, чем может купить ")
    else:
        for i in range(counter_of_Day): # Проходимся по каждому дню
            if (i % 7 == 0): # Если не воскресенье
                if (eaten_food_island < eaten_of_food): # Если осталось меньше еды чем нужно,то идем в магазин и покупаем её
                    eaten_food_island += max_bought_of_eat
                    cout_of_days = cout_of_days + 1
                eaten_food_island -= eaten_of_food
        print("Минимальное количество дней, когда  нужно покупать еду в магазине чтобы выжить: ", cout_of_days)
	
def Number_Two():
    number_of_flowers = int(input("Введите количество цветов:  "))
    capacity_of_leica = int(input("Введите емкость лейки: "))

    watering_the_flower = [0] * number_of_flowers # Список который хранит в себе определенный полив для каждого цветка

    count_of_liter_in_leica = capacity_of_leica #  Набираем полную емкость лейки
    steps = 0 # Количество шагов
    x = -1 #  Начальная позиция
    remain_in_leica = 0 # Остаток в лейке
    water_in_leica = remain_in_leica + capacity_of_leica # Начальное количество воды в лейке

    if (capacity_of_leica < 0): # Если пользователь ввел отрицательное значение в емкость лейки
        print("Ошибка ввода ")
    else:
        for j in range(number_of_flowers): # Цикл для ввода полива для каждого цветка
               watering_the_flower[j] = int(input(f"Введите количество литров нужное для цветка {j}: "))
        for i in range(number_of_flowers): # Цикл для полива каждого цветка
            if (water_in_leica < watering_the_flower[i]):# Условие на проверку хватает ли емкости лейки для полива цветка
                steps += (i * 2) # Идем к реке и возвращаемся обратно
                capacity_of_leica = count_of_liter_in_leica # Наполняем лейку
            water_in_leica = capacity_of_leica - watering_the_flower[i] # Поливаем цветок
            steps += 1 # Шаг + 1       
            x += 1  # Переходим на следующий цветок
    print("Количество шагов для полива всех цветов: ", steps)

def Number_Three():
    n = int(input("Введите количество чисел: "))
    counter = 0   # Счетчик чисел чья сумма цифр > 10
    for i in range(n): # Проходимся по каждому введенному числу
        chislo = int(input("Введите числа: "))
        sum = 0
        while (chislo != 0): # Сумма цифр введенного числа
            sum += chislo % 10
            chislo /= 10
        if (sum > 10): # Счетчик + 1
            counter = counter + 1
    print("Количество чисел чья сумма больше 10: ", counter)
        

print("Введите номер задания: ")
Exercise = int(input())
match Exercise: # Конструкции match, которая сравнивает значение Exercise с различными вариантами
    case 1: # Выполняется, если Exercise = 1
      Number_One() # Вызываем Number_One() , если пользователь ввел 1
    case 2:
      Number_Two()
    case 3:
      Number_Three()




# def Number_One():
    stroka = input("Введите строку: ")
    vowels = "AaEeIiOoUuYy"
    consonant ="BbCcDdFfGgHhJjKkLlMmNnPpQqRrSsTtVvWwXxZz"
    cout_of_vowels = 0
    cout_of_consonant = 0
    for i in stroka:
        if i in vowels:
         cout_of_vowels = cout_of_vowels + 1
    print("Количество гласных: ",cout_of_vowels)
    for j in stroka:
        if j in consonant:
         cout_of_consonant = cout_of_consonant + 1
    print("Количество гласных: ", cout_of_consonant)

    if cout_of_vowels > cout_of_consonant:
        print("Yes")

    elif cout_of_vowels < cout_of_consonant:
        print("No")

    else: 
        print("identically")
