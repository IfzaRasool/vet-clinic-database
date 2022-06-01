/* Populate database with sample data. */
INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(1,'Agumon','2020-03-02',true,0,10.23);
INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(2,'Gabumon','2018-11-15',2,true,8),(3,'Pikachu','2021-01-07',1,false,15.04),(4,'Devimon','2017-05-12',5,true,11);

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(5,'Charmander','2020-02-08',0,false,-11),(6,'Plantmon','2021-11-15',2,true,-5.7),(7,'Squirtle','1993-04-02',3,false,-12.13),(8,'Angemon','2005-06-12',1,true,-45),(9,'Boarmon','2005-06-07',7,true,20.4),(10,'Blossom','1998-10-13',3,true,17),(11,'Ditto','2022-05-14',4,true,22);
-- Insert the following data into the owners table:
INSERT INTO owners(full_name,age) values('Sam Smith',34),('Jennifer Orwell',19),('Bob',34),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittarker',38);
-- Insert the following data into the species table:
INSERT INTO species(name) values('Pokemon'),('Digimon');
-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
UPDATE ANIMALS SET species_id=2 where name LIKE '%mon';
-- All other animals are Pokemon
UPDATE ANIMALS SET species_id=1 where name NOT LIKE '%mon';
-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
 UPDATE ANIMALS SET owner_id=1 where name='Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE ANIMALS SET owner_id=2 where name='Gabumon' AND name='Pikachu';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
 UPDATE ANIMALS SET owner_id=4 where name='Charmander' OR name='Squirtle' OR name='Blossom';
-- Bob owns Devimon and Plantmon.
 UPDATE ANIMALS SET owner_id=3 where name='Devimon' OR name='Plantmon';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE ANIMALS SET owner_id=5 where name='Angemon' OR name='Boarmon';