# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-02-02 13:14
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0009_auto_20170201_1018'),
    ]

    operations = [
        migrations.AddField(
            model_name='bbscourse',
            name='C_Rank',
            field=models.FloatField(default=0),
        ),
        migrations.AddField(
            model_name='bbscourse',
            name='C_Ranknum',
            field=models.IntegerField(default=0),
        ),
    ]
