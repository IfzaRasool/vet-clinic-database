/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic ;

CREATE TABLE animals(id INT PRIMARY KEY NOT NULL,name TEXT NOT NULL,date_of_birth date,escape_attempts integer,neutered boolean,weight_kg decimal);
-- Add Column species.
ALTER TABLE animals ADD species TEXT;
--  Create owners table
CREATE TABLE owners(id SERIAL PRIMARY KEY NOT NULL, full_name VARCHAR(255), age int);
--  id is set as autoincremented PRIMARY KEY
ALTER TABLE animals ADD id SERIAL PRIMARY KEY;
--  Create species table
CREATE TABLE species(id SERIAL PRIMARY KEY NOT NULL, name VARCHAR(255));
-- Delete the column;
ALTER TABLE animals DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id BIGINT REFERENCES species (id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id BIGINT REFERENCES owners(id);
-- Create a table named vets
CREATE TABLE vets(id SERIAL PRIMARY KEY NOT NULL,name VARCHAR(255), age INT,date_of_graduation date);
-- Create a table named specialization.
CREATE TABLE specializations(id SERIAL PRIMARY KEY NOT NULL,vets_name VARCHAR(255), species_name VARCHAR(255));
-- Create a table named visits.
CREATE TABLE visits(id SERIAL PRIMARY KEY NOT NULL,animals_name VARCHAR(255), vets_name VARCHAR(255),date_of_visit date);

-- Database Performance
-- Run the following query to add an extra column to the owners table:
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
-- Run the following statements to add data to your database (executing them might take a few minutes):

--  Check that by running 
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;

-- Find a way to decrease the execution time of the first query. Look for hints in the previous lessons.
Excecution Time :174.423 ms
The way to decrese the excution time is create Index.
CREATE INDEX animals_index ON visits(animals_id);
After creating index "Execution Time: 58.526 ms"
-- Second query
CREATE INDEX vets_index ON visits(vets_id);
-- Third query
CREATE INDEX email_index ON owners(email);