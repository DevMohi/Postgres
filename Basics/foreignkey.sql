-- Active: 1750308079453@@127.0.0.1@5432@ph@public

CREATE table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);

--On delete set cascade 
CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
);

--On delete set null
CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL
);
--On delete set default
CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT DEFAULT 2
);

ALTER TABLE post 
    alter COLUMN user_id set NOT NULL;

DROP TABLE post;
DROP TABLE "user";


INSERT INTO "user" (username) VALUES ('akash'), ('batash'), ('sagor'), ('nodi');
SELECT  * FROM "user";

INSERT INTO post (title , user_id) VALUES
('Enjoying a sunny day with Akash!' , 2),
('Batash just shared an amazing recipe!' , 1),
('Exploring adventures with Sagor' , 4),
('Nodis wisdom always leaves me inspired' , 4);

SELECT * from post;

--Insertion constraint on INSERT post 
-- Attempting to insert a post with a userID that does not exist 
-- Inserting a post with valid user ID
-- Attempting to insert a post without specifiying a user id (such as using null)

-- Deletion constraint on DELETE user 
-- Cascading Deletion -> ON DELETE CASCADE
-- Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default) 
-- Setting Null -> ON DELETE SET NULL - user id tah null set hobe jodi not null set thake tahole null hobena 
-- Set Default Value -> ON DELETE SET DEFAULT VALUE 

--On delete cascade aigulo apply korba jkn table banaba 
DELETE FROM "user"
    WHERE id = 4;

SELECT * from post;
SELECT * from "user";