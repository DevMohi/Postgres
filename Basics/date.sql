--show timezone 
SHOW timezone;

--timestamp dei ekta 
SELECT now();


--table with time and time zone 
create table timeZ (
    ts TIMESTAMP without TIME ZONE , 
    tsz TIMESTAMP with TIME ZONE
);

SELECT * from timeZ;

INSERT into timeZ VALUES('2025-01-12 10:45:00' , '2025-01-12 10:45:00');

--shudu date dekte chai 
SELECT CURRENT_DATE;

--another way to see date 
SELECT now()::date;

--time 
SELECT now()::time;

--Format casting -> aro dekte parba search kore no need mukosto 
SELECT to_char(now(), 'yyyy/mm/dd');

-- Aita die 1 year piche nie jabe 
SELECT CURRENT_DATE - INTERVAL '1 year';


-- ekta age ber kortesi 
SELECT age(CURRENT_DATE , '1996-07-29');

SELECT *, age(CURRENT_DATE, dob) from students;

SELECT extract(year from '2024-01-25'::date);