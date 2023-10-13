------------------------------------------ 39. View SQL serveris


SELECT id, FirstName, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId

Этот запрос будет извлекать данные о сотрудниках: имена, зарплаты и пол.
А также названия отделов, к которым они принадлежат, 
используя информацию из таблиц tblEmployee и tblDepartament.
Объединяя их на основе соответствия идентификаторов отделов.  

  
Create view vWEmployeesByDepartament
as
SELECT id, FirstName, Salary, Gender, DeptName
FROM tblEmployee
join tblDepartament
on tblEmployee.Departamentid = tblDepartament.DeptId

Этот код создает view в базе данных под названием vWEmployeesByDepartament.
После создания view его можно использовать, как если бы это была обычная таблица, 
чтобы получать данные о сотрудниках и их отделах без необходимости выполнять запрос каждый раз.

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


--------------------------------------- 41. Indekseeritud view-d


CREATE VIEW vWTotalSalesByProduct
with SchemaBinding
as
Select Name,
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
FROM dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductID = dbo.tblProductSales.ProductId
GROUP BY Name



CREATE UNIQUE CLUSTERED INDEX UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)


-------------------------------------- 42. View piirangud



CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)



Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)



Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender




Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select id, Name, Gender, Departamentid
from tblEmployee where Gender = @Gender)


Select * from dbo.fnEmployeeDetails('Male')



Create View vWEmployeeDetailsSorted
as
Select id, Name, Gender, Departamentid
from tblEmployee
order by id



Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

SELECT * FROM ##TestTempTable



Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable



