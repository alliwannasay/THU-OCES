# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2017-03-17 12:39
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0020_bbscourse_c_comnum'),
    ]

    operations = [
        migrations.CreateModel(
            name='Honor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('H_Name', models.CharField(blank=True, max_length=50)),
                ('H_Threshold', models.IntegerField(default=0)),
            ],
        ),
    ]
