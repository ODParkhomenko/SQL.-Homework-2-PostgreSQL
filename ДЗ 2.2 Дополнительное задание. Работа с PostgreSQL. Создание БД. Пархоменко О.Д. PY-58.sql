create table if not exists Staff (
	id_staff serial primary key,
	staff_name varchar(100) not null
);

create table if not exists Department (
	id_department serial primary key,
	department_name varchar(100) not null
);

create table if not exists Position_list (
	id_position serial primary key,
	position_name varchar(100) not null
);

create table if not exists Department_Position (
	id_department_position serial primary key,
	id_department integer references Department (id_department),
	id_position integer references Position_list (id_position)
);

create table if not exists Employee (
	id_staff integer references Staff (id_staff),
	id_supervisor integer references Department_Position (id_department_position),
	id_position integer references Department_Position (id_department_position),
	constraint empl primary key (id_staff, id_supervisor, id_position)
)
