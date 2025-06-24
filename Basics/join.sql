CREATE table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);

INSERT INTO "user" (username) VALUES ('akash'), ('batash'), ('sagor'), ('nodi');

INSERT INTO post (title , user_id) VALUES
('Enjoying a sunny day with Akash!' , 2),
('Batash just shared an amazing recipe!' , 1),
('Exploring adventures with Sagor' , 4),
('Nodis wisdom always leaves me inspired' , 4);

DROP TABLE post;
DROP TABLE "user";

SELECT * FROM "user";
SELECT * from post; 

-- Join example 

--Inner join 
SELECT title , username FROM post
INNER JOIN "user" on post.user_id = "user".id;

--another way to write inner join 
SELECT * from post as p
JOIN "user" u on p.user_id = u.id;

-- Inserting a new post 
INSERT INTO post (id, title , user_id) VALUES
(5,'this is a test post title' , NULL);

--Left join where jeita left e rakba oitar shob data must reke dibe 

SELECT * from post as p
LEFT JOIN "user" u on p.user_id = u.id;

-- Right join where jeita right e rakba oitar shob data must reke dibe
SELECT * from post  as p
RIGHT JOIN "user" u on p.user_id = u.id;

--FULL JOIN - duita table theke shob data match koruk ya na koruk
SELECT * FROM post as p
FULL OUTER JOIN "user" as u on p.user_id = u.id; 

