------------------------------------------ 39. View SQL serveris


SELECT id, FirstName, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId


Create view vWEmployeesByDepartament
as
SELECT id, FirstName, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId


Create view vWEITDepartment_Employees
as
SELECT id, FirstName, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId
WHERE tblDepartament.DeptName='IT'


Create view vWEmployeesNonConfidentialData
as
SELECT id, FirstName, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId


Create view vWEmployeesCountByDepartment
as
SELECT DeptName, COUNT(id) as TotalEmployees
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId
GROUP BY DeptName


------------------------------------------ 40. View uuendused


CREATE VIEW vWEmployeesDataExceptSalary
as
SELECT id, Name, Gender, Departamentid
FROM tblEmployee


SELECT * FROM vWEmployeesDataExceptSalary


UPDATE vWEmployeesDataExceptSalary
SET Name = 'Mikey' WHERE id = 2


DELETE FROM vWEmployeesDataExceptSalary WHERE id = 2;
INSERT INTO vWEmployeesDataExceptSalary vALUES(2,'Mikey', 'Male',2)


Create view vWEmployeesDetailsByDepartamenl
as
SELECT id, Name, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId


UPDATE vWEmployeesDetailsByDepartamenl	
SET DeptName = 'IT' WHERE Name = 'John'


