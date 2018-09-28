# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Employee Model
class Employee(models.Model):
    first_name = models.CharField(max_length=200)
    last_name = models.CharField(max_length=200)
    age = models.IntegerField()
    salary = models.FloatField()

    # Gives the name of the added object
    def __str__(self):
        return self.first_name + " " + self.last_name