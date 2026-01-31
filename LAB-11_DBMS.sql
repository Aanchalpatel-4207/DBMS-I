
 
 =============LAB-11=============

---TABLE-1

CREATE TABLE STU_INFO(
	RNO INT,
	NAME VARCHAR(20),
	BRANCH VARCHAR(20)
);


INSERT INTO STU_INFO VALUES
	(101, 'RAJU', 'CE'),
	(102, 'AMIT', 'CE'),
	(103, 'SANJAY', 'ME'),
	(104, 'NEHA', 'EC'),
	(105, 'MEERA', 'EE'),
	(106, 'MAHESH', 'ME');

SELECT * FROM STU_INFO

---TABLE-2

CREATE TABLE RESULT(
	RNO INT,
	SPI DECIMAL(2,1)
);

INSERT INTO RESULT VALUES
	(101, 8.8),
	(102, 9.2),
	(103, 7.6),
	(104, 8.2),
	(105, 7.0),
	(107, 8.9);

SELECT * FROM RESULT

---TABLE-3

CREATE TABLE EMPLOYEE_MASTER(
	EMPLOYEENO VARCHAR(20),
	NAME VARCHAR(20),
	MANAGERNO VARCHAR(20)
);

INSERT INTO EMPLOYEE_MASTER VALUES
	('E01', 'TARUN', 'NULL'),
	('E02', 'ROHAN', 'E02'),
	('E03', 'PRIYA', 'E01'),
	('E04', 'MILAN', 'E03'),
	('E05', 'JAY', 'E01'),
	('E06', 'ANJANA', 'E04');

SELECT * FROM EMPLOYEE_MASTER



-------PART-A

--1. Combine information from student and result table using cross join or Cartesian product.
	SELECT *
	FROM STU_INFO,RESULT

	--OR

	SELECT *
	FROM STU_INFO
	CROSS JOIN RESULT


--2. Perform inner join on Student and Result tables.
	SELECT *
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO


--3. Perform the left outer join on Student and Result tables.
	SELECT *
	FROM STU_INFO
	LEFT OUTER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO


--4. Perform the right outer join on Student and Result tables.
	SELECT *
	FROM STU_INFO
	RIGHT OUTER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO


--5. Perform the full outer join on Student and Result tables.
	SELECT *
	FROM STU_INFO
	FULL OUTER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO


--6. Display Rno, Name, Branch and SPI of all students.
	SELECT 
		STU_INFO.RNO,
		STU_INFO.NAME,
		STU_INFO.BRANCH,
		RESULT.SPI
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO


--7. Display Rno, Name, Branch and SPI of CE branch�s student only.
	SELECT 
		STU_INFO.RNO,
		STU_INFO.NAME,
		STU_INFO.BRANCH,
		RESULT.SPI
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	WHERE STU_INFO.BRANCH='CE'


--8. Display Rno, Name, Branch and SPI of other than EC branch�s student only.
	SELECT 
		STU_INFO.RNO,
		STU_INFO.NAME,
		STU_INFO.BRANCH,
		RESULT.SPI
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	WHERE STU_INFO.BRANCH != 'EC'


--9. Display average result of each branch.
	SELECT
		STU_INFO.BRANCH,
		AVG(RESULT.SPI) AS AVG_RESULT
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	GROUP BY STU_INFO.BRANCH


--10. Display average result of CE and ME branch.
	SELECT
		STU_INFO.BRANCH,
		AVG(RESULT.SPI) AS AVG_RESULT
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	WHERE STU_INFO.BRANCH IN('CE', 'ME')
	GROUP BY STU_INFO.BRANCH


--11. Display Maximum and Minimum SPI of each branch.
	SELECT
		STU_INFO.BRANCH,
		MAX(RESULT.SPI) AS MAX_SPI,
		MIN(RESULT.SPI) AS MIN_SPI
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	GROUP BY STU_INFO.BRANCH

--12. Display branch wise student�s count in descending order.
	SELECT
		STU_INFO.BRANCH,
		COUNT(*) AS TOTAL_STUDENTS
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	GROUP BY STU_INFO.BRANCH
	ORDER BY TOTAL_STUDENTS DESC



-------PART-B

--1. Display average result of each branch and sort them in ascending order by SPI.
	SELECT
		STU_INFO.BRANCH,
		AVG(RESULT.SPI) AS AVG_RESULT
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	GROUP BY STU_INFO.BRANCH
	ORDER BY AVG_RESULT ASC


--2. Display highest SPI from each branch and sort them in descending order.
	SELECT
		STU_INFO.BRANCH,
		MAX(RESULT.SPI) AS HIGHEST_SPI
	FROM STU_INFO
	INNER JOIN RESULT
	ON STU_INFO.RNO = RESULT.RNO
	GROUP BY STU_INFO.BRANCH
	ORDER BY HIGHEST_SPI DESC



-------PART-C

--1. Retrieve the names of employee along with their manager�s name from the Employee table.
	SELECT
		E.NAME,
		M.NAME
	FROM EMPLOYEE_MASTER E
	JOIN EMPLOYEE_MASTER M
	ON E.MANAGERNO=M.EMPLOYEENO
