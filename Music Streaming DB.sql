CREATE TABLE Award (
  award_ID INT PRIMARY KEY,  
  award_name VARCHAR(20) NOT NULL,
  award_category VARCHAR(20) NOT NULL
);

CREATE TABLE Artist (
  artist_ID INT PRIMARY KEY,
  artist_name VARCHAR(20) NOT NULL,    
  age INT NOT NULL,
  award_ID INT,
  FOREIGN KEY (award_ID) REFERENCES Award(award_ID)
);

CREATE TABLE Producer (
  producer_ID INT PRIMARY KEY,
  producer_name VARCHAR(20) NOT NULL
);

CREATE TABLE Album (
  album_ID INT PRIMARY KEY,
  album_name VARCHAR(30) NOT NULL,
  release_date VARCHAR(20) NOT NULL,
  length VARCHAR(10) NOT NULL,
  genre VARCHAR(10) NOT NULL,
  ranumber_of_singles INT NOT NULL,
  artist_ID INT,
  producer_ID INT,
  FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID),
  FOREIGN KEY (producer_ID) REFERENCES Producer(producer_ID)
);

CREATE TABLE SongWriter (
  songWriter_ID INT PRIMARY KEY,
  songWriter_name VARCHAR(20) NOT NULL
);

CREATE TABLE Song (
  song_ID INT PRIMARY KEY,
  song_name VARCHAR(20) NOT NULL,
  release_date VARCHAR(20) NOT NULL,
  length VARCHAR(10) NOT NULL,
  genre VARCHAR(20) NOT NULL,
  songWriter_ID INT,
  producer_ID INT,
  album_ID INT,
  FOREIGN KEY (songWriter_ID) REFERENCES SongWriter(songWriter_ID),
  FOREIGN KEY (producer_ID) REFERENCES Producer(producer_ID),
  FOREIGN KEY (album_ID) REFERENCES Album(album_ID)
);

CREATE TABLE "User" (
  user_ID INT PRIMARY KEY,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(20) NOT NULL,
  phone_number INT,
  email_address VARCHAR(20) NOT NULL
);

CREATE TABLE Playlist (
  playlist_ID INT PRIMARY KEY,
  playlist_name VARCHAR(20) NOT NULL,
  user_ID INT,
  FOREIGN KEY (user_ID) REFERENCES "User"(user_ID)
);

CREATE TABLE PlaylistSong (
  playlist_ID INT,
  song_ID INT,
  FOREIGN KEY (playlist_ID) REFERENCES Playlist(playlist_ID),
  FOREIGN KEY (song_ID) REFERENCES Song(song_ID),
  PRIMARY KEY (playlist_ID, song_ID)
);

INSERT INTO Award(award_ID, award_name, award_category)
VALUES(1111, 'Grammy', 'Best Alternative Music Album');

INSERT INTO Artist(artist_ID, artist_name, age, award_ID)
VALUES(11, 'Halsey', 28, 1111);

INSERT INTO Producer(producer_ID, producer_name)
VALUES(111, 'Trent Reznor');

INSERT INTO Album(album_ID, album_name, release_date, length, genre, ranumber_of_singles, artist_ID, producer_ID)
VALUES(1, "If I Can't Have Love, I Want Power", 'August 20, 2021', '42:52', 'pop-punk', 13, 11, 111);

INSERT INTO SongWriter(songWriter_ID, songWriter_name)
VALUES(111111, 'Halsey');

INSERT INTO Song (song_ID, song_name, release_date, length ,genre, songWriter_ID, producer_ID, album_ID)
VALUES(11111, 'Ya’aburnee', 'August 27, 2021', '03:07', 'pop', 111111, 111, 1);

INSERT INTO Award(award_ID, award_name, award_category)
VALUES(1112, 'Grammy', 'Album Of The Year');

INSERT INTO Artist(artist_ID, artist_name, age, award_ID)
VALUES(12, 'Billie Eilish', 21, 1112);

INSERT INTO Producer(producer_ID, producer_name)
VALUES(112, "Finneas O'Connell");

INSERT INTO Album(album_ID, album_name, release_date, length, genre, ranumber_of_singles, artist_ID, producer_ID)
VALUES(2, 'When We All Fall Asleep, Where Do We Go?', 'March 29, 2019', '42:55', 'pop', 7, 12, 112);

INSERT INTO SongWriter(songWriter_ID, songWriter_name)
VALUES(111112, "Finneas O'Connell");

INSERT INTO Song (song_ID, song_name, release_date, length ,genre, songWriter_ID, producer_ID, album_ID)
VALUES(11112, 'listen before i go', 'March 28, 2019', '04:03', 'pop', 111112, 112, 2);

INSERT INTO Song (song_ID, song_name, release_date, length ,genre, songWriter_ID, producer_ID, album_ID)
VALUES(11113, 'bury a friend', 'January 30, 2019', '03:13', 'electropop', 111112, 112, 2);

INSERT INTO Award(award_ID, award_name, award_category)
VALUES(1114, 'MTV Europe Music Awards', 'Best Song');

INSERT INTO Artist(artist_ID, artist_name, age, award_ID)
VALUES(14, 'Beyoncé', 41, 1114);

INSERT INTO Producer(producer_ID, producer_name)
VALUES(114, "Ian Dench");

INSERT INTO Album(album_ID, album_name, release_date, length, genre, ranumber_of_singles, artist_ID, producer_ID)
VALUES(4, 'I Am... Sasha Fierce', 'November 12, 2008', '41:36', 'R&B', 11, 14, 114);

INSERT INTO SongWriter(songWriter_ID, songWriter_name)
VALUES(111114, "Beyoncé");

INSERT INTO Song (song_ID, song_name, release_date, length ,genre, songWriter_ID, producer_ID, album_ID)
VALUES(11114,  'halo', 'January 20, 2009', '04:21', 'pop', 111114, 114, 4);

INSERT INTO Song (song_ID, song_name, release_date, length ,genre, songWriter_ID, producer_ID, album_ID)
VALUES(11115, 'If I Were a Boy', 'November 12, 2008', '04:09', 'pop', 111114, 114, 4);

INSERT INTO Song (song_ID, song_name, release_date, length ,genre, songWriter_ID, producer_ID, album_ID)
VALUES(11116, 'Disappear', 'November 12, 2008', '04:27', 'pop', 111114, 114, 4);

INSERT INTO "User" (user_ID, username, password, phone_number, email_address)
VALUES(0,'Termeh_nj', 3320, NULL, 'tnajjarazari@gmail.com');

INSERT INTO Playlist (playlist_ID, playlist_name, user_ID)
VALUES(00,'my_music', 0);

INSERT INTO PlaylistSong (playlist_ID, song_ID)
VALUES (00, 11111), (00, 11114), (00, 11116);

--query 1
SELECT artist_name
FROM Artist
WHERE artist_name = 'Halsey'; 
--qury 2
SELECT *
FROM Artist
WHERE age > 20 and age <30;
--query 3
SELECT artist_name
From Artist
WHERE artist_name LIKE '%yon%'
--query 4
SELECT artist_ID,artist_name
FROM Artist,SongWriter
WHERE artist_name = songWriter_name;
--query 5
SELECT award_category
FROM Award
WHERE award_name = 'MTV Europe Music Awards';
