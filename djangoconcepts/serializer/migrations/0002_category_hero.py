# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-09-29 12:50
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('serializer', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Hero',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('benevolence_factor', models.PositiveSmallIntegerField(default=50, help_text='How benevolent this here is ?')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='serializer.Category')),
            ],
        ),
    ]
