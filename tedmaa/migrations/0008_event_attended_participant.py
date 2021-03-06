# Generated by Django 2.0.5 on 2019-02-13 18:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tedmaa', '0007_auto_20190213_1803'),
    ]

    operations = [
        migrations.CreateModel(
            name='event_attended',
            fields=[
                ('event_id', models.IntegerField(primary_key=True, serialize=False)),
                ('event_name', models.CharField(max_length=200)),
                ('organizers_name', models.CharField(max_length=200)),
                ('resource_person_name', models.CharField(max_length=200)),
                ('from_date', models.DateField()),
                ('to_date', models.DateField()),
                ('inst_name', models.CharField(max_length=200)),
                ('type_of_event', models.CharField(max_length=200)),
                ('aor', models.FloatField()),
                ('asa', models.FloatField()),
                ('type_of_proof', models.CharField(default='NULL', max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='participant',
            fields=[
                ('reg_num', models.IntegerField(primary_key=True, serialize=False)),
                ('ptp_name', models.CharField(max_length=200)),
                ('inst_name', models.CharField(max_length=200)),
                ('event_name', models.CharField(max_length=200)),
                ('type_of_event', models.CharField(max_length=200)),
                ('phone', models.CharField(default='NULL', max_length=200)),
                ('email', models.CharField(default='NULL', max_length=200)),
            ],
        ),
    ]
