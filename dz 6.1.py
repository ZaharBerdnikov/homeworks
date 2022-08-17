'''
Не используя библиотеки для парсинга, распарсить (получить определённые данные) файл логов
web-сервера nginx_logs.txt
(https://github.com/elastic/examples/raw/master/Common%20Data%20Formats/nginx_logs/nginx_logs)
— получить список кортежей вида: (<remote_addr>, <request_type>,
<requested_resource>). Например:
[
...
('141.138.90.60', 'GET', '/downloads/product_2'),
('141.138.90.60', 'GET', '/downloads/product_2'),
('173.255.199.22', 'GET', '/downloads/product_2'),
'''

result = []
with open('testovii.txt', 'r', encoding='UTF-8') as f:
    stroki = f.readlines()
for i in stroki:
    a = i.split()
    pre_result = (a[0], a[5], a[6])
    result.append(pre_result)
print(result)
