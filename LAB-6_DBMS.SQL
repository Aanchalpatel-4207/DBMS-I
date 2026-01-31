=============LAB-6=============

CREATE TABLE STUDENT(
	STUID INT,
	FIRSTNAME VARCHAR(25),
	LASTNAME VARCHAR(25),
	WEBSITE VARCHAR(50),
	CITY VARCHAR(25),
	ADDRESS VARCHAR(100)
);

INSERT INTO STUDENT VALUES
	(1011, 'KEYUR', 'PATEL', 'TECHONTHENET.COM','RAJKOT', 'A-303 ''VASANT KUNJ'', RAJKOT'),
	(1022, 'HARDIK', 'SHAH', 'DIGMINECRAFT.COM','AHMEDABAD','"RAM KRUPA", RAIYA ROAD'),
	(1033, 'KAJAL', 'TRIVEDI', 'BIGACTIVITIES.COM','BARODA','RAJ BHAVAN PLOT, NEAR GARDEN'),
	(1044, 'BHOOMI', 'GAJERA', 'CHECHYOURMATH.COM','AHMEDABAD','"JIG''S HOME", NAROL'),
	(1055, 'HARMIT', 'MITEL', '@ME.DARSHAN.COM','RAJKOT','B-55, RAJ RESIDENCY'),
	(1066, 'ASHOK', 'JANI', NULL,'BARODA','A502, CLUB HOUSE BUILDING');

SELECT * FROM STUDENT



-------PART-A

--1. Display the name of students whose name starts with ‘k’.
	SELECT FIRSTNAME
	FROM STUDENT
	WHERE FIRSTNAME LIKE 'K%'


--2. Display the name of students whose name consists of five characters.
	SELECT FIRSTNAME
	FROM STUDENT
	WHERE FIRSTNAME LIKE '_____'


--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters.
	SELECT FIRSTNAME, LASTNAME
	FROM STUDENT
	WHERE CITY LIKE '_____%A'


--4. Display all the students whose last name ends with ‘tel’.
	SELECT *
	FROM STUDENT
	WHERE LASTNAME LIKE '%TEL'


--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE 'HA%T'


--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE 'K_Y%'


--7. Display the name of students having no website and name consists of five characters.
	SELECT FIRSTNAME
	FROM STUDENT
	WHERE WEBSITE IS NULL AND
		  FIRSTNAME LIKE '_____'


--8. Display all the students whose last name consist of ‘jer’.
	SELECT *
	FROM STUDENT
	WHERE LASTNAME LIKE '%JER%'


--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
	SELECT *
	FROM STUDENT
	WHERE CITY LIKE  '[RB]%'


--10. Display all the name students having websites.
	SELECT *
	FROM STUDENT
	WHERE WEBSITE IS NOT NULL


--11. Display all the students whose name starts from alphabet A to H.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE '[A-H]%'


--12. Display all the students whose name’s second character is vowel.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE '_[AEIOU]%'


--13. Display the name of students having no website and name consists of minimum five characters.
	SELECT FIRSTNAME
	FROM STUDENT
	WHERE WEBSITE IS NULL AND
		  FIRSTNAME LIKE '_____%'


--14. Display all the students whose last name starts with ‘Pat’.
	SELECT *
	FROM STUDENT
	WHERE LASTNAME LIKE 'PAT%'


--15. Display all the students whose city name does not starts with ‘b’.
	SELECT *
	FROM STUDENT
	WHERE CITY NOT LIKE 'B%'


--16. Display all the students whose student ID ends with digit.
	SELECT *
	FROM STUDENT
	WHERE STUID LIKE '%[0-9]'


--17. Display all the students whose address does not contain any digit.
	SELECT *
	FROM STUDENT
	WHERE ADDRESS NOT LIKE '%[0-9]%'


--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 'math' or 'science'. Ensure that their city does not start with 'B'.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE 'B%' AND
		  LASTNAME LIKE '%A' AND
		  WEBSITE LIKE '%MATH%' OR
		  WEBSITE LIKE '%SCIENCE%' AND
		  CITY NOT LIKE 'B%'


--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their website should be either null or contain 'com'.
	SELECT *
	FROM STUDENT
	WHERE LASTNAME LIKE '%SHAH%' AND
		  CITY LIKE '%D' AND
		  WEBSITE IS NULL OR
		  WEBSITE LIKE '%COM%'


--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must have a website containing '.com'
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE '[AEIOU][AEIOU]%' AND
		  CITY LIKE 'R%' AND
		  WEBSITE LIKE '%.COM%'



-------PART-B

--1. Display all the students whose name’s second character is vowel and of and start with H.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE 'H[AEIOU]%'


--2. Display all the students whose last name does not ends with ‘a’.
	SELECT *
	FROM STUDENT
	WHERE LASTNAME NOT LIKE '%A'


--3. Display all the students whose first name starts with consonant.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME NOT LIKE '[AEIOU]%'


--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their website contains 'tech' or they live in a city starting with 'R'.
	SELECT *
	FROM STUDENT
	WHERE FIRSTNAME LIKE 'K%' AND
		  LASTNAME LIKE '%TEL' AND
		  WEBSITE LIKE '%TECH%' OR
		  CITY LIKE 'R%'

--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They must have a website that ends with '.com' and their first name should not start with 'A'.
	SELECT *
	FROM STUDENT
	WHERE ADDRESS LIKE '%-%' AND
		  CITY LIKE '[RB]%' AND
		  WEBSITE LIKE '%.COM' AND
		  FIRSTNAME NOT LIKE 'A%'



-------PART-C

--1. Display all the students whose address contains single quote or double quote.
	SELECT *
	FROM STUDENT
	WHERE ADDRESS LIKE '%''%' OR
		  ADDRESS LIKE '%"%'
		 

--2. Find students whose city does not contain the letter 'S' and their address contains either single or double quotes. Their last name should start with 'P' and they must have a website that contains 'on'.
	SELECT *
	FROM STUDENT
	WHERE CITY NOT LIKE '%S%' AND 
		  (ADDRESS LIKE '%''%' OR ADDRESS LIKE '%"%') AND
		  LASTNAME LIKE 'P%' AND 
		  WEBSITE LIKE '%ON%'
				
