CREATE TRIGGER hotelli_lisamine
ON reserved_room
FOR INSERT
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT GETDATE(),
CONCAT(inserted.number_of_rooms,', ', r.room_type_id,', ',re.reservation_id),
USER
FROM inserted
INNER JOIN room_type r ON inserted.room_type_id=r.room_type_id
INNER JOIN reservation_id re ON inserted.reservation_id=re.reservation_id
--kontroll
INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id,status)
VALUES('235','1','1','ready');
SELECT* from reserved_room
SELECT * from logi
