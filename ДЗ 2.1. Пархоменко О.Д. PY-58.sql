create table if not exists Artists (
	id_artist serial primary key,
	artist_name VARCHAR (100) not null
);

create table if not exists Albums (
	id_album integer primary key,
	album_name varchar (100) not null,
	album_release_year date not null check (album_release_year > '1900-01-01')
);

create table if not exists Tracks (
	id_track integer primary key,
	track_name varchar (100) not null,
	track_duration time not null check (track_duration < '10:00:00'),
	id_album_t integer not null
);

create table if not exists Genres (
	id_genre serial primary key,
	genre_name varchar (100) not null unique
); 

create table if not exists Сollections (
	id_collection serial primary key,
	collection_title varchar (100) not null,
	collection_date date not null check (collection_date > '1900-01-01')
);

create table if not exists Artists_Genres (
	id_artist_ag integer references Artists(id_artist) not null,
	id_genre_ag integer references Genres(id_genre) not null,
	constraint pk primary key (id_artist_ag, id_genre_ag)
);

create table if not exists Artists_Album (
	id_artist_aa integer references Artists(id_artist) not null,
	id_album_aa integer references Albums(id_album) not null,
	constraint pk_ primary key (id_artist_aa, id_album_aa)
);

create table if not exists Collection_Tracks (
	id_collection_ct integer references Сollections(id_collection) not null,
	id_track_ct integer references Tracks(id_track) not null,
	constraint pk__ primary key (id_collection_ct, id_track_ct)
);
