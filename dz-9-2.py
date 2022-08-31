"""
Реализовать класс Road (дорога).
● определить атрибуты: length (длина), width (ширина);
● значения атрибутов должны передаваться при создании экземпляра класса;
● атрибуты сделать защищёнными;
● определить метод расчёта массы асфальта, необходимого для покрытия всей дороги;
● использовать формулу: длина*ширина*масса асфальта для покрытия одного кв. метра
дороги асфальтом, толщиной в 1 см*число см толщины полотна;
● проверить работу метода.
Например: 20 м*5000 м*25 кг*5 см = 12500 т.
"""


class Road:
    plotnost = 25

    def __init__(self, length, width):
        self.hight = None
        self._length = length
        self._width = width

    def calc(self, hight):
        self.hight = hight
        result = self._width * self._length * Road.plotnost * self.hight
        print(f'Вам нужно столько килограмм асфальта {result}')


first_road = Road(100, 20)
second_road = Road(10, 5)
first_road.calc(5)
second_road.calc(3)
