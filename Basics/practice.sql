DROP TABLE departments;
DROP TABLE employees;

--department_id hocce aikane foreing key

CREATE table departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE Table employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10,2),
    hire_date DATE
);



INSERT INTO departments (department_name) VALUES
('HR'),
('Marketing'),
('Finance'),
('IT'),
('Sales'),
('Engineering'),
('Customer Support'),
('Administration'),
('Research'),
('Quality Assurance');


INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
('John Doe', 1, 60000.00, '2022-01-10'),
('Jane Smith', 2, 75000.50, '2021-05-22'),
('Bob Johnson', 3, 80000.75, '2020-11-15'),
('Alice Williams', 4, 90000.25, '2019-08-03'),
('David Lee', 5, 65000.50, '2020-03-18'),
('Sara Brown', 6, 70000.00, '2021-09-28'),
('Michael Green', 7, 72000.00, '2018-07-12'),
('Laura Adams', 8, 85000.00, '2022-02-01'),
('Kevin White', 9, 78000.00, '2020-06-19'),
('Emily Clark', 10, 81000.50, '2019-11-05'),
('Chris Evans', 1, 67000.75, '2023-04-10'),
('Olivia King', 2, 73000.00, '2022-10-22'),
('Daniel Moore', 3, 79000.00, '2021-03-03'),
('Sophia Hall', 4, 95000.00, '2020-12-15'),
('James Scott', 5, 62000.00, '2018-09-27'),
('Isabella Young', 6, 88000.00, '2021-01-30'),
('William Allen', 7, 91000.50, '2023-02-14'),
('Mia Hernandez', 8, 71000.25, '2019-06-20'),
('Benjamin Wright', 9, 76000.75, '2020-08-08'),
('Charlotte Turner', 10, 82000.00, '2022-07-16');

--Inner join to Retrieve Employee and Department Information - mane kon employee kon department e kaj kore seita dekhano
SELECT * FROM employees
JOIN departments ON employees.department_id = departments.department_id;

--Alternative to Inner join keyword if they have common column name 
SELECT * FROM employees
JOIN departments USING(department_id);

--Show department name with average salary 
-- departName Salary
-- HR         5000 

SELECT department_name,round(avg(salary)) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY department_name;


--Count employees in each department 
SELECT department_name,count(employee_id) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY department_name;

--Find the department name with the highest average salary
SELECT department_name, round(avg(salary)) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1;

--Count employees hired each year 

SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_hired
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

