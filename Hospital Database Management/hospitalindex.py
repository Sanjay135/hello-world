from tkinter import *
import sqlite3

conn = sqlite3.connect('hospital.db')
c = conn.cursor()

count=0

sql = "SELECT * FROM appointments"
results = c.execute(sql)

for r in results:
    count += 1

    
class Application:
    def __init__(self,master):
        self.master = master
        
        self.heading = Label(master, text="Hospital Management System",fg="steelblue",font=("arial 40 bold"))
        self.heading.grid(row=0, columnspan=5)
        
        self.label1 = Label(master,text="Name",font=("arial 15"))
        self.label1.grid(row=1,column=1)
        
        self.label2 = Label(master,text="Age",font=("arial 15"))
        self.label2.grid(row=1,column=2)
        
        self.label3 = Label(master,text="Gender",font=("arial 15"))
        self.label3.grid(row=1,column=3)
        
        self.label4 = Label(master,text="Appointment Time",font=("arial 15"))
        self.label4.grid(row=1,column=4)
        
        self.label5 = Label(master,text="Doctor",font=("arial 15"))
        self.label5.grid(row=1,column=5)
        
        
        sql = "SELECT * FROM appointments"
        res = c.execute(sql)
        
        for i,r in zip(range(2,count+2),res):
            
            self.ent1 = Entry(master,width=20,font=("arial 15"))
            self.ent1.grid(row=i,column=1)
            self.ent1.insert(END, str(r[0]))
    
            
            self.ent2 = Entry(master,width=20,font=("arial 15"))
            self.ent2.grid(row=i,column=2)
            self.ent2.insert(END, str(r[1]))
            
            self.ent3 = Entry(master,width=20,font=("arial 15"))
            self.ent3.grid(row=i,column=3)
            self.ent3.insert(END, str(r[2]))
            
            self.ent4 = Entry(master,width=20,font=("arial 15"))
            self.ent4.grid(row=i,column=4)
            self.ent4.insert(END, str(r[3]))
            
            self.ent5 = Entry(master,width=20,font=("arial 15"))
            self.ent5.grid(row=i,column=5)
            self.ent5.insert(END, str(r[4]))
            
        conn.commit()
        
        
        self.button = Button(master,text="display",width=30,height=1,bg="steelblue",command=self.nav)
        self.button.grid(row=i+3, column=1)
        
        self.button1 = Button(master,text="Update Appointment",width=30,height=1,bg="steelblue",command=self.nav_update)
        self.button1.grid(row=i+3, column=3)
        
        self.re = Button(master,text="Refresh",width=30,height=1,bg="steelblue")
        self.re.grid(row=i+3, column=5)


    def nav(self):
        import display
        
        
    def nav_update(self):
        import updateAppointment
        return

        

root = Tk()
b = Application(root)
root.geometry("1200x720+0+0")
root.mainloop()