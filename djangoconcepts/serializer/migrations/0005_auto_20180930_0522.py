# -*- coding: utf-8 -*-
# Generated by Django 1.11.15 on 2018-09-30 05:22
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('serializer', '0004_delete_origin'),
    ]

    operations = [
        migrations.CreateModel(
            name='Villain',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'verbose_name_plural': 'Villains',
            },
        ),
        migrations.AddField(
            model_name='category',
            name='hero_count',
            field=models.PositiveIntegerField(default=3),
        ),
        migrations.AddField(
            model_name='category',
            name='villain_count',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='villain',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='serializer.Category'),
        ),
    ]
