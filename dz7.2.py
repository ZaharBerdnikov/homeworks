"""
Создать структуру файлов и папок, как написано в задании 2 (при помощи скрипта или
«руками» в проводнике). Написать скрипт, который собирает все шаблоны в одну папку
templates, например:
do
|--my_project
    |--settings
        | |--__init__.py
        | |--dev.py
        | |--prod.py
    |--mainapp
        | |--__init__.py
        | |--models.py
        | |--views.py
        | |--templates
        | |--mainapp
        | |--base.html
        | |--index.html
    |--authapp
        | |--__init__.py
        | |--models.py
        | |--views.py
        | |--template
        | |--authapp
        | |--base.html
        | |--index.html

posle
|--my_project
.......
    | |--mainapp
        | | |--base.html
        | | |--index.html
    | |--authapp
        | |--base.html
        | |--index.html
"""
import os
for path_from_top, subdirs, files in os.walk('my_project'):
    for file in files:
        for i in path_from_top:
            if file.endswith('.html'):
                os.replace(path_from_top, r'my_project/mainap/templates')

