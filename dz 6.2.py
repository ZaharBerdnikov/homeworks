"""
Есть два файла: в одном хранятся ФИО пользователей сайта, а в другом — данные об их хобби.
Известно, что при хранении данных используется принцип: одна строка — один пользователь,
разделитель между значениями — запятая. Написать код, загружающий данные из обоих файлов
и формирующий из них словарь: ключи — ФИО, значения — данные о хобби. Сохранить словарь
в файл. Проверить сохранённые данные. Если в файле, хранящем данные о хобби, меньше
записей, чем в файле с ФИО, задаём в словаре значение None. Если наоборот — выходим из
скрипта с кодом «1». При решении задачи считать, что объём данных в файлах во много раз
меньше объема ОЗУ.
Фрагмент файла с данными о пользователях (users.csv):
Иванов,Иван,Иванович
Петров, Петр, Петрович
Фрагмент файла с данными о хобби (hobby.csv):
скалолазание,охота
горные лыжи
"""


def dic_update(user, hobby):
    result = {}
    for i in range(len(user)):
        a = {user[i]: hobby[i]}
        result.update(a)
    print(result)


with open('users.csv', 'r', encoding='UTF-8') as f:
    users_list = f.read().splitlines()

with open('hobby.csv', 'r', encoding='UTF-8') as f:
    hobby_list = f.read().splitlines()

if len(users_list) == len(hobby_list):
    dic_update(users_list, hobby_list)
elif len(users_list) > len(hobby_list):
    for i in range(len(users_list) - len(hobby_list)):
        hobby_list.append('None')
    dic_update(users_list, hobby_list)
else:
    print('Код 1')
