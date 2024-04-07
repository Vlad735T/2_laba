INCLUDE Irvine32.inc    ; Включаем файл Irvine32.inc, который содержит определения процедур ввода-вывода

.data   ;  раздел,который объявляет различные переменные и данные
S DWORD ?
N DWORD ?
M DWORD ?   ; Объявляем переменные типа DWORD (32-битные целые числа), 
days_without_food DWORD ?
days_to_survive DWORD ?

.code ; Основной код программы
main PROC   ; Начало процедуры main
    mov edx, OFFSET S   ; Перемещаем указатель на строку "S: " в регистр edx для использования в функции вывода строки WriteString.
    call WriteString    ; Вызываем функцию для вывода строки
    call ReadInt    ; Считываем целое число, введенное пользователем (и сохраняем в регистр eax)
    mov S, eax  ; Cохраняет значение в переменную S

    mov edx, OFFSET N
    call WriteString
    call ReadInt
    mov N, eax

    mov edx, OFFSET M
    call WriteString
    call ReadInt
    mov M, eax

    mov eax, S  ; Загружаем значение S в регистр eax
    imul eax, M ; S * M и сохраняем в eax
    mov days_without_food, eax  ; Сохраняем в количество дней без еды

    mov eax, days_without_food  ; Загружаем в регистр значение days_without_food
    add eax, N  ;  Добавляем значение к количеству дней без еды.
    sub eax, 1  ;   -1 из общего количество дней
    mov ebx, N  ;
    cdq ; Знаковое расширение регистра eax в edx
    idiv ebx    ; Делим edx(eax) на ebx и сохраняем остаток деления в edx
    mov days_to_survive, eax    ; Сохраняем остаток от деления

    mov edx, OFFSET days_to_survive ; Перемещаем указатель на строку days_to_survive в регистр eax
    call WriteString    ; Вывод строки
    mov eax, days_to_survive    ; Перемещаем
    call WriteDec   ; 
    call Crlf   ; Вывод символа

    exit    ; Завершаем программу
main ENDP   ; Конец main
END main    ; Завершение программы