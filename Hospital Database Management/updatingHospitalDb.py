import sqlite3

conn = sqlite3.connect('hospital.db')

c = conn.cursor()

sql1 = "ALTER TABLE appointments ADD COLUMN doctor varchar(100)"
c.execute(sql1)

conn.commit()

print("success")

#create database db1; 

#CREATE TABLE customers(id int(10), name varchar(50), city varchar(50),PRIMARY KEY (id ));

#insert into customers values(101,'rahul','delhi');

#update customers set name='bob', city='london' where id=101; 

#delete from customers where id=101;

#drop table customers; 


#ALTER TABLE customers ADD COLUMN age varchar(50);  

#ALTER TABLE cus_tbl MODIFY cus_surname varchar(50) NULL;  

#ALTER TABLE cus_tbl DROP COLUMN cus_address;  

# ALTER TABLE  cus_tbl  CHANGE COLUMN cus_surname cus_title  varchar(20) NOT NULL; 

#schema: appointments(name varchar(100), age int, gender char(2), appointment varchar(20))




    