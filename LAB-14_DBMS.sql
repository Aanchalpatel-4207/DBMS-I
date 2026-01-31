=============LAB-14=============

------------------------------------SUB QUERIES-------------------------------------

------Table-1

CREATE TABLE STUDENT_DATA(
	RNO INT,
	NAME VARCHAR(50),
	CITY VARCHAR(50),
	DID INT
);

INSERT INTO STUDENT_DATA VALUES
	(101, 'RAJU', 'RAJKOT', 10),
	(102, 'AMIT', 'AHMEDABAD', 20),
	(103, 'SANJAY', 'BARODA', 40),
	(104, 'NEHA', 'RAJKOT', 20),
	(105, 'MEERA', 'AHMEDABAD', 30),
	(106, 'MAHESH', 'BARODA', 10);

SELECT * FROM STUDENT_DATA

------Table-2

CREATE TABLE DEPARTMENT(
	DID INT,
	DNAME VARCHAR(50)
);

INSERT INTO DEPARTMENT VALUES
	(10, 'COMPUTER'),
	(20, 'ELECTRICAL'),
	(30, 'MECHANICAL'),
	(40, 'CIVIL');

SELECT * FROM DEPARTMENT

------Table-3

CREATE TABLE ACADEMIC(
	RNO INT,
	SPI DECIMAL(5,2),
	BKLOG INT
);

INSERT INTO ACADEMIC VALUES
	(101, '8.8', 0),
	(102, '9.2', 2),
	(103, '7.6', 1),
	(104, '8.2', 4),
	(105, '7.0', 2),
	(106, '8.9', 3);

SELECT * FROM ACADEMIC



-------PART-A

--1. Display details of students who are from computer department.
	SELECT NAME
	FROM STUDENT_DATA
	WHERE DID = ( 
					SELECT DID FROM DEPARTMENT
					WHERE DNAME = 'COMPUTER'
				)


--2. Displays name of students whose SPI is more than 8.
	SELECT NAME
	FROM STUDENT_DATA
	WHERE RNO IN (
					SELECT RNO FROM ACADEMIC
					WHERE SPI > 8
				)


--3. Display details of students of computer department who belongs to Rajkot city.
	SELECT *
	FROM STUDENT_DATA
	WHERE CITY = 'RAJKOT'
	AND DID = (
					SELECT DID FROM DEPARTMENT
					WHERE DNAME = 'COMPUTER'
			  )


--4. Find total number of students of electrical department.
	SELECT COUNT(*) TOTAL_STU
	FROM STUDENT_DATA
	WHERE DID = (
					SELECT DID FROM DEPARTMENT
					WHERE DNAME = 'ELECTRICAL'
				)
	 
--5. Display name of student who is having maximum SPI.
	SELECT NAME
	FROM STUDENT_DATA
	WHERE RNO = (
					SELECT RNO FROM ACADEMIC
					WHERE SPI = (
									SELECT MAX(SPI) AS MAX_SPI
									FROM ACADEMIC
								)
				)

					
--6. Display details of students having more than 1 backlog.
	SELECT *
	FROM STUDENT_DATA
	WHERE RNO IN (
					SELECT RNO FROM ACADEMIC
					WHERE BKLOG > 1
				 )



-------PART-B

--1. Display name of students who are either from computer department or from mechanical department.
	SELECT NAME
	FROM STUDENT_DATA
	WHERE DID IN (
					SELECT DID FROM DEPARTMENT
					WHERE DNAME IN ('COMPUTER', 'MECHANICAL')
				)


--2. Display name of students who are in same department as 102 studying in.
	SELECT NAME
	FROM STUDENT_DATA
	WHERE DID IN (
					SELECT DID FROM DEPARTMENT
					WHERE RNO = 102
				 )




-------PART-C

--1. Display name of students whose SPI is more than 9 and who is from electrical department.
--2. Display name of student who is having second highest SPI.
--3. Display city names whose students SPI is 9.2
--4. Find the names of students who have more than the average number of backlogs across all students.
--5. Display the names of students who are in the same department as the student with the highest SPI.




------------------------------------SET OPERATORS-------------------------------------

-------PART-A

------Table-1

CREATE TABLE COMPUTER(
	ROLLNO INT,
	NAME VARCHAR(50)
);

INSERT INTO COMPUTER VALUES
	(101, 'AJAY'),
	(109, 'HARESH'),
	(115, 'MANISH');

SELECT * FROM COMPUTER

------Table-2

CREATE TABLE ELECTRICAL(
	ROLLNO INT,
	NAME VARCHAR(50)
);

INSERT INTO ELECTRICAL VALUES
	(105, 'AJAY'),
	(107, 'MAHESH'),
	(115, 'MANISH');

SELECT * FROM ELECTRICAL


--1. Display name of students who is either in Computer or in Electrical.
	SELECT NAME FROM COMPUTER
	UNION
	SELECT NAME FROM ELECTRICAL


--2. Display name of students who is either in Computer or in Electrical including duplicate data.
	SELECT NAME FROM COMPUTER
	UNION ALL
	SELECT NAME FROM ELECTRICAL


--3. Display name of students who is in both Computer and Electrical.
	SELECT NAME FROM COMPUTER
	INTERSECT
	SELECT NAME FROM ELECTRICAL


--4. Display name of students who are in Computer but not in Electrical.
	SELECT NAME FROM COMPUTER
	EXCEPT
	SELECT NAME FROM ELECTRICAL


--5. Display name of students who are in Electrical but not in Computer.
	SELECT NAME FROM ELECTRICAL
	EXCEPT
	SELECT NAME FROM COMPUTER


--6. Display all the details of students who are either in Computer or in Electrical.
	SELECT NAME FROM COMPUTER
	UNION
	SELECT NAME FROM ELECTRICAL


--7. Display all the details of students who are in both Computer and Electrical.
	SELECT NAME FROM COMPUTER
	INTERSECT
	SELECT NAME FROM ELECTRICAL



-------PART-B

------Table-1

CREATE TABLE EMP_DATA(
	EID INT,
	NAME VARCHAR(50)
);

INSERT INTO EMP_DATA VALUES
	(1, 'AJAY'),
	(9, 'HARESH'),
	(5, 'MANISH');

SELECT * FROM EMP_DATA

------Table-2

CREATE TABLE CUSTOMER(
	CID INT,
	NAME VARCHAR(50)
);

INSERT INTO CUSTOMER VALUES
	(5, 'AJAY'),
	(7, 'MAHESH'),
	(5, 'MANISH');

SELECT * FROM CUSTOMER


--1. Display name of persons who is either Employee or Customer.
	SELECT NAME FROM EMP_DATA
	UNION
	SELECT NAME FROM CUSTOMER


--2. Display name of persons who is either Employee or Customer including duplicate data.
	SELECT NAME FROM EMP_DATA
	UNION ALL
	SELECT NAME FROM CUSTOMER


--3. Display name of persons who is both Employee as well as Customer.
	SELECT NAME FROM EMP_DATA
	INTERSECT
	SELECT NAME FROM CUSTOMER


--4. Display name of persons who are Employee but not Customer.
	SELECT NAME FROM EMP_DATA
	EXCEPT
	SELECT NAME FROM CUSTOMER


--5. Display name of persons who are Customer but not Employee.
	SELECT NAME FROM CUSTOMER
	EXCEPT
	SELECT NAME FROM EMP_DATA



-------PART-C

--1. Display name of persons who is either Employee or Customer.
	SELECT NAME, EID FROM EMP_DATA
	UNION
	SELECT NAME, CID FROM CUSTOMER


--2. Display name of persons who is either Employee or Customer including duplicate data.
	SELECT NAME, EID FROM EMP_DATA
	UNION ALL
	SELECT NAME, CID FROM CUSTOMER


--3. Display name of persons who is both Employee as well as Customer.
	SELECT NAME, EID FROM EMP_DATA
	INTERSECT
	SELECT NAME, CID FROM CUSTOMER


--4. Display name of persons who are Employee but not Customer.
	SELECT NAME, EID FROM EMP_DATA
	EXCEPT
	SELECT NAME, CID FROM CUSTOMER


--5. Display name of persons who are Customer but not Employee.
	SELECT NAME, CID FROM CUSTOMER
	EXCEPT
	SELECT NAME, EID FROM EMP_DATA
