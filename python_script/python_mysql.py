#!/usr/bin/python


import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
)

print (mydb);
mycursor = mydb.cursor()

mycursor.execute("show databases")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)
