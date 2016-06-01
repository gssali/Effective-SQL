-- To run the first three examples, you need to create a sample
-- database and point to it using SET SCHEMA.
CREATE TABLE Students (
	StudentID int PRIMARY KEY NOT NULL,
	LastName varchar(50),
	FirstName varchar(50),
	BirthDate date
);

SELECT Students.StudentID, Students.LastName, Students.FirstName, 
   YEAR(SYSDATE) - YEAR(Students.BirthDate) - 
    (CASE WHEN MONTH(Students.BirthDate) < MONTH(SYSDATE) 
    THEN 0 
    WHEN MONTH(Students.BirthDate) > MONTH(SYSDATE) 
    THEN 1 
    WHEN DAY(Students.BirthDate) > DAY(SYSDATE) 
    THEN 1  
    ELSE 0 END) AS Age
  FROM Students;
  
DROP TABLE Students;

--Similar code using EmpDOB in the Employees table in SalesOrdersSample
-- Ensure you've run SalesOrdersStructure.sql
-- and SalesOrdersData.sql in the Sample Databases folder
-- in order to run this example. 

ALTER SESSION SET CURRENT_SCHEMA SalesOrdersSample;

SELECT Employees.EmployeeID, Employees.EmpLastName, Employees.EmpFirstName,
   (YEAR(GETDATE()) - YEAR(Employees.EmpDOB)) -
    (CASE WHEN MONTH(Employees.EmpDOB) < MONTH(GETDATE()) 
    THEN 0 
    WHEN MONTH(Employees.EmpDOB) > MONTH(GETDATE()) 
    THEN 1 
    WHEN DAY(Employees.EmpDOB) > DAY(GETDATE()) 
    THEN 1  
    ELSE 0 END) AS Age 
  FROM Employees;
