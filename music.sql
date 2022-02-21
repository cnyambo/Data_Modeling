-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE types
(
  id SERIAL PRIMARY KEY,
  type TEXT NOT NULL
   
);
CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  typeID int,
  FOREIGN KEY (typeID)
      REFERENCES types (id),
   
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
   
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  userID INT,
  albumID INT,

  FOREIGN KEY (userID)
      REFERENCES users (id),
  FOREIGN KEY (albumID)
      REFERENCES albums (id) 
);

CREATE TABLE song_users
(
  songID int, 
  userID int,
  FOREIGN KEY (songID)
      REFERENCES songs (id),
  FOREIGN KEY (userID)
      REFERENCES users (id)  

);


INSERT INTO albums
    (album)
VALUES
    ('Middle of Nowhere'),
    ('A Night at the Opera'),
    ('Daydream'),
    ('A Star Is Born'),
    ('Silver Side Up'),
    ('The Blueprint 3'),
    ('Prism'),
    ('Hands All Over'),
    ('Let Go'),
    ('The Writing''s on the Wall');
       

INSERT INTO users
    (name, typeID)
VALUES
    ('Hanson',1),
    ('Queen',1),
    ('Mariah Cary',1),
    ('Boyz II Men',1),
    ('Lady Gaga',1),
    ('Bradley Cooper',1),
    ('Nickelback',1),
    ('Jay Z',1),
    ('Alicia Keys',1),
    ('Katy Perry',1),
    ('Juicy J',1),
    ('Maroon 5',1),
    ('Christina Aguilera',1),
    ('Avril Lavigne',1),
    ('Destiny''s Child',1),
    ('Dust Brothers',2),
    ('Stephen Lironi',2),
    ('Roy Thomas Baker',2),
    ('Walter Afanasieff',2),
    ('Benjamin Rice',2),
    ('Rick Parashar',2),
    ('Al Shux',2),
    ('Max Martin',2),
    ('Cirkut',2),
    ('Shellback',2),
    ('Benny Blanco',2),
    ('The Matrix',2),
    ('Darkchild',2) ;  



INSERT INTO songs
  (title, duration_in_seconds, release_date,   albumID)
VALUES
  ('MMMBop', 238, '04-15-1997',  1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2 ),
  ('One Sweet Day', 282, '11-14-1995',  3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2001',  5),
  ('New York State of Mind', 276, '10-20-2009',6 ),
  ('Dark Horse', 215, '12-17-2013', 7),
  ('Moves Like Jagger', 201, '06-21-2011',  8),
  ('Complicated', 244, '05-14-2002',  9),
  ('Say My Name', 240, '11-07-1999',  10);

INSERT INTO    song_users
VALUES
    (1,1),
    (2,2),
    (3,3),
    (3,4),
    (4,5),
    (4,6),   
    (5,7),
    (6,8),
    (6,9),
    (7,10),
    (7,11),
    (8,12),
    (8,13),
    (9,14),
    (10,15)
    (1,16),
    (1,17),
    (2,18),
    (3,19),
    (4,20),
    (5,21),   
    (6,22),
    (7,23),
    (7,24),
    (8,25),
    (8,26),
    (9,27),
    (10,28);


