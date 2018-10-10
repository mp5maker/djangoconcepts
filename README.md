# Django Concepts #
Practice Django Concepts from [Django ORM CookBook](https://books.agiliq.com/projects/django-orm-cookbook/en/latest/)

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

## Understanding *args and **kwargs
* Usually kept as the last item of the functions
* Allows the functions to accept an arbitrary number of arguments and/or keyword arguments
* Most commonly used in object-oriented programming when overriding a function
* '*'and '**' actually do the magic, writing *args and **kwargs is not mandatory, used only as convention

## Importing from Django ##
Name | Imports
---- | -------
django.db.models | P, Q, F, Avg, Max, Min, Sum, Count, Subquery, OuterRef
django.db.models.functions | Substr, Lower


## Learning Querysets ##
* Match the Raw Queries with queryset.sql file 

### Get Raw SQLS using all(), filter() only ###
[**1**] *all()* : Get **Raw SQL** (All Objects) 
```bash
    from django.contrib.auth.models import User [Group is also available]
    user = User.objects.all()
    str(user.query)
    print(user)
```

[**2**] *filter(args)* : Get **Raw SQL** (Specific Objects)
```bash
    from django.contrib.auth.models import User
    user = User.objects.filter(pk=1)
    str(user.query)
    print(user)
```

*Creating a Simple Employee Model*
```python
    class Employee(models.Model):
        first_name = models.CharField(max_length=200)
        last_name = models.CharField(max_length=200)
        age = models.IntegerField()
        salary = models.FloatField()

    def __str__(self):
        return self.first_name + " " + self.last_name
```
### OR Operation ###
* queryset_1 | queryset_2
* filter(Q(<condition_1>)|Q(<condition_2>)

[**3**] *filter(args)* : OR Filtering 
```bash
    from serializer.models import Employee
    filter1 = Employee.objects.filter(first_name="S")
    filter2 = Employee.objects.filter(last_name="K")
    result = filter1 | filter2
    str(result.query)
    print(result)

    Alternatively, 

    from serializer.models import Employee
    from django.db.models import Q
    employee = Employee.objects
    result = employee.filters(Q(first_name="S") | Q(last_name="K"))
    str(result.query)
    print(result)
```
[**4**] *filter(args)* : OR and %LIKE Filtering
```bash
    from serialzier.models import Employee
    from django.db.models import Q
    employee.Employee.objects
    result = employee.filter(Q(first_name__startswith="S") | Q(last_name__startswith="K"))
    str(result.query)
    print(result)
```
### AND Operation ###
* filter(<condition_1>, <condition_2>)
* queryset_1 & queryset_2
* filter(Q(<condition_1>) & Q(<condition_2>))

[**5**] *filter(args)* : AND Filtering
```bash
    from serializer.models import Employee
    employee = Employee.objects
    result = employee.filter(first_name="Photon", last_name="Khan")
    str(result.query)
    print result

    Alternatively,

    from serializer.models import Employee
    employee = Employee.objects
    filter1 = employee.filter(first_name="Photon")
    filter2 = employee.filter(last_name="Khan")
    result = filter1 & filter2
    str(result.query)
    print result

    Alternatively,

    from serializer.models import Employee
    from django.db.models import Q
    employee = Employee.objects
    result = employee.filter(Q(first_name="Photon") & Q(last_name="Khan"))
    print result
```
### NOT Operation ###
* exclude(<condition>)
* filter(~Q(<condition>))

[**6**]  *filter(args)*, *exclude(args)* : NOT Filtering
```bash
    from serializer.models import Employee
    employee = Employee.objects
    result = employee.exclude(age__gt=30)
    str(result.query)
    print result

    Alternatively,

    from serializer.models import Employee
    employee = Employee.objects
    result = employee.filter(~Q(age__gt=30))
    str(result.query)
    print result
```
### Union ###
[**7**] filter1.*union*(filter2)
```bash
    from serializer.models import Employee
    employee = Employee.objects
    filter1 = employee.filter(salary__gt=50000)
    filter2 = employee.filter(salary__lt=20000)
    result = filter1.union(filter2)
    str(result.query)
    print result
```
### Get Desired Field ###
* values and values_list methods on queryset.
* only_method

[**8**] *filter(args).values(fields)*, *filter(args).only(fields)* : Chosen Fields
```bash
    from serializer.models import Employee
    employee = Employee.objects
    result = employee.filter(first_name__startswith="S").values('first_name', 'last_name')
    str(result.query)
    print result

    Alternatively only[chooses id as extra],

    from serializer.models import Employee
    employee = Employee.objects
    result = employee.filter(first_name__startswith="S").only('first_name', 'last_name')
    str(result.query)
    print result
```
### Subquery Expression ###
[**9**] *order_by(args)*, *annotate(args)*, *Subquery(args)*
```bash
    from serializer.models import Hero, Category
    from django.db.models import Q, Subquery, OuterRef
    hero = Hero.objects.filter(category=OuterRef('pk')
                .order_by('-benevolence_factor'))
    result = Category.objects.all().annotate(
        most_benovolent_hero = Subquery(
            hero.values('name')[:1]
        )
    )
    str(result.query)
    print result
```
### Compare Two Fields ###
[**10**] *filter(last_name=F("first_name"))*
```bash
    from serializer.models import Employee
    from django.db.models import F
    result = Employee.objects.filter(last_name=F("first_name"))
    str(result.query)
    print result
```
### Substring ###
[**11**] *Substr("first_name", 1, 1)*
```bash
    from serializer.models import Employee
    from django.db.models import F
    from django.db.models.functions import Substr
    result = Employee.objects.annotate(
        first=Substr("first_name", 1, 1),
        last=Substr("last_name", 1, 1)
    ).filter(first=F("last"))
    str(result.query)
    print result
```
### Check File Field ###
[**12**] Q(file='')|Q(file=None)
* Not checked

```bash
    no_files_objects = MyModel.objects.filter(Q(file='')|Q(file=None))
```
### Slice Operators  ###
* Slice operators raw query cannot be generated in django 1.11 (first(), last())
* **[2]** means LIMIT 1 OFFSET 2 {slicing}

[**13**] *first()*
*   str(result.query) won't work
```bash
    from serializer.models import Employee
    result = Employee.objects.first()
    print(result)
```

[**14**] *last()*
*   str(result.query) won't work
```bash
    from serializer.models import Employee
    result = Employee.objects.last()
    print(result)
```

[**15**] *order_by(args)*
*   str(result.query) won't work
```bash
    from serializer.models import Employee
    result = Employee.objects.order_by('-age')[1]
    print result
```

[**16**] *Alternative to first() using all()[start:end]*
* **[:2]** means LIMIT 2
* **[1:2]** means LIMIT 1 OFFSET 1
```bash
    from serializer.models import Employee
    result = Employee.objects.all()[1:2]
    str(result.query)
    print result
```

[**17**] *Alternative to nth-order using all()[start:end]*
```bash
    from serializer.models import Employee
    result = Employee.objects.all()[3:4]
    str(result.query)
    print result
```
### Check Duplicates ###
[**18**] *filter(args), for item in duplicates, Count(args)*
* first_name__in=[str, str] {takes in array}
```bash
    Get the number of duplicates, along with the name,

    from serializer.models import Employee
    from django.db.models import Count
    employee = Employee.objects
    duplicates = employee.values('first_name')
            .annotate(name_count=Count('first_name')
            .filter(name_count__gt=1)
    str(duplicates.query)
    print duplicates

    Get the object of the duplicates where occured,
    
    records = employee.filter(first_name__in=
        [
            item['first_name'] for item in duplicates
        ]
    )
    str(records.query)
    print records
```

### Get Distinct Values ###
[**19**] *filter(args), for item in distinct, Count(args)*
```bash
    import serializer.models import Employee
    import django.db.models import Count
    distinct = Employee.objects.values('first_name')
                            .annotate(name_count=Count('first_name'))
                            .filter(name_count=1)
    
    records = Employee.objects.filter(first_name__in=
        [
            item['first_name'] for item in distinct
        ]
    )
    str(records.query)
    print records
```

### Group Records ###
[**20**] *aggregate.(func(field)) func: Avg, Max, Min, Sum, Count*
* This wont generate raw sql query in django 1.11
* Dictionary has no attribute
```bash
    Avg,
        from serializer.models import Employee
        from django.db.models import Avg
        result = Employee.objects.aggregate(Avg('salary'))
        print result
    Max, 
        from serializer.models import Employee
        from django.db.models import Max
        result = Employee.objects.aggregate(Max('salary'))
        print result
    Min,
        from serializer.models import Employee
        from django.db.models import Min
        result = Employee.objects.aggregate(Min('salary'))
        print result
    Sum,
        from serializer.models import Employee
        from django.db.models import Sum
        result = Employee.objects.aggregate(Sum('salary'))
        print result
    Count,
        from serializer.models import Employee
        from django.db.models import Count
        result = Employee.objects.aggregate(Count('salary'))
        print result
```
### Create Multiple Objects At One Shot ###
[**21**] *bulk_create([Object(fields)])*
```bash
    print Category.objects.all().count()
    result = Category.objects.bulk_create([Category(name="Hypnotic")])
    print Category.objects.all()
```

### Copy or Clone an existing Model ###
[**22**] *save()*
```bash
    from serializer.models import Hero
    hero = Hero.objects.first()
    hero.pk = None
    hero.save()
    print Hero.objects.all().count()
```

### Signals ###
* All built in signals are sent using the send() method
* django.db.models.signals module defines signals in the model system

Signals | Arguments send with signal
------- | -----------
django.db.models.pre_init | sender, args, kwargs
django.db.models.post_init | sender, instance
django.db.models.pre_save | sender, instance, raw, using, update_fields
django.db.models.post_save | sender, instance, created, raw, using, update_fields
django.db.models.pre_delete | sender, instance, using
django.db.models.post_delete | sender, instance, using
django.db.models.m2m_changed | many to many fields changed, sender, action, "pre_add", "post_add", "pre_delete", "post_delete", "pre_clear", "post_clear", reverse, model, pk_set, using
django.db.models.class_prepared | sender
django.db.models.pre_migrate | sender, app_config, verbosity, interactive, using, plan, apps
django.db.models.post_migrate | sender, app_config, verbosity, interactive, using, plan, apps
django.core.signals.request_started | sender, environ
django.core.signals.request_finished | sender
django.core.signals.got_request_exception | sender, request
django.test.override.settings | sender, setting, value, enter
django.test.signals.template_rendered | sender, template, context
django.db.backends.signals.connection_created | sender, connection

### Setting Up Signal [Didn't Work] ###
**models.py**
```python
# Category Model
class Category(models.Model):
    name = models.CharField(max_length=100)
    hero_count = models.PositiveIntegerField(default=0)
    villain_count = models.PositiveIntegerField(default=0)

    # Name of the object that is created
    def __str__(self):
        return self.name

    # Plural name of the table
    class Meta:
        verbose_name = "Categories"
        verbose_name_plural = "Categories"
    
# Hero Model
class Hero(models.Model):
    name = models.CharField(max_length=100)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    benevolence_factor = models.PositiveSmallIntegerField(
        help_text="How benevolent this here is ?",
        default=50
    )

    # Name of the object that is created
    def __str__(self):
        return self.name

    # Plural name of the table
    class Meta:
        verbose_name = "Heroes"
        verbose_name_plural = "Heroes"

# Villain Model
class Villain(models.Model):
    name = models.CharField(max_length=100)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural = "Villains"
```
**signals.py**
```python
    from django.db.models.signals import pre_save
    from django.db.models import F
    from django.dispatch import receiver
    from serializer.models import Hero, Villain, Category

    @receiver(pre_save, sender=Hero, dispatch_uid="update_hero_count")
    def update_hero_count(sender, **kwargs):
        hero = kwargs['instance']
        if hero.pk:
            Category.objects.filter(pk=hero.category_id).update(hero_count=F('hero_count')+1)

    @receiver(pre_save, sender=Villain, dispatch_uid="update_villain_count")
    def update_villain_count(sender, **kwargs):
        villain = kwargs['instance']
        if villain.pk:
            print "Villain Added"
            Category.objects.filter(pk=villain.category_id).update(villain_count=F('villain_count')+1)
```

**apps.py**
```python
from __future__ import unicode_literals

from django.apps import AppConfig
from django.db.models.signals import pre_save

class SerializerConfig(AppConfig):
    name = 'serializer'

    def ready(self):
        from serializer.models import Hero, Villain
        from serializer.signals import update_hero_count, update_villain_count
        pre_save.connect(update_hero_count, sender=Hero)
        pre_save.connect(update_villain_count, sender=Villain)
```

**__init.py__**
```python
default_app_config = 'serializer.apps.SerializerConfig'
```

### Order a QuerySet ###
[**23**] *order_by*
```bash
    from serializer.models import Employee
    result = Employee.objects.order_by('age')('-salary')
    str(result.query)
    print result
```

### Order a QuerySet with InnerJoin ###
[**24**] *__ Double Underscore*
```bash
    from serializer.models import Hero, Category
    result = Hero.objects.order_by('category__name', 'name')
```
## Inner Join ##
pubs = publication.objects.select_related(fieldnames)