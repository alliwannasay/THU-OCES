# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-07-10 04:58
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0031_auto_20170710_1257'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bbscourse',
            name='C_Dept',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web.BBSDept'),
        ),
    ]