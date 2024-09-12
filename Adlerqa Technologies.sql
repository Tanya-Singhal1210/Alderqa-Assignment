create database Alderqa_Technologies ;

use Alderqa_Technologies ;

create table EmployeeDetails ( EmpId INT PRIMARY KEY,
FullName varchar(50), ManagerId INT, DateOfJoining date, City varchar(50) );

insert into EmployeeDetails
( EmpId, FullName, ManagerId, DateOfJoining, City)
VALUES
( 121, 'John Snow', 321, '2019-01-31', 'Toronto'),
( 321, 'Walter White', 986, '2020-01-30', 'California'),
( 421, 'Kuldeep Rana', 876, '2021-11-27', 'New Delhi') ; 

create table EmployeeSalary
(EmpId INT PRIMARY KEY, Project char(2), Salary int, Variable int);

insert into EmployeeSalary
(EmpId, Project, Salary, Variable)
VALUES
(121, 'P1', 8000, 500),
(321, 'P2', 10000, 500),
(421, 'P1', 12000, 500) ;

select * from EmployeeDetails;
select * from EmployeeSalary;

# Q1) Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id '986'

select EmpId, FullName
from EmployeeDetails
where ManagerId = 986; 

# Q2) Write an SQL query to fetch the different projects available from the EmployeeSalary table.

select distinct Project
from EmployeeSalary;

# Q3) Write an SQl query to fetch the count of employees working on project 'P1'.

select count(distinct EmpId)
from EmployeeSalary
where Project ='P1' ;

# Q4) Write an SQl query to find the maximum, minimum, and average salary of the employees.

select max(Salary), min(Salary), avg(Salary)
from EmployeeSalary ;

# Q5) Write an SQL query to find the employee id whose salary lies in the range 0f 9000 & 15000.

select EmpId
from EmployeeSalary
where Salary >= 9000 and Salary <= 15000 ;

# Q6) Write an SQL query to fetch those employees who live in Toronto and work under the manager with
# the ManagerId - 321

select EmpId, FullName
from EmployeeDetails
where City = 'Toronto' and ManagerId = 321 ;

# Q7) Write an SQL query to fetch all the employees who either live in California or work under a manager with
# ManagerId - 321

select ed.EmpId, ed.FullName, ed.ManagerId, ed.City, es.Project, es.Salary
from EmployeeDetails ed
join EmployeeSalary es ON ed.EmpId = es.EmpId
where City = 'California' or ManagerId = 321 ;

# Q8) Write an SQL query to fetch all those employees who work on Projects other than P1.

select ed.EmpId, ed.FullName, ed.ManagerId, ed.city, es.Project, es.Salary
from EmployeeDetails ed
join EmployeeSalary es ON ed.EmpId = es.EmpId
where es.Project != 'P1' ;

# Q9) Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

select EmpId, Project, (Salary+Variable) as Total_Salary
from EmployeeSalary ;

# Q10) Write an SQL query to fetch common records between two tables.

select ed.EmpId, ed.FullName, ed.ManagerId, ed.DateOfJoining, ed.City, es.Project, es.Salary, es.Variable
from EmployeeDetails ed
join EmployeeSalary es ON ed.EmpId = es.EmpId;

# Q11) Write an SQL query to fetch records that are present in one table but not in another table.

select ed. *
from EmployeeDetails ed
left join EmployeeSalary es on ed.EmpId = es.EmpId
where es.EmpId IS NULL ;

# Q12) Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

select ed.EmpId
from EmployeeDetails ed
left join EmployeeSalary es on ed.EmpId = es.EmpId
where es.EmpId IS NULL ;

# Q13) Write an SQL query to fetch all the employees who are also managers from EmployeeDetails table.

select distinct ed1.EmpId, ed1.FullName
from EmployeeDetails ed1
join EmployeeDetails ed2 on ed1.EmpId = ed2.ManagerId ;

# Q14) Write an SQl query to fetch duplicate records from EmployeeDetails (without considering the primary key) 

Select FullName, ManagerId, DateOfJoining, City, COUNT(*)
from EmployeeDetails
GROUP BY FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;

# Q15) Write an SQL query to fetch the project wise count of employees sorted by project's count in descending 
# order.

select Project, COUNT(*) AS EmployeeCount
from EmployeeSalary
GROUP BY Project
ORDER BY EmployeeCount DESC;



