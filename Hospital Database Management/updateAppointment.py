import sqlite3
from tkinter import *
import tkinter.messagebox

conn = sqlite3.connect('hospital.db')

c = conn.cursor()

class Application:
    def __init__(self,master):
        
        self.master = master
        
        self.heading = Label(master, text="Update Appointment",fg="steelblue",font=("arial 40 bold"))
        self.heading.place(x=150,y=0)
        
        self.name = Label(master, text="Patient's name", font=("arial",18), fg="black")
        self.name.place(x=0,y=100)
        
        self.name1 = Entry(master,width=30)
        self.name1.place(x=200,y=107)
        
        self.submit = Button(master, text="Search",width=20,height=1,bg="steelblue",command=self.search_db)
        self.submit.place(x=210,y=140)
        
    def search_db(self):
        self.input = self.name1.get()
        
        sql = "SELECT * FROM appointments where name LIKE ?"
        self.result = c.execute(sql,(self.input,))
        
        for self.row in self.result:
            print(self.row)
            
            self.name = self.row[0]
            self.age = self.row[1]
            self.gender = self.row[2]
            self.appoint = self.row[3]
            self.doctor = self.row[4]
            
        #creating object
        self.uname = Label(self.master, text="Patient's name",font=("arial 18 bold"))
        self.uname.place(x=0,y=180)
        
        self.uage = Label(self.master, text="Age",font=("arial 18 bold"))
        self.uage.place(x=0,y=210)
        
        self.ugender = Label(self.master, text="Gender",font=("arial 18 bold"))
        self.ugender.place(x=0,y=245)
        
        self.uapp = Label(self.master, text="Appointment Time",font=("arial 18 bold"))
        self.uapp.place(x=0,y=280)
        
        self.udoc = Label(self.master, text="Doctor",font=("arial 18 bold"))
        self.udoc.place(x=0,y=325)
        
        #entries
        self.name_ent = Entry(self.master,width=30)
        self.name_ent.place(x=300,y=187)
        self.name_ent.insert(END, str(self.name))
        
        
        self.age_ent = Entry(self.master,width=30)
        self.age_ent.place(x=300,y=217)
        self.age_ent.insert(END, str(self.age))
        
        self.gender_ent = Entry(self.master,width=30)
        self.gender_ent.place(x=300,y=252)
        self.gender_ent.insert(END, str(self.gender))
        
        self.appoin_ent = Entry(self.master,width=30)
        self.appoin_ent.place(x=300,y=287)
        self.appoin_ent.insert(END, str(self.appoint))
        
        self.doc_ent = Entry(self.master,width=30)
        self.doc_ent.place(x=300,y=332)
        self.doc_ent.insert(END, str(self.doctor))
        
        self.update = Button(self.master,text="Update",width=20,height=1,bg="lightblue",command=self.update_db)
        self.update.place(x=370,y=380)
        
        self.delete = Button(self.master,text="Delete",width=20,height=1,bg="red",command=self.delete_db)
        self.delete.place(x=150,y=380)
        
        
    def update_db(self):
        self.val1 = self.name_ent.get()
        self.val2 = self.age_ent.get()
        self.val3 = self.gender_ent.get()
        self.val4 = self.appoin_ent.get()
        self.val5 = self.doc_ent.get()
        
        query = "UPDATE appointments SET name=?, age=?, gender=?, appointment=?,doctor=? where name LIKE ?"
        c.execute(query,(self.val1,self.val2,self.val3,self.val4,self.val5,self.name1.get(),))
        conn.commit()
        
        tkinter.messagebox.showinfo("Update","Updated successfully")
        
        self.uname.destroy()
        self.uage.destroy()
        self.ugender.destroy()
        self.uapp.destroy()
        self.udoc.destroy()
        
        self.name_ent.destroy()
        self.age_ent.destroy()
        self.gender_ent.destroy()
        self.appoin_ent.destroy()
        self.doc_ent.destroy()
        
        self.update.destroy()
        self.delete.destroy()
        
    def delete_db(self):
        query2 = "DELETE FROM appointments WHERE name LIKE ?"
        c.execute(query2,(self.name1.get(),))
        conn.commit()
        
        tkinter.messagebox.showinfo("Success","Deleted record successfully")
        
        self.uname.destroy()
        self.uage.destroy()
        self.ugender.destroy()
        self.uapp.destroy()
        self.udoc.destroy()
        
        self.name_ent.destroy()
        self.age_ent.destroy()
        self.gender_ent.destroy()
        self.appoin_ent.destroy()
        self.doc_ent.destroy()
        
        self.update.destroy()
        self.delete.destroy()
        
        
root = Tk()
b = Application(root)

root.geometry("1200x720+0+0")
root.resizable(False,False)
root.mainloop()