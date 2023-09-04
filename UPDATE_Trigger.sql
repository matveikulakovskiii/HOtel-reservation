CREATE TRIGGER guest_uuendamine
ON guest
FOR UPDATE
AS
INSERT INTO logi(kuupaev, kasutaja, andmed, tegevus)
SELECT GETDATE(), USER,
CONCAT('VANAD -',
deleted.first_name, ', ', deleted.last_name,
'UUED - ', 
inserted.first_name,', ',inserted.last_name),
'guest on uuendatud'
FROM deleted INNER JOIN inserted
ON deleted.guest_id=inserted.guest_id
--kontroll
SELECT * FROM guest
UPDATE guest SET first_name = 'Mark3'
WHERE guest_id = 4
SELECT * FROM guest
SELECT * FROM logi
