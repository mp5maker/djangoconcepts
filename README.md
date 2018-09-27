# Django Concepts #
Practice Django Concepts

## Installation ##
```bash
    sudo apt-get install pip
    sudo apt-get install nodejs

    pip install environ
    pip install virtualenvwrapper
    pip install Django==1.11.*
    pip install djangorestframework==3.7.7

    export WORKON_HOME=~/Envs
    mkdir -p $WORKON_HOME
    source /usr/local/bin/virtualenvwrapper.sh
    source ~/.bashrc
    mkvirtualenv djangoconcepts
```

## Virtual Environment Commands ##
```bash
1. mkvirtualenv [name]
2. rmvirtualenv [name]
3. workon [name]
4. deactivate
```

## Django Admin Command ##
django-admin startproject [name]

## Management Commands ##
* python manage.py migrate
* python manage.py runserver
* python manage.py shell_plus
* python manage.py startapp angular
* python manage.py createsuperuser
* python manage.py makemigration [name]

## Npm Install ##
* npm install --save-dev gulp gulp-sass
* npm install --save-dev bootstrap materialize