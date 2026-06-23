https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
solution: 
-- sortest name
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;

-- Longest name
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1;

https://www.hackerrank.com/challenges/japan-population/problem?isFullScreen=true
Solution;
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE='JPN';

Q: https://www.hackerrank.com/challenges/population-density-difference/problem?isFullScreen=true
select max(population) -min(population)
from CITY;

Q: THE BLUNDER https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
  /* WHAT DOES CAST AND REPLACE DO
CAST converts a value from one data type to another, and REPLACE swaps one substring for another inside a string.

CAST
In MySQL, CAST(expr AS type) changes the data type of expr into the type you specify.

Example:

sql
CAST('123' AS UNSIGNED)
This turns the string '123' into a number.

REPLACE
In MySQL, REPLACE(str, from_str, to_str) returns a new string where every occurrence of from_str is changed to to_str.

Example:

sql
REPLACE('9009', '0', '')
This removes all 0 characters and gives '99'.

In your salary problem
When we use:

sql
REPLACE(SALARY, '0', '')
we are removing zeros from each salary value as text.

If that result needs to be treated as a number for averaging, CAST can convert it back into a numeric type.

Example:

sql
CAST(REPLACE('9009', '0', '') AS DECIMAL)
This means: remove zeros first, then treat the result as a number.*/
SELECT CEIL(
    AVG(SALARY) 
    - AVG(CAST(REPLACE(SALARY, '0', '') AS DECIMAL(10,2)))
)
FROM EMPLOYEES;

https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true

Q: https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
GROUP BY needs a column or expression from the row set, not an aggregate like MAX(...).

  SELECT 
    (SELECT MAX(SALARY*MONTHS)  
        FROM EMPLOYEE),  -- THIS IS FIRST OUTPUT
    (SELECT COUNT(*)  --THIS IS SECOND OUTPUT
        FROM EMPLOYEE 
            WHERE SALARY*MONTHS= (SELECT MAX(SALARY*MONTHS)  
        FROM EMPLOYEE) ) 
Q. WEATHER OBSERVATION STAITON 2 https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true
SUM DONT TAKE SUBQUERY AS THEIR ARGUMENT

