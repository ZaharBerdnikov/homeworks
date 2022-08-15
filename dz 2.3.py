"""
  Создать список, содержащий цены на товары (10–20 товаров), например:
[57.8, 46.51, 97, ...]
* Вывести на экран эти цены через запятую в одну строку, цена должна отображаться в виде <r> руб <kk> коп (например «5 руб 04 коп»). Подумать, как из цены получить рубли и копейки, как добавить нули, если, например, получилось 7 копеек или 0 копеек (должно быть 07 коп или 00 коп).

* Вывести цены, отсортированные по возрастанию, новый список не создавать (доказать, что объект списка после сортировки остался тот же).
* Создать новый список, содержащий те же цены, но отсортированные по убыванию.
* Вывести цены пяти самых дорогих товаров. Сможете ли вывести цены этих товаров по возрастанию, написав минимум кода?

Задачи со * предназначены для продвинутых учеников, которым мало сделать обычное задание.
 """

price_list = [57.8, 46.51, 97, 831.62, 35.15, 71.99, 22, 15.71, 38.91, 925.11, 742.53]
price_list_str = []
price_list_float = []

# вывод в рубли копейки

for i in price_list:   # перевожу в стр
    price_list_str.append(str(i))

for i in price_list_str:
    if not i.isdigit(): # если флоат
        rub_kop = i.split('.')
        print(rub_kop[0],'рублей',rub_kop[1],'коп')
    else:           # если инт
        print(i,'рублей 00 коп')

#сортировка по возраст
for i in price_list:
    price_list_float.append(float(i))
price_list_float = sorted(price_list_float, key=float)
print(price_list_float)


#сортировка по убыв
a = price_list_float.copy()
a.reverse()
print(a)

#5 самых дорогих товаров(он уже сортированный, но можно если что отсортировать + 1строчка кода)
print(price_list_float[-5:])