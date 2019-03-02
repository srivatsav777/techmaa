# Generated by Django 2.0.5 on 2019-02-12 13:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tedmaa', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='amount_spent',
            field=models.FloatField(),
        ),
        migrations.AlterField(
            model_name='event',
            name='aor',
            field=models.FloatField(),
        ),
        migrations.AlterField(
            model_name='event',
            name='asa',
            field=models.FloatField(),
        ),
        migrations.AlterField(
            model_name='event',
            name='event_id',
            field=models.IntegerField(max_length=200),
        ),
    ]
