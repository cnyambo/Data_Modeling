-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  orbit TEXT NOT NULL
   
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
   
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
   
);



CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbitID  int, 
  galaxyID int, 
  FOREIGN KEY (orbitID)
      REFERENCES orbits (id),
  FOREIGN KEY (galaxyID)
      REFERENCES galaxy (id)
);


CREATE TABLE planets_moons
(
  planetsID int, 
  moonID int,
  FOREIGN KEY (planetsID)
      REFERENCES planets (id),
  FOREIGN KEY (moonID)
      REFERENCES moons (id)  

);


INSERT INTO orbits (orbit) 
VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxy (galaxy) 
VALUES 
('Milky Way'),
('Andromeda Galaxy'),
('Sombrero Galaxy'),
('Large Magellanic Cloud');



INSERT INTO moons
  (moon)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'), 
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'), 
  ('S/2004 N 1'), 
  ('Proteus'), 
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');


INSERT INTO planets
  (name, orbital_period_in_years, orbitID, galaxyID)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1,1),
  ('Venus', 0.62, 1,1),
  ('Neptune', 164.8, 1,1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3,1);

INSERT INTO planets_moons (planetsID, moonID)
VALUES
(1,1),
(2,2),
(2,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15),
(3,16),
(3,17);