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

-- Insert the following data for vets:
INSERT INTO vets(name,age,date_of_graduation) values('William Tatcher',45,'2000-04-23'),('Maisy Smith',26,'2019-01-17'),('Stephanie Mendez',45,'1981-05-04'),('Jack Harkness',38,'2008-06-08');

-- Insert the following data for specialties:
INSERT INTO specializations(vets_name,species_name) values('William Tatcher','Pokemon'),('Stephanie Mendez','Digimon,Pokemon'),('Jack Harkness','Digimon');

-- Insert the following data for visits:
INSERT INTO visits(animals_name,vets_name,date_of_visit) values('Agumon','William Tatcher','2020-05-25'),('Agumon','Stephanie Mendez','2020-07-22'),('Gabumon','Jack Harkness','2021-02-02'),('Pikachu','Maisy Smith','2020-01-05'),('Pikachu','Maisy Smith','2020-03-08'),('Pikachu','Maisy Smith','2020-05-14'),('Devimon','Stephanie Mendez','2021-05-04'),('Charmander','Jack Harkness','2021-02-24'),('Plantmon','Maisy Smith','2019-12-21'),('Plantmon','William Tatcher','2020-04-10'),('Squirtle','Stephanie Mendez','2020-09-29'),('Angemon','Jack Harkness','2020-10-03'),('Angemon','Jack Harkness','2020-11-04'),('Boarmon','Maisy Smith','2019-01-24'),('Boarmon','Maisy Smith','2019-05-15'),('Boarmon','Maisy Smith','2020-02-27'),('Boarmon','Maisy Smith','2019-01-24'),('Boarmon','Maisy Smith','2020-08-03'),('Blossom','Stephanie Mendaz','2020-05-24'),('Blossom','Willia, Tatcher','2021-01-11');
