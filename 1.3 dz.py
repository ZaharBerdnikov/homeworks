"""
Реализовать склонение слова «процент» для чисел до 20.
Например, задаем число 5 — получаем «5 процентов», задаем число 2 — получаем «2 процента».
Вывести все склонения для проверки.
"""

a = int(input('Введите число до 20: '))
if a == 1:
    print(a, 'процент')
elif 2 <= a <= 4:
    print(a, 'процента')
else:
    print(a, 'процентов')
