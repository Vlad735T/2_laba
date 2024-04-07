
import Control.Monad (replicateM, when) -- Импортируем функции replicateM и when из модуля Control.Monad
import Data.Char (digitToInt) -- импортирует функцию digitToInt из модуля Data.Char

number_Three :: IO () --  Функция, которая возвращает значение типа IO ()
number_Three = do -- Начинаем блок do
  putStrLn "Введите количество чисел" -- Вывод текста
  n <- readLn :: IO Int --  Считываем целое число с клавиатуры
  numbers <- replicateM n readLn --  Считываем числа с клавиатуры и сохраняем их в переменную
  let counter = length $ filter (> 10) $ map sum_of_Digits numbers -- Вычисляем количество чисел, сумма цифр которых больше 10
  putStrLn $ "Количество чисел чья сумма больше 10: " ++ show counter -- Выводим количество чисел на экран
  where -- Определяем функцию sumDigits, которая считает сумму цифр числа.
    sum_of_Digits :: Int -> Int
    sum_of_Digits = sum . map digitToInt . show

main :: IO ()
main = do
number_Three

-- main :: IO ()
-- main = do
--   putStrLn "Выберите номер задания"
--   exercise <- readLn :: IO Int
--   case exercise of
--     3 -> number_Three -- При вводе 3 вызывается функция Number_Three
--     _ -> return () -- В остальных программа завершается


