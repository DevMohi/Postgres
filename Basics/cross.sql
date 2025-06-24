CREATE Table employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
); 

CREATE Table departments(
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES(1, 'John Doe', 101);
INSERT INTO employees VALUES(2, 'Jane Smith', 102);

INSERT INTO departments VALUES(101 , 'Human Resources');
INSERT INTO departments VALUES(102 , 'Marketing');

SELECT * FROM employees;
SELECT * FROM departments;


--cross join 

SELECT * from employees
CROSS JOIN departments;

-- Natural join - duita table er modde ekta common column thakle seita automatically join kore dibe
SELECT * from employees
NATURAL JOIN departments;