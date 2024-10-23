USE pet_database;

INSERT INTO petPet VALUES
    ("Hammy", "Diane", "hamster", "M", "2020-10-30", NULL);

INSERT INTO petEvent VALUES
    ("Fluffy", "2020-10-15", "vet", "antibiotics"),
    ("Hammy", "2020-10-15", "vet", "antibiotics");

UPDATE petEvent
SET remark = "5 kittens, 3 female, 2 male"
WHERE petname = "Fluffy" AND eventdate = "1995-05-15" AND eventtype = "litter";

UPDATE petEvent
SET petname = "Claws"
WHERE eventdate = "1997-08-03" AND eventtype = "vet" AND remark = "broken rib";

UPDATE petPet
SET death = "2020-09-01"
WHERE petname = "Puffball"; 

DELETE FROM petEvent
WHERE petname = "Buffy";

DELETE FROM petPet
WHERE petname = "Buffy";