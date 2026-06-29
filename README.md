# sqlPracticeQuestions
MAKE ME UNDERSTAND SCALAR QUERY AND WHEN CAN WE USE FROM EMPLOYEE INSIDE AND WHEN TO USE IT OUTSIDE
A scalar subquery is a subquery that returns exactly one value: one row and one column. Think of it like a tiny result that you can place wherever SQL expects a single value, such as in SELECT, WHERE, HAVING, or ORDER BY.

Simple idea
If a query asks for:

one number,

one name,

one date,

then a scalar subquery is the right kind of subquery. A common example is SELECT AVG(salary) FROM employee, because AVG() returns one value.

Where FROM EMPLOYEE goes
FROM EMPLOYEE belongs inside the subquery when that inner query needs to read from the table. For example:

sql
SELECT (SELECT MAX(salary) FROM employee);
Here, the inner query reads from employee and returns one value, so it is a scalar subquery.

FROM EMPLOYEE goes outside when the outer query itself is selecting rows from the table and the subquery is only supplying a value for comparison or display. For example:

sql
SELECT name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);
The outer query reads rows from employee, while the subquery gives one average value to compare against.

Inside vs outside
Use FROM employee inside the subquery when the subquery computes the value. Use FROM employee outside when the outer query is the main row-returning query and the subquery is just helping with one value.

In your Top Earners problem
This works:

sql
SELECT
    (SELECT MAX(salary * months) FROM employee),
    (SELECT COUNT(*)
     FROM employee
     WHERE salary * months = (SELECT MAX(salary * months) FROM employee));
Why?

The first inner query returns one maximum value.

The second inner query returns one count value.

The outer SELECT just shows both values together.

Easy rule
If the subquery is giving back a single answer, it is scalar. If the main query needs rows from the table, put FROM employee in the outer query; if the subquery needs to calculate a value from the table, put FROM employee inside the subquery.

MIN() and MAX() are aggregate functions and cannot be used directly in the WHERE clause like that.
POWER() requires two arguments: POWER(value, exponent).
To calculate the Euclidean distance between the points:
(MIN(LAT_N), MIN(LONG_W))
(MAX(LAT_N), MAX(LONG_W))
