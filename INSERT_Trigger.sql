CREATE TRIGGER guest_lisamine
ON guest
FOR INSERT
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
FROM inserted
--kontroll
INsert into guest(first_name, last_name, member_since)
Values ('Matvei','Kulakovski','02-03-2023');
SELECT * FROM guest;
SELECT * FROM logi;
