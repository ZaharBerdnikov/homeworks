"""
Создать список, состоящий из кубов нечётных чисел от 0 до 1000:
Вычислить сумму тех чисел из этого списка, сумма цифр которых делится нацело на 7.
Например, число «19 ^ 3 = 6859» будем включать в сумму, так как 6 + 8 + 5 + 9 = 28 – делится нацело на 7.
Внимание: использовать только арифметические операции!

К каждому элементу списка добавить 17 и заново вычислить сумму тех чисел из этого списка, сумма цифр которых делится нацело на 7.
 Внимание: новый список не создавать!!!
"""

c = [c ** 3 for c in range(1, 1000, 2)] #генерирую список кубов нечетных чисел(я гений)
print(c)
itog, suma = 0, 0
test_list = []

for i in range(len(c)): #этот цикл перебирает все числа списка кубов нечетных чисел
#   c[i] += 17   - Эта строчка выполняет вторую часть задания c добавлением 17
    a = c[i]
    while c[i] > 0:     #этот цикл раскладывает числа на цифры и их суммируеит
        digit = c[i] % 10
        suma = suma + digit
        c[i] = c[i] // 10
    if suma % 7 == 0:    #иф проверяет делимость суммы цифр на 7 и еще я ради прикола сделал чтобы было видно эти числа и можно проверить что сумма цифр реально на 7 делится
        test_list.append(a)
        itog += a
    suma = 0
print(test_list)
print(itog)
