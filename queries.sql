/*Queries that provide answers to the questions from all projects.*/
-- Find all animals whose name ends in "mon".
   select * from animals where name LIKE '%mon';
-- List the name of all animals born between 2016 and 2019.
select name from animals where date_of_birth  BETWEEN '2016-01-01' AND '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals where escape_attempts < 3 AND neutered =true;
-- List date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name='Agumon' OR name='Pikachu';
-- List name and escape attempts of animals that weigh more than 10.5kg
select name,escape_attempts from animals where weight_kg > 10.5;
-- Find all animals that are neutered.
select * from animals where neutered =true;
-- Find all animals not named Gabumon.
select * from animals where name!='Gabumon' ;
-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_kg>=10.4 AND weight_kg<=17.3;

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before transaction.
 BEGIN;
 UPDATE animals SET species ='unspecified';
 select species from animals ;
 Rollback;

-- Inside a transaction:
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species='pokemon' WHERE species ='';

-- Commit the transaction.
BEGIN;
COMMIT TRANSACTION;
-- Verify that change was made and persists after commit.
select species from animals;
-- Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.
-- After the roll back verify if all records in the animals table still exist. After that you can start breath as usual ;)
BEGIN;
DELET FROM animals;
ROLLBACK;

-- Inside a transaction:
-- Delete all animals born after Jan 1st, 2022.
Delete from animals where date_of_birth >='2022-01-01';
-- Create a savepoint for the transaction.
BEGIN;
SAVEPOINT SP1;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE ANIMALS SET weight_kg = weight_kg*-1;
-- Rollback to the savepoint
ROLLBACK TO SP1;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 1;

-- Commit transaction
BEGIN;
COMMIT;
-- Write queries to answer the following questions:
-- How many animals are there?
SELECT COUNT(NAME) FROM ANIMALS;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM ANIMALS WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) from animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered,MAX(escape_attempts) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
select min(weight_kg),max(weight_kg) from animals;
-- OR
select species,min(weight_kg),max(weight_kg) from animals group by species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select AVG(escape_attempts) from animals where date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';
-- or
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-12-31' AND '2000-12-31' GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
select animals.name FROM animals INNER JOIN owners on animals.owner_id=owners.id where owners.full_name ='Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
select animals.name FROM animals INNER JOIN species on animals.species_id=species.id where species.name ='Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
 select owners.full_name,animals.name from animals RIGHT JOIN owners ON owners.id=animals.owner_id;
-- How many animals are there per species?
SELECT species.name, COUNT(*)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY (species.name);
-- List all Digimon owned by Jennifer Orwell.
select species.name,owners.full_name from animals INNER JOIN owners on owners.id=animals.owner_id INNER JOIN species ON animals.species_id = species.id where owners.full_name ='Jennifer Orwell' AND species.name ='Digimon';
-- List all animals owned by Dean Winchester that haven't tried to escape.
select animals.name,owners.full_name from animals INNER JOIN owners on owners.id=animals.owner_id INNER JOIN species ON animals.species_id = species.id where owners.full_name ='Jennifer Orwell' AND animals.escape_attempts = 0;
-- Who owns the most animals?
select owners.full_name,count(*) as val_occurance from owners INNER JOIN animals ON owners.id=animals.owner_id GROUP BY (owners.full_name) ORDER BY val_occurance DESC LIMIT 1;
-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?
select animals.name from animals INNER JOIN visits ON animals.id=visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id where vets.name ='William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
-- How many different animals did Stephanie Mendez see?
select count(animals.name) from animals INNER JOIN visits ON animals.id=visits.animals_id where vets_name='Stephanie Mendez';
-- List all vets and their specialties, including vets with no specialties.
select vets.name,species.name from vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id=specializations.species_id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select animals.name from animals INNER JOIN visits ON animals.id=visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id where vets.name='Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
-- What animal has the most visits to vets?
select animals.name, COUNT(*) as visited from animals INNER JOIN  visits ON animals.id = visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id GROUP BY animals.name ORDER BY visited DESC LIMIT 1;
-- Who was Maisy Smith's first visit?
select animals.name, visits.date_of_visit,vets.name from animals INNER JOIN visits ON animals.id=visits.animals_id INNER JOIN vets ON vets.id=visits.vets_id where vets.name ='Maisy Smith' ORDER BY date_of_visit LIMIT 1;
-- Details for most recent visit: animal information, vet information, and date of visit.
select animals.*,vets.*,visits.date_of_visit from animals INNER JOIN visits ON visits.animals_id=animals.id INNER JOIN vets ON vets.id=visits.vets_id ORDER BY date_of_visit DESC LIMIT 1;
-- How many visits were with a vet that did not specialize in that animal's species?
select vets.name,COUNT(visits.vets_id) as visit,COUNT(species.name) as specialization from vets LEFT JOIN specializations ON vets.id=specializations.vets_id LEFT JOIN species ON species.id=specializations.species_id INNER JOIN visits ON visits.vets_id =vets.id GROUP BY vets.name ORDER BY visit DESC LIMIT 1;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select vets.name,species.name from vets INNER JOIN specializations ON vets.id!=specializations.vets_id INNER JOIN species ON species.id !=specializations.species_id where vets.name='Maisy Smith';