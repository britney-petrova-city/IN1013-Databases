DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45) NOT NULL,
  species VARCHAR(45) NOT NULL,
  gender ENUM('M', 'F') NOT NULL,
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate DATE,
  eventtype VARCHAR(15) NOT NULL,
  remark VARCHAR(225) NULL,
  FOREIGN KEY (petname) REFERENCES petPet (petname),
  PRIMARY KEY (petname, eventdate)
);
