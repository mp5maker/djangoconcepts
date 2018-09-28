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
* python manage.py shell
* python manage.py startapp angular
* python manage.py createsuperuser
* python manage.py makemigration [name]

## Npm Install ##
* npm install --save-dev gulp gulp-sass
* npm install --save-dev bootstrap materialize

## Model Field Reference ##
No | Fields | Parameters 
-- | ------ | ---------- 
1 | AutoField | --- 
2 | BigAutoField | --- 
3 | BigIntegerField | --- 
4 | BinaryField | maxlength 
5 | BooleanField | --- 
6 | CharField | max_length
7 | DateField | (auto_now, auto_now_add)
8 | DateTimeField | (auto_now, auto_now_add)
9 | DecimalField | (max_digits, decimal_places)
10 | DurationField | ---
11 | EmailField | max_length=254
12 | FileField | (upload_to=None, max_length=100)
13 | FilePathField | (path=None, match=None, recursive=False, max_length=100)
14 | FloatField | --- 
15 | ImageField | (upload_to=None, height_field=None, width_field=None, max_length=100)
16 | IntegerField | ---
17 | GenericIPAddressField | (protocol='both', unpack_ipv4=False)
18 | NullBooleanField | ---
19 | PositiveIntegerField | ---
20 | PositiveSmallIntegerField | ---
21 | SlugField | max_length=50
22 | SmallIntegerField | ---
23 | TextField | ---
25 | TimeField | (auto_now=False, auto_now_add=False)
26 | URLField | max_length=200
27 | UUIDField | ---

## Arguments that can be used with field types ##
No | Arguments | Condition | Description
-- | --------- | --------- | -----------
1 | Field.null | True | Django will store empty value as null
2 | Field.blank | True | Field is allowed to be blank
3 | Field.choices | *Check Below* | *Check Below*
4 | Field.db_column | --- | Name of the database column to use for this field
5 | Field.db_index | --- | Database Index will be created for this field
6 | Field.db_tablespace | --- | Database tablespace to use for this field's index
7 | Field.default | --- | Default value for the field
8 | Field.editable | True | Field will not be displayed in admin or any other modelForm
9 | Field.error_message | --- | Keys: null, blank, invalid, invalid_choice, unique, unique_for_date
10 | Field.help_text | --- | Useful for documentation
11 | Field.primary_key | True | Null false, unique True
12 | Field.unique | --- | Unique throughout the table
13 | Field.unique_for_date | --- | Unique date time field
14 | Field.unique_for_month | --- | Unique with respect to month
15 | Field.unique_for_year | --- | Uniquer with respect to year
16 | Field.verbose_name | --- | Human readable name, if not given, django creates using attribute names and converts attributes into spaces
17 | Field.validator | --- | Use validation with the fields   

## Learning Querysets ##

#### Get Raw SQLS using all(), filter() only ####
*all()* : Get Raw SQL (All Objects) 
```bash
    from django.contrib.auth.models import User [Group is also available]
    user = User.objects.all()
    str(user.query)
```

*filter(args)* : Get Raw SQL (Specific Objects)
```bash
    from django.contrib.auth.models import User
    user = User.objects.filter(pk=1)
    str(user.query)
```
