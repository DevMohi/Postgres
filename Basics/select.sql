CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT , 
    grade CHAR(2), 
    course VARCHAR(50), 
    email VARCHAR(50),
    dob DATE,
    blood_group VARCHAR(50),
    country VARCHAR(50)
)


INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('Ayesha', 'Rahman', 20, 'A+', 'Computer Science', 'ayesha.rahman@example.com', '2005-03-14', 'A+', 'Bangladesh'),
('Rafi', 'Ahmed', 22, 'B', 'Mechanical Engineering', 'rafi.ahmed@example.com', '2003-06-25', 'B+', 'Bangladesh'),
('Sarah', 'Haque', 19, 'A', 'Business Administration', 'sarah.haque@example.com', '2006-01-10', 'O+', 'Bangladesh'),
('Tanvir', 'Islam', 21, 'C', 'Electrical Engineering', 'tanvir.islam@example.com', '2004-09-08', 'AB-', 'Bangladesh'),
('Nadia', 'Karim', 18, 'A+', 'Psychology', 'nadia.karim@example.com', '2007-11-17', 'A-', 'Bangladesh'),
('Hasan', 'Ali', 23, 'B+', 'Accounting', 'hasan.ali@example.com', '2002-04-30', 'B-', 'Bangladesh'),
('Meher', 'Nigar', 20, 'A', 'Biotechnology', 'meher.nigar@example.com', '2005-05-21', 'O-', 'Bangladesh'),
('Adnan', 'Khan', 19, 'A-', 'Civil Engineering', 'adnan.khan@example.com', '2006-07-14', 'B+', 'Bangladesh'),
('Rumana', 'Akter', 22, 'B', 'Sociology', 'rumana.akter@example.com', '2003-08-09', 'O+', 'Bangladesh'),
('Sajib', 'Hossain', 21, 'C+', 'Physics', 'sajib.hossain@example.com', '2004-02-12', 'A+', 'Bangladesh'),
('Mim', 'Chowdhury', 20, 'A-', 'Economics', 'mim.chowdhury@example.com', '2005-10-03', 'AB+', 'Bangladesh'),
('Fahim', 'Rahman', 24, 'B+', 'Political Science', 'fahim.rahman@example.com', '2001-12-15', 'A-', 'Bangladesh'),
('Lamia', 'Islam', 18, 'A+', 'English Literature', 'lamia.islam@example.com', '2007-01-19', 'B+', 'Bangladesh'),
('Rashed', 'Kabir', 20, 'B-', 'Software Engineering', 'rashed.kabir@example.com', '2005-04-11', 'O-', 'Bangladesh'),
('Tania', 'Hossain', 19, 'A', 'Mathematics', 'tania.hossain@example.com', '2006-06-22', 'O+', 'Bangladesh'),
('Imran', 'Mia', 21, 'C', 'History', 'imran.mia@example.com', '2004-03-27', 'B-', 'Bangladesh'),
('Sabina', 'Noor', 22, 'B+', 'Law', 'sabina.noor@example.com', '2003-09-29', 'AB+', 'Brazil'),
('Zahid', 'Huq', 23, 'A-', 'Finance', 'zahid.huq@example.com', '2002-08-05', 'A+', 'Ronaldo'),
('Priya', 'Sultana', 18, 'A+', 'Journalism', 'priya.sultana@example.com', '2007-11-02', 'O+', 'India'),
('Omar', 'Faruk', 20, 'B', 'Marketing', 'omar.faruk@example.com', '2005-05-07', 'B+', 'Australia');



--Select every column from students 
SELECT * FROM students;

DROP TABLE students;

--Specific column from students 
SELECT email,age FROM students;

--Change name as alias 
SELECT email as studentEmail from students  

--Change name with space 
SELECT email as "Student Email" from students  

--Sorting with ORDER BY 
SELECT * FROM students ORDER BY age DESC;


--Distinct shows only the unique values  
SELECT DISTINCT blood_group FROM students; 

--data filtering (Where)
--Select stutdents from country brazil 
-- Select student with grade A+ and the course computer science 
-- Select student with blood group A+ 
-- Select student from australia and brazil 
-- Select students from brazil or australia whose age is 20 
-- Select students with grade A or B in Math or Physics 

SELECT country, email FROM students 
    WHERE country = 'Brazil';

SELECT * FROM students
    where grade = 'A+' AND course = 'Computer Science'

SELECT blood_group FROM students
    WHERE blood_group = 'A+';

SELECT * FROM students
    WHERE country = 'Australia' OR country = 'Brazil';

SELECT * FROM students
    WHERE (country = 'Australia' OR country = 'Brazil') AND age = '20';


--Comparison Operator 
-- Select students older than 20

Select * from students
    WHERE age>20 AND course = 'History'; 


--Ekta column k upper case kora with function , shows the new column with alias

--Concat functions 

--Two types of function
-- Scalar - prottek ta value er jnno run kore and data banai 

SELECT upper(first_name) as first_name_in_upper, * from students; ADD
SELECT concat(first_name, ' ', last_name) from students;
SELECT length(first_name) from students;


--Aggregate - avg, max, min, sum , count - ekta set of data er jnno ekta value de
SELECT avg(age) from students;
SELECT max(age) from students;
SELECT min(age) from students;
SELECT sum(age) from students;
SELECT count(*) from students; 

--Combination of aggregate and scalar
SELECT max(length(first_name)) from students;


--AND OR NOT (Negation)
SELECT * FROM students
    WHERE NOT country = 'Brazil';

--NULL eita smartly handle kora lagbe aita normal WHERE die kaaj kaaj korena 

SELECT * from students
    WHERE email IS NOT NULL;

-- COALESCENE FUNCTION null er jaigai default kichu boshai dibe -> handles naam 
SELECT COALESCE(email , 'Email not provided') as "Email" from students;


--This is similar to country = 'Brazil' or country = 'Bangladesh' and below is not version 
SELECT * from students WHERE country IN ('Brazil' , 'Bangladesh');
SELECT * from students WHERE country NOT IN ('Brazil' , 'Bangladesh');

SELECT * from students 
    WHERE dob BETWEEN '2004-01-01' and '2004-06-01';

--pattern wise a% start hocce a die and %a sesh hocce a die 
SELECT * from students
    WHERE first_name LIKE '%a';

--e.g ->  Sarah
SELECT * from students 
    WHERE first_name LIKE '___a_';

-- like hocce case-sensitive and iLIKE hocce case-insenstive aitai difference 

--limit and offset (mostly for pagination)
SELECT * from students limit 5 OFFSET 5*0;


SELECT * from students
    WHERE country IN ('Brazil') limit 1;

-- data k kemne delete korte pari   

--Same as drop be very careful; 
DELETE FROM students
    WHERE grade = 'A+';

SELECT * from students;


--Row data kemne update korte parbo 
UPDATE students 
    set country ='USA' , age = 20
    WHERE student_id = 18;