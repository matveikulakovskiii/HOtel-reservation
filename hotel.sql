create table guest(
guest_id int not null Primary key identity(1,1),
first_name varchar(50),
last_name varchar (80) null,
member_since date)
Select * from reservation

INsert into room_type(description, max_capacity)
Values ('bad ','3')

create table reservation(
reservation_id int not null Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(guest_id))

DROP table guest

create table room_type (
room_type_id int not null Primary key identity(1,1),
description varchar(80),
max_capacity int)

Select * from guest


create table reserved_room (
reserved_room_id int not null Primary key identity(1,1),
number_of_rooms int,
room_type_id int,
foreign key (room_type_id) references room_type(room_type_id),
reservation_id int,
foreign key (reservation_id) references reservation(reservation_id),
status varchar(20))

INsert into hosted_at(guest_id, occupied_room_id)
Values ('5','7')

create table room (
room_id int not null Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(room_type_id))

create table occupied_room (
occupied_room_id int not null Primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key (room_id) references room(room_id),
reservation_id int,
foreign key (reservation_id) references reservation(reservation_id)
)

create table hosted_at(
hosted_at int not null Primary key identity(1,1),
guest_id int,
foreign key (guest_id) references guest(guest_id),
occupied_room_id int,
foreign key (occupied_room_id) references occupied_room(occupied_room_id))
