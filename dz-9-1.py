"""
Создать класс TrafficLight (светофор):
● определить у него один атрибут color (цвет) и метод running (запуск);
● атрибут реализовать как приватный;
● в рамках метода реализовать переключение светофора в режимы: красный, жёлтый,
зелёный;
● продолжительность первого состояния (красный) составляет 7 секунд, второго
(жёлтый) — 2 секунды, третьего (зелёный) — на ваше усмотрение;
● переключение между режимами должно осуществляться только в указанном порядке
(красный, жёлтый, зелёный);
● проверить работу примера, создав экземпляр и вызвав описанный метод.
"""
import time


class TrafficLight:
    def __init__(self):
        self.__color = 'red'
        self.turn_on = False

    def running(self, how_many):
        self.turn_on = True
        for i in range(how_many):
            print(self.__color)
            time.sleep(7)
            self.__color = 'yellow'
            print(self.__color)
            time.sleep(2)
            self.__color = 'green'
            print(self.__color)
            time.sleep(7)
            self.__color = 'red'


   # def turn_off(self):
   #     self.turn_on = False


svetofor = TrafficLight()
svetofor.running(2)




