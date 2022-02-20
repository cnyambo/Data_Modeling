-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
 
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
 
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  countryID int,
  FOREIGN KEY (countryID)
    REFERENCES countries (id)
);



CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airlineID int,
   FOREIGN KEY (airlineID)
    REFERENCES airlines (id) 
       
);


CREATE TABLE departures
(
  id SERIAL PRIMARY KEY,
  ticketID int,
  cityID int,
  countryID int,
  FOREIGN KEY (countryID)
    REFERENCES countries (id),
  FOREIGN KEY (ticketID)
    REFERENCES tickets (id),
   FOREIGN KEY (cityID)
    REFERENCES cities (id)     
 
);


CREATE TABLE destinations
(
  id SERIAL PRIMARY KEY,
  ticketID int,
  cityID int,
  countryID int,
  FOREIGN KEY (countryID)
    REFERENCES countries (id),
  FOREIGN KEY (ticketID)
    REFERENCES tickets (id),
   FOREIGN KEY (cityID)
    REFERENCES cities (id)     
 
);

INSERT INTO airlines
    (airline)

VALUES
    ('United'),
    ('British Airways'),
    ('Delta'),
    ('TUI Fly Belgium'),
    ('Air China'),
    ('American Airlines'),
    ('Avianca Brasil');

INSERT INTO countries
    (country)

VALUES
    ('United States'),
    ('Japan'),
    ('France'),
    ('UAE'),
    ('Brazil'),
    ('United Kingdom'),
    ('Mexico'),
    ('Morocco'),
    ('China') ,
    ('Chile');    

INSERT INTO cities
    (city, countryID)

VALUES
    ('Washington DC',1),
    ('Chicago',1),
    ('New Orleans',1) ,   
    ('Los Angeles',1),
    ('Seattle',1),
    ('New York',1),
    ('Cedar Rapids',1),
    ('Charlotte',1),
    ( 'Las Vegas',1),   
    ('Tokyo',2),     
    ('Paris',3),
    ('Dubai',4),
    ('Sao Paolo',5),
    ('London',6),
    ( 'Mexico City',7),
    ('Casablanca',8),
    ('Beijing',9) ,
    ('Santiago',10);  

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airlineID)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1 ),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7);



INSERT INTO departures
  (ticketID, cityID, countryID)
VALUES
  (1,  1,1),
  (2, 10,2),
  (3,  4,1),
  (4,  5,1),
  (5,  11,3),
  (6,  12,4),
  (7,  6,1),
  (8,  7,1),
  (9, 8,1),
  (10, 13,5);


INSERT INTO destinations
  (ticketID, cityID, countryID)
VALUES
  (1, 5,1),
  (2, 14,6),
  (3, 9,1),
  (4, 15,7),
  (5, 16,8),
  (6, 17,9),
  (7, 8,1),
  (8, 2,1),
  (9, 3,1),
  (10,18,10);

---Query to get the initial values

 SELECT first_name, last_name, seat, departure, arrival, airline,
        ci.city as city_from, co.country as country_from, 
        c.city as city_to, ct.country as country_to
FROM tickets t
JOIN airlines a ON t.airlineID = a.id
JOIN departures d ON d.ticketID = t.id
JOIN destinations ds ON ds.ticketID = t.id
JOIN cities ci ON ci.id = d.cityID
JOIN countries co ON co.id = d.countryID
JOIN cities c ON c.id = ds.cityID
JOIN countries ct ON ct.id = ds.countryID
;