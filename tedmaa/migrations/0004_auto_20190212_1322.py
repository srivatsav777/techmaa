# Generated by Django 2.0.5 on 2019-02-12 13:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tedmaa', '0003_auto_20190212_1319'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='event',
            name='id',
        ),
        migrations.AlterField(
            model_name='event',
            name='event_id',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
    ]