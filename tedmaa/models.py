from django.db import models

# Create your models here.


from django.db import models


class event(models.Model):
    event_id   = models.IntegerField(primary_key=True)
    event_name = models.CharField(max_length=200)
    organizers_name = models.CharField(max_length=200)
    resource_person_name = models.CharField(max_length=200)
    from_date   = models.DateField()
    to_date     = models.DateField()
    type_of_event = models.CharField(max_length=200)
    aor = models.FloatField() # amount obtained through registration
    asa = models.FloatField() # amount sponsered by academy
    type_of_proof = models.CharField(max_length=200,default="NULL")

class event_attended(models.Model):
    event_id   = models.IntegerField(primary_key=True)
    event_name = models.CharField(max_length=200)
    organizers_name = models.CharField(max_length=200)
    resource_person_name = models.CharField(max_length=200)
    from_date   = models.DateField()
    to_date     = models.DateField()
    inst_name = models.CharField(max_length=200)
    type_of_event = models.CharField(max_length=200)
    aor = models.FloatField() # amount obtained through registration
    asa = models.FloatField() # amount sponsered by academy
    type_of_proof = models.CharField(max_length=200,default="NULL")


class participant(models.Model):
    reg_num   = models.IntegerField(primary_key=True)
    ptp_name = models.CharField(max_length=200)
    inst_name = models.CharField(max_length=200)
    event_name = models.CharField(max_length=200)
    type_of_event = models.CharField(max_length=200)
    phone = models.CharField(max_length=200,default="NULL")
    email = models.CharField(max_length=200,default="NULL")