=============LAB-15=============

SELECT * FROM STU_MASTER

-------PART-A

--4. Try to update SPI of Raju from 8.80 to 12.
	UPDATE STU_MASTER
	SET SPI = 12
	WHERE NAME = 'RAJU'


--5. Try to update Bklog of Neha from 0 to -1
	UPDATE STU_MASTER
	SET BKLOG = -1
	WHERE NAME = 'NEHA'