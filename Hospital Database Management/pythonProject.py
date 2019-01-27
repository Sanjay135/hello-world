from tkinter import *
import sqlite3
import tkinter.messagebox

conn = sqlite3.connect('hospital.db')

c = conn.cursor()


class Application:
    def __init__(self,master):
        self.master = master
        
        self.left = Frame(master, width=750, height=800, bg="lightgreen")
        self.left.pack(side=LEFT)
        
        self.right = Frame(master, width=400, height=800, bg="steelblue")
        self.right.pack(side=RIGHT and TOP)
        
        #labels for window
        self.heading = Label(self.left, text="MS Ramaiah hospital", font=("arial",40), fg="black",bg="lightgreen")
        self.heading.place(x=0,y=0)
        
        self.heading = Label(self.left, text="Make an Appoinment", font=("arial",20), fg="blue",bg="lightgreen")
        self.heading.place(x=0,y=100)
        
        self.name = Label(self.left, text="Patient's name", font=("arial",18), fg="black",bg="lightgreen")
        self.name.place(x=0,y=140)
        
        self.age = Label(self.left, text="Age", font=("arial",18), fg="black",bg="lightgreen")
        self.age.place(x=0,y=180)
        
        self.gender = Label(self.left, text="Gender", font=("arial",18), fg="black",bg="lightgreen")
        self.gender.place(x=0,y=220)
        
        self.time = Label(self.left, text="Appointment", font=("arial",18), fg="black",bg="lightgreen")
        self.time.place(x=0,y=260)
        
        self.name_ent = Entry(self.left,width=30)
        self.name_ent.place(x=200,y=147)
        
        self.age_ent = Entry(self.left,width=30)
        self.age_ent.place(x=200,y=187)
        
        self.gender_ent = Entry(self.left,width=30)
        self.gender_ent.place(x=200,y=227)
        
        self.appoin_ent = Entry(self.left,width=30)
        self.appoin_ent.place(x=200,y=267)
        
        #submit button to perform action
        self.submit = Button(self.left, text="make an appointment",width=20,height=2,bg="steelblue",command=self.make_appointment)
        self.submit.place(x=200,y=300)
        
        
        #logs to display at right
        self.logs = Label(self.right,text="REMAINDER",font=("arial 28 bold"),fg="white",bg="steelblue")
        self.logs.place(x=13,y=0)
        
        self.box = Text(self.right,width=45,height=40)
        self.box.place(x=16,y=44)
        
    #function to call when submit clicked
    def make_appointment(self):
        print("working")
        self.val1 = self.name_ent.get()
        self.val2 = self.age_ent.get()
        self.val3 = self.gender_ent.get()
        self.val4 = self.appoin_ent.get()
        
        if self.val1=='' or self.val2=='' or self.val3=='' or self.val4=='':
            tkinter.messagebox.showinfo("Warning","enter all the boxes")
            
        else:
            sql = "INSERT INTO appointments(name,age,gender,appointment) VALUES(?,?,?,?)"
            c.execute(sql,(self.val1,self.val2,self.val3,self.val4))
            conn.commit()
            tkinter.messagebox.showinfo("Success","Appointment for "+str(self.val4)+" is created")
            self.box.insert(END,"Appointment fixed at "+str(self.val4)+"\n")
        
#creating object
root = Tk()
b = Application(root)

#resolution of window
root.geometry("1200x720+0+0")

#preventing resize factor
root.resizable(False,False)

#end of loop
root.mainloop()