from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.template import loader
import MySQLdb
from django.core.files.storage import default_storage
import os 
import datetime
# Create your views here.


def index(request):
    return render(request,'tedmaa/pro/index.html')

def events(request):
    return render(request,'tedmaa/pro/events.html')

def login(request):
    if(request.method=="GET"):
        return render(request,'tedmaa/pro/login.html')
    else:
        return redirect('dashboard/')
        

def about(request):
    return render(request,'tedmaa/pro/about.html')

def dashboard(request):
    return render(request,'tedmaa/pro/admin-dashboard.html')




def organize(request):
    if(request.method== "GET"):
        return render(request,'tedmaa/pro/organized.html')
    else:
        db = MySQLdb.connect("localhost","root","","test")
        cursor = db.cursor()
        nr=cursor.execute("select * from tedmaa_event")  
        print(request.POST.get("name"))
        print(request.POST.get("oname"))
        print(request.POST.get("rname"))
        print(request.POST.get("tof"))
        print(request.POST.get("tdate"))
        print(request.POST.get("fdate"))
        print(request.POST.get("topf"))
        print(request.FILES["proof"])
        print(request.POST.get("reg_amount"))
        print(request.POST.get("acad_amount"))
        path=os.getcwd()+'/proofs/organized/'+request.POST.get("name").replace(" ","_")+"/"
        fd=datetime.datetime.strptime(request.POST.get("fdate"), '%d/%m/%Y').strftime('%Y-%m-%d')
        td=datetime.datetime.strptime(request.POST.get("tdate"), '%d/%m/%Y').strftime('%Y-%m-%d')
        print(fd)
        print(td)
        try:
            os.makedirs(path) 
        except FileExistsError:
            pass    
        default_storage.save(path+'/'+request.POST.get("topf"), request.FILES["proof"])
        sql="insert into tedmaa_event values("+str(nr+1)+",'"+str(request.POST.get("name"))+"','"+str(request.POST.get("oname")).replace(",","")+"','"+request.POST.get("rname").replace(",","")+"','"+fd+"','"+td+"','"+request.POST.get("tof")+"',"+request.POST.get("reg_amount")+","+request.POST.get("acad_amount")+",'"+request.POST.get("topf")+"')"
        cursor.execute(sql)
        db.commit()
        db.close()
        return HttpResponse('<h1> SUCESSFULLY ADDED </h1>')
        #pass

def attend(request):
    if(request.method== "GET"):
        return render(request,'tedmaa/pro/attended.html')
    else:
        db = MySQLdb.connect("localhost","root","","test")
        cursor = db.cursor()
        nr=cursor.execute("select * from tedmaa_event_attended")  
        print(request.POST.get("name"))
        print(request.POST.get("oname"))
        print(request.POST.get("rname"))
        print(request.POST.get("tof"))
        print(request.POST.get("tdate"))
        print(request.POST.get("fdate"))
        print(request.POST.get("i_name"))
        print(request.POST.get("topf"))
        print(request.FILES["proof"])
        print(request.POST.get("reg_amount"))
        print(request.POST.get("acad_amount"))
        path=os.getcwd()+'/proofs/attended/'+request.POST.get("name").replace(" ","_")+"/"
        fd=datetime.datetime.strptime(request.POST.get("fdate"), '%d/%m/%Y').strftime('%Y-%m-%d')
        td=datetime.datetime.strptime(request.POST.get("tdate"), '%d/%m/%Y').strftime('%Y-%m-%d')
        print(fd)
        print(td)
        try:
            os.makedirs(path) 
        except FileExistsError:
            pass    
        default_storage.save(path+'/'+request.POST.get("topf"), request.FILES["proof"])
        sql="insert into tedmaa_event_attended values("+str(nr+1)+",'"+str(request.POST.get("name"))+"','"+str(request.POST.get("oname")).replace(",","")+"','"+request.POST.get("rname").replace(",","")+"','"+fd+"','"+td+"','"+request.POST.get("i_name")+"','"+request.POST.get("tof")+"',"+request.POST.get("reg_amount")+","+request.POST.get("acad_amount")+",'"+request.POST.get("topf")+"')"
        cursor.execute(sql)
        db.commit()
        db.close()
        return HttpResponse('<h1> SUCESSFULLY ADDED </h1>')
        #pass

def participant(request):
    if(request.method== "GET"):
        return render(request,'tedmaa/pro/student.html')
    else:
        db = MySQLdb.connect("localhost","root","","test")
        cursor = db.cursor()
        nr=cursor.execute("select * from tedmaa_participant")  
        print(request.POST.get("s_name"))
        print(request.POST.get("reg_no"))
        print(request.POST.get("ist_name"))
        print(request.POST.get("tof"))
        print(request.POST.get("event_name"))
        print(request.POST.get("phn"))
        print(request.POST.get("email_address"))

        sql="insert into tedmaa_participant values("+str(request.POST.get("reg_no"))+",'"+str(request.POST.get("s_name")).replace(",","")+"','"+request.POST.get("ist_name").replace(",","")+"','"+request.POST.get("event_name")+"','"+request.POST.get("tof")+"','"+request.POST.get("phn")+"','"+request.POST.get("email_address")+"')"
        cursor.execute(sql)
        db.commit()
        db.close()
        return HttpResponse('<h1> SUCESSFULLY ADDED </h1>')
        #pass


def graph(request):
    if(request.method=="GET"):
        db = MySQLdb.connect("localhost","root","","test")
        cursor = db.cursor()
        nr=cursor.execute("SELECT event_name, COUNT(*) as participants  FROM tedmaa_participant  GROUP BY event_name;")  
        results = cursor.fetchall()

        nr=cursor.execute("SELECT YEAR(from_date) as year,COUNT(*) as noe FROM tedmaa_event GROUP BY YEAR(from_date);")  
        td1 = cursor.fetchall()
        d={}
        for x in td1:
              d[x[0]]=x[1]

        nr=cursor.execute("SELECT YEAR(from_date) as year ,COUNT(*) as noe FROM tedmaa_event_attended GROUP BY YEAR(from_date);")  
        td2 = cursor.fetchall()
        for x in td2:
          if x[0] in d.keys():  
              d[x[0]]+=x[1]
          else:
              d[x[0]]=x[1]



        nr= cursor.execute("SELECT YEAR(from_date ) FROM tedmaa_event GROUP BY YEAR(from_date);")
        years=cursor.fetchall()
        print(years)
        yd={}
        for x in years:
             #print(x)
             cn=[0 for i in range(13)]
             nr= cursor.execute("SELECT MONTH(from_date),COUNT(*) FROM tedmaa_event  where YEAR(from_date)='"+str(x[0])+"' GROUP BY MONTH(from_date);")            
             mt= cursor.fetchall()
             #print(mt)
             for p in mt:
                cn[p[0]]+=p[1]
             yd[x[0]]=cn   
             #count+=1


        nr= cursor.execute("SELECT YEAR(from_date ) FROM tedmaa_event_attended GROUP BY YEAR(from_date);")
        years=cursor.fetchall()
        print(years)
        for x in years:
             #print(x)
             cn=[0 for i in range(13)]
             nr= cursor.execute("SELECT MONTH(from_date),COUNT(*) FROM tedmaa_event_attended  where YEAR(from_date)='"+str(x[0])+"' GROUP BY MONTH(from_date);")            
             mt= cursor.fetchall()
             #print(mt)
             for p in mt:
                cn[p[0]]+=p[1]
             if(x[0] not in yd.keys()):
                yd[x[0]]=cn
             else:
                for i in range(13):
                    yd[x[0]][i]+=cn[i]   

        l=[]
        for x in yd:
             l.append(str(x))

        print(yd)
        context= {'results':results,'d':d,'years':l,'epm':yd}
        return render(request,'tedmaa/pro/charts.html',context)
        

def event_wise(request):
    if(request.method=="GET"):
        db = MySQLdb.connect("localhost","root","","test")
        cursor = db.cursor()
        nr=cursor.execute("SELECT *  FROM tedmaa_event INNER JOIN (select event_name,count(*) from tedmaa_participant GROUP BY event_name) as E ON tedmaa_event.event_name=E.event_name;")  
        results = cursor.fetchall()
        #print(results)
        l=[]
        for x in results:
           l.append([])
           for i in range(7):
            if(i!=5):
                l[-1].append(x[i]) 
           l[-1].append(x[-1])
           print(x[-1]) 

        nr=cursor.execute("SELECT *  FROM tedmaa_event_attended INNER JOIN (select event_name,count(*) from tedmaa_participant GROUP BY event_name) as E ON tedmaa_event_attended.event_name=E.event_name;")  
        results = cursor.fetchall()
        #print(results)

        for x in results:
           l.append([len(l)+1])
           for i in range(1,8):
            if(i!=5 and i!=6):
                l[-1].append(x[i]) 
           l[-1].append(x[-1])
           print(x[-1]) 



        context= {'results':l}
        return render(request,'tedmaa/pro/event-wise.html',context)

            
def faculty_wise(request):
    if(request.method=="GET"):
        db = MySQLdb.connect("localhost","root","","test")
        cursor = db.cursor()
        nr=cursor.execute("SELECT  event_id,event_name,organizers_name,resource_person_name,from_date,to_date FROM tedmaa_event")  
        results = list(cursor.fetchall())
        #print(results)
        r=[]
        for x in results:
            r.append((list(x)+['pvpsit']))
        
        print(r)    
        nr=cursor.execute("SELECT  event_id,event_name,organizers_name,resource_person_name,from_date,to_date,inst_name  FROM tedmaa_event_attended")  
        results2 = list(cursor.fetchall())
        for x in results2:
            r.append([len(r)+1]+list(x[1:]))
        #print(r)
        l=sorted(r)
        #print(l)
        context= {'results':l}
        return render(request,'tedmaa/pro/event-wise.html',context)

def month_wise(request):
    if(request.method=="POST"):
        db = MySQLdb.connect("localhost","root","","test")
        fd=datetime.datetime.strptime(request.POST.get("fdate"), '%d/%m/%Y').strftime('%Y-%m-%d')
        td=datetime.datetime.strptime(request.POST.get("tdate"), '%d/%m/%Y').strftime('%Y-%m-%d')

        
        cursor = db.cursor()
        nr=cursor.execute("select event_id,event_name,organizers_name,resource_person_name,from_date,type_of_event,nop from (SELECT event_id,tedmaa_event.event_name,organizers_name,resource_person_name,from_date,to_date,type_of_event,nop  FROM tedmaa_event INNER JOIN (select event_name,count(*) as nop from tedmaa_participant GROUP BY event_name) as E ON tedmaa_event.event_name=E.event_name) as D where from_date>='"+fd+"' and to_date<='"+td+"';")  
        results = cursor.fetchall()
        print(results)
        l=[]
        for x in results:
           l.append(x)
        
        print(l)

        nr=cursor.execute("select event_id,event_name,organizers_name,resource_person_name,from_date,type_of_event,nop from (SELECT event_id,tedmaa_event_attended.event_name,organizers_name,resource_person_name,from_date,to_date,type_of_event,nop  FROM tedmaa_event_attended INNER JOIN (select event_name,count(*) as nop from tedmaa_participant GROUP BY event_name) as E ON tedmaa_event_attended.event_name=E.event_name) as D where from_date>='"+fd+"' and to_date<='"+td+"';")  
        results = cursor.fetchall()
        print(results)

        for x in results:
           l.append([len(l)+1])
           for i in range(1,7):
                l[-1].append(x[i]) 


        context= {'results':l}
        return render(request,'tedmaa/pro/event-wise.html',context)

def month_data(request):
        return render(request, 'tedmaa/pro/monthly.html')    