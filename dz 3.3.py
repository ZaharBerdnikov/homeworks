"""
Реализовать функцию get_jokes(), возвращающую n шуток, сформированных из двух случайных слов, взятых из трёх списков:
nouns = ["автомобиль", "лес", "огонь", "город", "дом"]
adverbs = ["сегодня", "вчера", "завтра", "позавчера", "ночью"]
adjectives = ["веселый", "яркий", "зеленый", "утопичный", "мягкий"]
        Например:
get_jokes(2)
["лес завтра зеленый", "город вчера веселый"]
"""

from random import choice

nouns = ["автомобиль", "лес", "огонь", "город", "дом"]
adverbs = ["сегодня", "вчера", "завтра", "позавчера", "ночью"]
adjectives = ["веселый", "яркий", "зеленый", "утопичный", "мягкий"]


def get_jokes(amount: int):
    jokes = []
    for i in range(amount):
        noun = choice(nouns)
        adverb = choice(adverbs)
        adjective = choice(adjectives)
        jokes.append(f'{noun} {adverb} {adjective}')
    print(jokes)

get_jokes(4)