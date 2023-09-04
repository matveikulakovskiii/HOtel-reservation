CREATE TRIGGER guest_kustutamine
ON guest
FOR DELETE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT(deleted.first_name, ', ', deleted.last_name),
'guest on kustutatud'
FROM deleted
--kontroll
DELETE FROM guest WHERE guest_id= 3
SELECT * FROM guest;
SELECT * FROM logi;
