--Ülesanne 1
SELECT * FROM guest
go
CREATE PROCEDURE Andmete_lisamine
@osaID int
AS
BEGIN
SELECT first_name,last_name  
FROM guest
WHERE guest_id = @osaID;
END
 
EXEC Andmete_lisamine @osaID=4;
SELECT * FROM guest
--Ülesanne 2
go
CREATE PROCEDURE Kustutamine
@deleteID int
AS
BEGIN
SELECT * FROM guest;
DELETE FROM guest 
WHERE guest_id=@deleteID;
SELECT * FROM guest;
END
 
EXEC Kustutamine @deleteID= 4;
--Ülesanne 3

go
CREATE PROCEDURE uuendamine
@omaID int
AS
BEGIN
SELECT * FROM guest;
UPDATE guest SET member_since='04-06-2022'
WHERE guest_id=@omaID;
SELECT * FROM guest;
END
 
EXEC uuendamine @omaID=5;
--Ülesanne 4
go
CREATE PROCEDURE Külalliste_leidmine
AS
BEGIN
SELECT count(guest_id) as guest_kogus
FROM guest;
END
 
EXEC Külalliste_leidmine;
--Ülesanne 5

go
CREATE PROCEDURE oma_protseduur
AS
BEGIN
SELECT member_since,
IIF (member_since LIKE '2022-04-06', 'Halvasti', 'Hästi') AS Member_guest
FROM guest;
END
 
EXEC oma_protseduur;
