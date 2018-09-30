# -*- coding: utf-8 -*-
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