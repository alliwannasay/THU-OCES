# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-02-01 02:18
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0008_userhascourse_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userhascourse',
            name='Score',
            field=models.IntegerField(default=-1),
        ),
    ]
