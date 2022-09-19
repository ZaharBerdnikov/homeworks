"""
Реализовать проект расчёта суммарного расхода ткани на производство одежды. Основная
сущность (класс) этого проекта — одежда, которая может иметь определённое название. К
типам одежды в этом проекте относятся пальто и костюм. У этих типов одежды существуют
параметры: размер (для пальто) и рост (для костюма). Это могут быть обычные числа: V и H
соответственно.
Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто
(V/6.5 + 0.5), для костюма (2*H + 0.3). Проверить работу этих методов на реальных данных.
Выполнить общий подсчёт расхода ткани.
"""
from abc import ABC, abstractmethod


class Clothes(ABC):
    def __init__(self, parametr):
        self.parametr = parametr

    @abstractmethod
    def cost(self):
        pass


class Coat(Clothes):
    @property
    def cost(self):
        return self.parametr / 6.5 + 0.5


class Costume(Clothes):
    @property
    def cost(self):
        return self.parametr * 2 + 0.3


coat1 = Coat(44)
costume = Costume(170)
print(coat1.cost, costume.cost)
