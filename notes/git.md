# Вспомогательная документация для работы с git

## Основные команды:
* git push --set-upstream origin <название ветки> - первое влитие ветки
* git commit -m "комментарий" - создание коммита
* git branch -m feature/final-assignment feature/final-assignment
* git fetch origin
* git branch -u origin/feature/final-assignment feature/final-assignment
* git remote set-head origin -a


## Gitignore
  touch .gitignore - создание файла для записей по игнорированию каких либо файлов

### Исключение всех файлов временных файлов и логов
*.log
*.tmp

### Исключение папок build и dist
build/
dist/

### Исключение конфигурационных файлов
config/database.yml

### Исключение всех файлов с расширением .env
*.env

## Пример для проекта на Python

#Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

#C extensions
*.so

#Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

#PyInstaller
#Usually these files are written by a python script from a template
#before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

#Installer logs
pip-log.txt
pip-delete-this-directory.txt

#Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/

#Translations
*.mo
*.pot

#Django stuff:
*.log
local_settings.py
db.sqlite3

#Flask stuff:
instance/
.webassets-cache

#Scrapy stuff:
.scrapy

#Sphinx documentation
docs/_build/

#PyBuilder
target/

#Jupyter Notebook
.ipynb_checkpoints

#IPython
profile_default/
ipython_config.py

#pyenv
.python-version

#Celery stuff
celerybeat-schedule
celerybeat.pid

#SageMath parsed files
*.sage.py

#Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

#Spyder project settings
.spyderproject
.spyproject

#Rope project settings
.ropeproject

#mkdocs documentation
/site

#mypy
.mypy_cache/
.dmypy.json
dmypy.json

#Pyre type checker
.pyre/
