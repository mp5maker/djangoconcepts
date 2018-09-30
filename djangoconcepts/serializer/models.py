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

    # Plural name of the object
    class Meta:
        verbose_name_plural = "Employee"
    
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
