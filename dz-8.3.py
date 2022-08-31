"""
Написать декоратор с аргументом-функцией (callback), позволяющий валидировать входные
значения функции и выбрасывать исключение ValueError, если что-то не так
"""


def val_cheker(cond):
    def inner_val_cheker(func):
        def wrapper(*args, **kwargs):
            condition = cond
            if condition(*args):
                result = func(*args, **kwargs)
                return result
            else:
                raise ValueError
        return wrapper
    return inner_val_cheker


@val_cheker(lambda x: x > 0)
def calc_cube(x):
    return x ** 3

a = calc_cube(1)
print(a)