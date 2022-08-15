'''
Дан список:
['в', '5', 'часов', '17', 'минут', 'температура', 'воздуха', 'была', '+5', 'градусов']
Необходимо его обработать — обособить каждое целое число кавычками и дополнить нулём до двух разрядов:
['в', '"', '05', '"', 'часов', '"', '17', '"', 'минут', 'температура', 'воздуха', 'была', '"', '+05', '"', 'градусов']
Новый список не создавать! Сформировать из обработанного списка строку:
в "05" часов "17" минут температура воздуха была "+05" градусов
'''

list1 = ['в', '5', 'часов', '17', 'минут', 'температура', 'воздуха', 'была', '-7', 'градусов']
cifri = ['0','1','2','3','4','5','6','7','8','9']

for i, j in enumerate(list1):
    if any([x in j for x in cifri]): # берем только строки в которых есть цифры
        print(i)
        if not j.isdigit() and len(j) == 2:       # ecли есть посторонние знаки помимо цифр
            temperatura = list(j)
            temperatura.insert(1, '0')
            temperatura_str = ''.join(temperatura)
            list1[i] = temperatura_str
        if len(j) == 1:     # добавление нуля
            list1[i] = '0' + j
        list1[i] = '"' + list1[i] + '"'
print(' '.join(list1))
