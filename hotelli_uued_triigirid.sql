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
--kontroll
INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id,status)
VALUES('235','1','1','ready');
SELECT* from reserved_room
SELECT * from logi


  

CREATE TRIGGER hotelli_kuendamine
ON reserved_room
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT GETDATE(),
CONCAT(' Vanad andmed ', deleted.number_of_rooms,', ', r1.room_type_id,', ',re1.reservation_id,
' Uued - ', inserted.number_of_rooms, ', ', r.room_type_id,', ',re.reservation_id),
USER
FROM deleted
inner join inserted ON deleted.reserved_room_id=inserted.reserved_room_id
INNER JOIN room_type r ON inserted.room_type_id=r.room_type_id
INNER JOIN reservation re ON inserted.reservation_id=re.reservation_id
INNER JOIN room_type r1 ON deleted.room_type_id=r.room_type_id
INNER JOIN reservation re1 ON deleted.reservation_id=re.reservation_id
--kontroll
SELECT * FROM reserved_room
UPDATE reserved_room SET room_type_id=2, reservation_id=2
WHERE number_of_rooms='235'
SELECT * FROM reserved_room
SELECT * FROM logi
