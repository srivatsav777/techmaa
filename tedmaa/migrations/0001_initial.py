# Generated by Django 2.0.5 on 2019-02-11 13:37

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('event_id', models.CharField(max_length=200)),
                ('event_name', models.CharField(max_length=200)),
                ('organizers_name', models.CharField(max_length=200)),
                ('resource_person_name', models.CharField(max_length=200)),
                ('from_date', models.DateTimeField()),
                ('to_date', models.DateTimeField()),
                ('type_of_event', models.CharField(max_length=200)),
                ('amount_spent', models.IntegerField()),
                ('aor', models.IntegerField()),
                ('asa', models.IntegerField()),
                ('upload', models.FileField(upload_to='uploads/')),
            ],
        ),
    ]
