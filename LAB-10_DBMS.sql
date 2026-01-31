=============LAB-10=============

CREATE TABLE STUDENT_INFO(
	RNO INT,
	NAME VARCHAR(50),
	BRANCH VARCHAR(10),
	SPI DECIMAL(5,2),
	BKLOG INT
);

INSERT INTO STUDENT_INFO VALUES
	(101, 'RAJU', 'CE', '8.80', 0),
	(102, 'AMIT', 'CE', '2.20', 3),
	(103, 'SANJAY', 'ME', '1.50', 6),
	(104, 'NEHA', 'EC', '7.65', 1),
	(105, 'MEERA', 'EE', '5.52', 2),
	(106, 'MAHESH', 'EC', '4.50', 3);

SELECT * FROM STUDENT_INFO



-------PART-A

--1. Create a view Personal with all columns.
	CREATE VIEW PERSONAL
	AS
	SELECT * FROM STUDENT_INFO

	SELECT * FROM PERSONAL


--2. Create a view Student_Details having columns Name, Branch & SPI.
	CREATE VIEW STUDENT_DETAILS
	AS
	SELECT * FROM STUDENT_INFO

	SELECT NAME,BRANCH,SPI FROM STUDENT_DETAILS


--3. Create a view AcademicData having columns RNo, Name, Branch.
	CREATE VIEW ACADEMICDATA
	AS
	SELECT * FROM STUDENT_INFO

	SELECT RNO,NAME,BRANCH FROM ACADEMICDATA


--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
	CREATE VIEW STUDENT_BKLOG
	AS
	SELECT * FROM STUDENT_INFO

	SELECT * FROM STUDENT_BKLOG
	WHERE BKLOG>2


--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
	CREATE VIEW STUDENT_PATTERN
	AS
	SELECT * FROM STUDENT_INFO

	SELECT RNO,NAME,BRANCH FROM STUDENT_PATTERN
	WHERE NAME LIKE '____'


--6. Insert a new record to AcademicData view. (107, Meet, ME)
	INSERT INTO ACADEMICDATA(RNO,NAME,BRANCH)
	VALUES(107, 'MEET', 'ME')

	SELECT * FROM STUDENT_INFO

--7. Update the branch of Amit from CE to ME in Student_Details view.
	UPDATE STUDENT_DETAILS
	SET BRANCH = 'ME'
	WHERE NAME = 'AMIT' AND BRANCH = 'CE'

	SELECT * FROM STUDENT_DETAILS


--8. Delete a student whose roll number is 104 from AcademicData view.
	DELETE FROM ACADEMICDATA
	WHERE RNO = 104

	SELECT * FROM STUDENT_DETAILS


--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and
--backlog less than 2.
	CREATE VIEW STUDENT
	AS
	SELECT * FROM STUDENT_INFO

	SELECT * FROM STUDENT
	WHERE NAME LIKE 'M%A' AND
	SPI > 6 AND
	BKLOG < 2


--10. Create the view for the students whose name contains vowel.	CREATE VIEW STUDENTS
	AS
	SELECT * FROM STUDENT_INFO	SELECT * FROM STUDENTS	WHERE NAME LIKE '%[AEIOU]%'-------PART-B--1. Create a view that displays information of all students whose SPI is above 8.5
	CREATE VIEW SPI
	AS
	SELECT * FROM STUDENT_INFO

	SELECT * FROM SPI
	WHERE SPI > 8.5


--2. Create a view that displays 0 backlog students.
	CREATE VIEW BKLOG
	AS
	SELECT * FROM STUDENT_INFO

	SELECT * FROM BKLOG
	WHERE BKLOG = 0


--3. Create a view Computerview that displays CE branch data only.	CREATE VIEW COMPUTERVIEW
	AS
	SELECT * FROM STUDENT_INFO

	SELECT * FROM COMPUTERVIEW
	WHERE BRANCH = 'CE'



-------PART-C

--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
	CREATE VIEW RESULT_EC
	AS
	SELECT * FROM STUDENT_INFO

	SELECT NAME,SPI FROM RESULT_EC
	WHERE SPI < 5 AND
		  BRANCH = 'EC'


--2. Update the result of student MAHESH to 4.90 in Result_EC view.
	UPDATE RESULT_EC
	SET BRANCH = 4.90
	WHERE NAME = 'MAHESH'

	SELECT * FROM RESULT_EC


--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5.
	CREATE VIEW STU_BKLOG
	AS
	SELECT * FROM STUDENT_INFO

	SELECT RNO,NAME,BKLOG FROM STU_BKLOG
	WHERE NAME LIKE 'M%' AND
		  BKLOG > 5


--4. Drop Computerview form the database.
	DROP VIEW COMPUTERVIEW
