# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-07-10 05:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0034_auto_20170710_1332'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bbscourse',
            name='C_Exam',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
