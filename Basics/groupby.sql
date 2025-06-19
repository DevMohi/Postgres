SELECT * from students; 

--Group korte parba jeigulo single value add kore such as aggregate values or single values 
-- group by first split kore based on groups for example USA, AUS , Uk then takes the value and apply the formula and combine it to a single value. 
SELECT country, count(*), avg(age) from students
    GROUP BY country;

--Where chole row er upore ar having chole group er upor 
SELECT country, count(*), avg(age) from students
    GROUP BY country
        HAVING avg(age) > 20.60;

--Count students born in each year 
SELECT extract(year from dob) as birth_year , count(*)
    FROM students
    GROUP BY birth_year