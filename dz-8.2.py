"""
Написать функцию email_parse(<email_address>), которая при помощи регулярного
выражения извлекает имя пользователя и почтовый домен из email адреса и возвращает их в
виде словаря. Если адрес не валиден, выбросить исключение ValueError.
"""
import re


def email_parse(email: str):
    test_email = re.compile(r'^\w+@\w+.\w{2,3}$')
    if test_email.search(email) is not None:
        split_email = email.split('@')
        result = {'name': split_email[0], 'domain': split_email[1]}
        return result
    else:
        raise ValueError


our_mail = email_parse('ourmail@gmail.ru')
print(our_mail)
