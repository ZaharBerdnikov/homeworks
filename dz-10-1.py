"""
Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод
__init__()), который должен принимать данные (список списков) для формирования матрицы.
Подсказка: матрица — система некоторых математических величин, расположенных в виде
прямоугольной схемы.

Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном
виде.
Далее реализовать перегрузку метода __add__() для сложения двух объектов класса Matrix
(двух матриц). Результатом сложения должна быть новая матрица.
Подсказка: сложение элементов матриц выполнять поэлементно. Первый элемент первой
строки первой матрицы складываем с первым элементом первой строки второй матрицы и пр.
"""


def check_matrix(l: list):
    test = l[0]
    for i in l:
        if len(test) != len(i):
            raise TypeError('Rows in Matrix isn\'t same')
    return len(test)


class Matrix:
    def __init__(self, matrix):
        self.matrix = matrix
        stroks = len(self.matrix)
        stolbs = check_matrix(self.matrix)
        self.matrix_size = [stolbs, stroks]

    def __str__(self):
        return '\n'.join(['\t'.join(map(str, row)) for row in self.matrix])

    def __add__(self, other):
        result = []
        if self.matrix_size != other.matrix_size:
            raise ValueError("Matrix sizes difference")
        for item in zip(self.matrix, other.matrix):
            result.append([sum([j, k]) for j, k in zip(*item)])
        return result


m1 = Matrix([[0, 1, 2], [2, 1, 2]])
m2 = Matrix([[3, 1, 2], [2, 1, 2]])
print(m1)
print(m1.matrix_size)
print(m1 + m2)
