import sqlite3

from tkinter import *
#import pyttsx3

conn = sqlite3.connect('hospital.db')
c = conn.cursor()

number = []
patients = []
count=0

sql = "SELECT * FROM appointments"
results = c.execute(sql)

for r in results:
    name = r[0]
    patients.append(name)
    count += 1
    number.append(count)
    
print(patients)

class Application:
    def __init__(self,master):
        self.master = master
        
        self.x = 0
        
        self.heading = Label(self.master,text="Appointment's",font=("arial 50 bold"),fg="green")
        self.heading.place(x=390,y=0)
        
        self.change = Button(master,text="Next Patient", width=20,height=2,bg="steelblue",command=self.func)
        self.change.place(x=500,y=600)
        
        self.m =Label(master,text="",font=("arial 100 bold"))
        self.m.place(x=500,y=150)
        
        self.pname =Label(master,text="",font=("arial 70 bold"))
        self.pname.place(x=450,y=400)
        
    def func(self):
        self.m.config(text=str(number[self.x]))
        
        self.pname.config(text=str(patients[self.x]))
        self.x += 1
        
        
root = Tk()
b = Application(root)

root.geometry("1200x720+0+0")
root.resizable(False,False)
root.mainloop()     