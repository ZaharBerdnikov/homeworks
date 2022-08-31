"""
Написать декоратор для логирования типов позиционных аргументов функции
def type_logger...
...
@type_logger
def calc_cube(x):
return x ** 3
a = calc_cube(5)
5: <class 'int'>

"""


def type_logger(func):
    def wrapper(*args, **kwargs):
        result = {}
        fu = func(*args, **kwargs)
        for arg in args:
            one_result = {arg: type(arg)}
            result.update(one_result)
        print(result)
        return fu
    return wrapper


@type_logger
def calc_cube(x, y):
    return x ** y


a = calc_cube(12, 3)
print(a)
