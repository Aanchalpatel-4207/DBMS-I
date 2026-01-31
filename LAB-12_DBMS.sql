=============LAB-12=============

-------PART-A

--1. Combine information from Person and Department table using cross join or Cartesian product.
	SELECT *
	FROM PERSON,DEPT

	--OR

	SELECT *
	FROM PERSON
	CROSS JOIN DEPT


--2. Find all persons with their department name
	SELECT 
		PERSON.PERSONNAME,
		DEPT.DEPARTMENTNAME
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID


--3. Find all persons with their department name & code.
	SELECT 
		PERSON.PERSONNAME,
		DEPT.DEPARTMENTNAME,
		DEPT.DepartmentCode
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID


--4. Find all persons with their department code and location.
	SELECT 
		PERSON.PERSONNAME,
		DEPT.Location,
		DEPT.DepartmentCode
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID


--5. Find the detail of the person who belongs to Mechanical department.
	SELECT *
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE DEPT.DepartmentName = 'Mechanical'


--6. Find person’s name, department code and salary who lives in Ahmedabad city.
	SELECT 
		PERSON.PERSONNAME,
		PERSON.SALARY,
		DEPT.DepartmentCode,
		PERSON.CITY
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE PERSON.CITY = 'Ahmedabad'


--7. Find the person's name whose department is in C-Block.
	SELECT 
		PERSON.PERSONNAME,
		DEPT.Location
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE DEPT.Location = 'C-Block'


--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
	SELECT 
		PERSON.PERSONNAME,
		PERSON.SALARY,
		DEPT.DepartmentName,
		PERSON.CITY
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE PERSON.CITY = 'Jamnagar'


--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
	SELECT *
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE DEPT.DepartmentName = 'Civil' AND
		  PERSON.JoiningDate > '2001-08-01'


--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
	SELECT *
	FROM PERSON
	INNER JOIN DEPTSE
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE DATEDIFF(D,PERSON.JOININGDATE,GETDATE()) > 365


--11. Find department wise person counts.
	SELECT
		DEPT.DepartmentName,
		COUNT(*) AS PERSON_COUNT
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	GROUP BY DEPT.DepartmentName


--12. Give department wise maximum & minimum salary with department name.
	SELECT
		DEPT.DepartmentName,
		MAX(PERSON.Salary) AS MAX_SALARY,
		MIN(PERSON.Salary) AS MIN_SALARY
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	GROUP BY DEPT.DepartmentName


--13. Find city wise total, average, maximum and minimum salary.
	SELECT
		PERSON.CITY,
		SUM(PERSON.Salary) AS TOTAL_SALARY,
		AVG(PERSON.Salary) AS AVG_SALARY,
		MAX(PERSON.Salary) AS MAX_SALARY,
		MIN(PERSON.Salary) AS MIN_SALARY
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	GROUP BY PERSON.CITY


--14. Find the average salary of a person who belongs to Ahmedabad city.
	SELECT
		PERSON.PersonName,
		AVG(PERSON.Salary) AS AVG_SALARY
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID
	WHERE CITY = 'Ahmedabad'
	GROUP BY PERSON.PersonName


--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
	SELECT
		PERSON.PersonName ++ '' ++'LIVES IN' ++ '' ++ PERSON.City ++ '' ++ 'AND WORKS IN' ++ '' ++ DEPT.DepartmentName ++ '' ++ 'DEPARTMENT'
	FROM PERSON
	INNER JOIN DEPT
	ON PERSON.DepartmentID = DEPT.DepartmentID