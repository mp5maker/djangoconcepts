# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from serializer.models import Employee, Category, Hero

# Register your models here.
admin.site.register(Employee)
admin.site.register(Category)
admin.site.register(Hero)