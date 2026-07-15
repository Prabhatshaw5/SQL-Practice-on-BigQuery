/*Comments - These text wont get executed. 
1. Create database. Then, import tables into student database from Excel CSV (comma separated values) files. 
2. Treat/clean the data (missing values, changing date data types, etc.) 
3. Start writing SELECT queries in order to answer business questions. 
*/

/*Step 1: Create Database*/
Create Database Student_db5; 
Use Student_db5;

/*To import the tables using MySQL WB, please right click on the 
table under the database that you just created. 
Select Table Import Wizard and follow steps. */

SELECT ID, FullName, DOB, SEX 
FROM Student;

/*Step 2: Treat the data / Clean the data 
a) Create a new Column for DOB - NewDOB with date data type 
b) Convert the text DOB into date NEWDOB
c) Replace "T" with Null
d) Convert Remission column from integer to binary*/

ALTER TABLE student 
ADD Column NewDOB date;

SELECT DOB, left(DOB, 10), str_to_date(Left(DOB,10), "%d-%m-%Y"),
str_to_date(DOB,"%d-%m-%Y %H:%i") as DOB_TOB
FROM Student;

SELECT NewDOB FROM Student; 

/*b) Convert the text stored under DOB into date NEWDOB*/
/*Important - Please un-check restricted updates by going to 
Edit -> Preferences -> SQL Editor -> Uncheck Safe Updates and close and reopen MySQL Workbench*/

Update student
SET NewDOB = Str_To_Date(Left(DOB,10), "%d-%m-%Y");

SELECT FullName, NewDOB
FROM student; 

ALTER TABLE Student
DROP Column DOB;

SELECT * FROM Student;

Update Student
Set Sex = NULL, Class = Null, Hcode = Null, Dcode = Null
WHERE Sex = "T" and Class = "T" and Hcode = "T" and Dcode = "T"; 

Update student
Set Ptest = NULL WHERE FullName = "*ba";

SELECT * FROM Student;

/*How do you filter rows*/
SELECT ID, FullName, MTest, SEx 
FROM Student
WHERE Sex = "F";

/*Multiple conditions*/
SELECT ID, FullName, Mtest, SEx
FROM Student
WHERE (Sex = "M" AND Mtest > 90) 
OR (SEX = "F" and Mtest > 80);
