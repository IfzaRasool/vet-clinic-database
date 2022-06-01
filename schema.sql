/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic ;

CREATE TABLE animals(id INT PRIMARY KEY NOT NULL,name TEXT NOT NULL,date_of_birth date,escape_attempts integer,neutered boolean,weight_kg decimal);
-- Add Column species.
ALTER TABLE animals ADD species TEXT;
--  Create owners table
CREATE TABLE owners(id SERIAL PRIMARY KEY, full_name Text, age int);
--  id is set as autoincremented PRIMARY KEY
ALTER TABLE animals ADD id SERIAL PRIMARY KEY;
--  Create species table
CREATE TABLE species(id SERIAL PRIMARY KEY, name Text);
-- Delete the column;
ALTER TABLE animals DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id BIGINT REFERENCES species (id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id BIGINT REFERENCES owners(id);