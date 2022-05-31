/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic ;

CREATE TABLE animals(id INT PRIMARY KEY NOT NULL,name TEXT NOT NULL,date_of_birth date,escape_attempts integer,neutered boolean,weight_kg decimal);
-- Add Column species.
ALTER TABLE animals ADD species TEXT;