'''

from requests import get, utils

response = get('https://www.cbr.ru/scripts/XML_daily.asp').text

#encodings = utils.get_encoding_from_headers(response.headers)
#content = response.content.decode(encoding=encodings)
print(response)
'''
from requests import get, utils
from xml.etree import ElementTree


def currency_rates(valute):
    response = get('https://www.cbr.ru/scripts/XML_daily.asp')
    tree = ElementTree.fromstring(response.content)          #обрабатываю xml данные
    if __name__ == '__main__':
        print(response.text)
    for i, j in enumerate(tree):
        if tree[i][1].text == valute:   #если код валюты == valute
            return tree[i][4].text      #вернуть значение валюты

print(currency_rates('USD'))

