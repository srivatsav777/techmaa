"""techmaa URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from tedmaa import views

urlpatterns = [
    path('index/', views.index),    
    path('admin/', admin.site.urls),
    path('index/events.html', views.events,name='events'),
    path('index/about.html', views.about),
    path('index/login.html', views.login),
    path('index/index.html', views.index),       
    path('index/dashboard/', views.dashboard),       
    path('index/dashboard/organized.html', views.organize),       
    path('index/dashboard/attended.html', views.attend),       
    path('index/dashboard/student.html', views.participant),       
    path('index/analysis.html',views.graph),
    path('index/dashboard/event-wise.html', views.event_wise),           
    path('index/dashboard/faculty-wise.html', views.faculty_wise),           
    path('index/dashboard/month-wise.html', views.month_wise),           
    path('index/dashboard/monthly.html', views.month_data),

]
