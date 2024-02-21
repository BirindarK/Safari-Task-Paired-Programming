DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS enclosures;
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT 
);

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN  
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);


CREATE TABLE assignments (
    id SERIAL PRIMARY KEY, 
    staff_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

--Inserting values into staff
INSERT INTO staff (name, employeeNumber) VALUES ('Captain Rik', '12345');
INSERT INTO staff (name, employeeNumber) VALUES ('Spooky Sally', '67891');
INSERT INTO staff (name, employeeNumber) VALUES ('Bat Man', '12346');

--Inserting values into enclosures
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('big cat field', 20, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('lemur paradise', 80, true);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('hippo swamp', 6, true);


--Inserting values into animals
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 59, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Julien', 'Lemur', 12, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Gloria', 'Hippo', 23, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Momoto', 'Hippo', 25, 3);

--Inserting values into assignments
INSERT INTO assignments (staff_id, enclosure_id, day) VALUES (1, 1, 'Tuesday');
INSERT INTO assignments (staff_id, enclosure_id, day) VALUES (3, 2, 'Thursday');
INSERT INTO assignments (staff_id, enclosure_id, day) VALUES (2, 3, 'Monday');

-- MVP Queries
SELECT name FROM animals WHERE enclosure_id = 2;

SELECT staff_id FROM assignments WHERE enclosure_id = 3;
SELECT name FROM staff WHERE id = 2;

--Extension Queries

SELECT id FROM enclosures WHERE closedForMaintenance = true;
SELECT staff_id FROM assignments WHERE enclosure_id = 2 OR enclosure_id = 3;
SELECT name FROM staff WHERE id = 2 OR id = 3;

