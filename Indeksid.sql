--------------------------------- 36. Klastreeritud ja mitte-klastreeritud indeksid

Create clustered index IX
ON FactCallCenter(Calls DESC,Orders ASC)


Create clustered index IX_FactCallCenter_Calls_Orders
ON FactCallCenter(Calls DESC, Orders ASC)


Create nonClustered Index IX_FactCallCenter_WageType
ON FactCallCenter(WageType)


-----------------------------------37. Unikaalne ja mitte-unikaalne indeks

Insert Into tblEmployee Values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
Insert Into tblEmployee Values(1, 'John', 'Menco', 2500, 'Male', 'London')


ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)


EXECUTE SP_HELPCONSTRAINT tblEmployee


CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY


---------------------------------- 38. Indeksi plussid ja miinused

Create NonClustered Index IX_tblEmployee_Salary
On tblEmployee(Salary ASC)


SELECT * FROM tblEmployee WHERE Salary > 4000 and Salary < 8000


SELECT * FROM tblEmployee;
DELETE FROM tblEmployee WHERE Salary = 2500;
UPDATE tblEmployee SET Salary = 9000 WHERE Salary = 7500;
SELECT * FROM tblEmployee;


SELECT * FROM tblEmployee order by Salary;


SELECT * FROM tblEmployee order by Salary DESC;


SELECT Salary, COUNT(Salary) as Total
FROM tblEmployee
GROUP by Salary;
