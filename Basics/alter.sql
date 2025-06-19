-- Active: 1750308079453@@127.0.0.1@5432@ph
--Running all data from table person2
SELECT * from person2;

--Alter , add column with data type and set default email 
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@email.com' NOT NULL;

--Drop a table 
ALTER TABLE person2
    DROP COLUMN email;

--postgres is case insensitive and renaming column 
ALTER TABLE person2
    RENAME COLUMN age to user_age; 

--Change a column type 
ALTER TABLE person2 
    ALTER COLUMN user_name TYPE VARCHAR(50);

--Change a constraint 
ALTER TABLE person2
    ALTER COLUMN user_age set NOT NULL;

--Remove a constraint 
ALTER TABLE person2
    ALTER COLUMN user_age drop NOT NULL;


--Unique , foreign key has a different method to add as a constraint 
ALTER TABLE person2
    ADD CONSTRAINT unique_person2_user_age UNIQUE(user_age);

--drop constraint for unique methid 
ALTER TABLE person2
    DROP CONSTRAINT unique_person2_user_age;

--Drop korle pura table chole jabe 
DROP table person2; 


--Table thakble structure thakbe kintu data thakbena for truncate 
TRUNCATE TABLE person2;

INSERT INTO person2 VALUES(4, 'farhan', 25, 'farhan@gmail.com');