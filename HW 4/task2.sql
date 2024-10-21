USE pet_database;

SHOW TABLES LIKE 'petPet';
SHOW TABLES LIKE 'petEvent';

-- Insert pets into petPet, using INSERT IGNORE to avoid duplicates
INSERT IGNORE INTO petPet (petname, owner, species, gender, birth, death)
VALUES 
    ('Fluffy', 'Harold', 'cat', 'F', '1993-02-04', NULL),
    ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL),
    ('Claws', 'Gwen', 'cat', 'M', '1994-05-13', NULL),
    ('Buffy', 'Harold', 'dog', 'M', '1989-05-13', NULL),
    ('Puffball', 'Diane', 'hamster', 'F', '1999-03-30', NULL);

INSERT IGNORE INTO petEvent (petname, eventdate, eventtype, remark)
VALUES 
    ('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
    ('Hammy', '2020-10-15', 'vet', 'antibiotics'),
    ('Fluffy', CURRENT_DATE, 'birth', '5 kittens, 2 male'),
    ('Claws', '1997-08-03', 'vet', 'broken rib'),
    ('Buffy', '1993-06-23', 'litter', '5 puppies, 2 female, 3 male'),
    ('Buffy', '1994-06-19', 'litter', '3 puppies, 3 female');

UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

DELETE FROM petEvent WHERE petname = 'Buffy';
DELETE FROM petPet WHERE petname = 'Buffy';

SELECT * FROM petPet;
SELECT * FROM petEvent;
