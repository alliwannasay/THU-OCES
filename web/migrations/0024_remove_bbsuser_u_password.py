# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-03-22 14:14
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0023_auto_20170322_1347'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bbsuser',
            name='U_password',
        ),
    ]
