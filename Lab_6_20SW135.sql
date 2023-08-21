
/*Task#01 Run the following queries:

1.	Try writing your own query to select only the id, account_id, and occurred_at columns for all orders in the orders table.
*/
 
    SELECT id, account_id, occurred_at
    FROM orders;

/*
2.	Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
*/

    SELECT id, occurred_at, total_amt_usd
    FROM orders
    ORDER BY occurred_at
    LIMIT 10;

/*
3.	Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
*/    
    SELECT id, account_id, total_amt_usd
    FROM orders
    ORDER BY total_amt_usd DESC
    LIMIT 5;

/*
4.	Write a query to return the bottom 20 orders in terms of least total. Include the id, account_id, and total.
*/    
    SELECT id, account_id, total
    FROM orders
    ORDER BY total
    LIMIT 20;

/*
5.	Write a query that returns the top 5 rows from orders ordered according to newest to oldest, 
but with the largest total_amt_usd for each date listed first for each date. 
You will notice each of these dates shows up as unique because of the time element. 
When you learn about truncating dates in a later lesson, 
you will better be able to tackle this question on a day, month, or yearly basis.
*/
   SELECT *
   FROM orders
   ORDER BY occurred_at DESC, total_amt_usd DESC
   LIMIT 5;
    
/*
6.	Write a query that returns the top 10 rows from orders ordered according to oldest to newest,
but with the smallest total_amt_usd for each date listed first for each date. 
You will notice each of these dates shows up as unique because of the time element.
When you learn about truncating dates in a later lesson, 
you will better be able to tackle this question on a day, month, or yearly basis.
*/   

    SELECT *
    FROM orders
    ORDER BY occurred_at ,total_amt_usd
    LIMIT 10;

/*
7.	Write a query that Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
*/    

    SELECT *
    FROM orders
    WHERE gloss_amt_usd >= 1000
    LIMIT 5;

/*
8.	Write a query that Pull the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
*/

    SELECT *
    FROM orders
    WHERE total_amt_usd < 500
    LIMIT 10;

/*
9.	Using the orders table, Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order.
Limit the results to the first 10 orders, and include the id and account_id fields.
*/    

    SELECT id, account_id, 
    	standard_amt_usd/standard_qty as unit_price
    FROM orders
    LIMIT 10;   

/*
10.	Using the orders table , Write a query that finds the percentage of revenue that comes from poster paper for each order.
You will need to use only the columns that end with _usd. (Try to do this without using the total column). 
Include the id and account_id fields. NOTE - you will be thrown an error with the correct solution to this question. 
This is for a division by zero. You will learn how to get a solution without an error to this query when you learn about CASE statements in a later section. 
For now, you might just add some very small value to your denominator as a work around.
*/

    SELECT id, account_id,
    	 poster_amt_usd/(poster_amt_usd + gloss_amt_usd + standard_amt_usd + 1e-10) as poster_paper_revenue
    FROM orders;
    
/*
11.	Use the accounts table to find, All the companies whose names start with 'C'.
*/    

    SELECT *
    FROM accounts
    WHERE name LIKE 'C%';

/*
12.	Use the accounts table to find, All companies whose names contain the string 'one' somewhere in the name.
*/    

    SELECT *
    FROM accounts
    WHERE name LIKE '%one%';

/*
13.	Use the accounts table to find, All companies whose names end with 's'.
*/

    SELECT *
    FROM accounts
    WHERE name LIKE '%s';

/*
14.	Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
*/    

    SELECT name,
    	   primary_poc,
           sales_rep_id
    FROM accounts
    WHERE  name in ('Walmart', 'Target','Nordstrom');

/*
15.	Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
*/    

    SELECT *
    FROM web_events
    WHERE channel in ('organic','adwords');

/*
16.	We can pull all of the rows that were excluded from the queries in the previous two concepts with our new operator.
 
 a.	Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.

*/

    SELECT name,primary_poc,sales_rep_id
    FROM accounts
    where name NOT IN ('Walmart', 'Target','Nordstrom');

/*
b.	Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
*/    

    SELECT *
    FROM web_events
    where channel NOT IN ('organic', 'adwords');

/*
17.	Use the accounts table to find:
 
 a.	All the companies whose names do not start with 'C'.

*/    

    SELECT *
    FROM accounts
    WHERE name NOT LIKE 'C%';

/*
b.	All companies whose names do not contain the string 'one' somewhere in the name.
*/    

    SELECT *
    FROM accounts
    WHERE name NOT LIKE '%one%';

/*
c.	All companies whose names do not end with 's'.
*/    

    SELECT *
    FROM accounts
    WHERE name NOT LIKE '%s';

/*
18.	Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
*/

    SELECT *
    FROM orders
    WHERE standard_qty>1000
    	  AND poster_qty=0
          AND gloss_qty=0;

/*
19.	Using the accounts table find all the companies whose names do not start with 'C' and end with 's'.
*/          

    SELECT *
    FROM accounts
    WHERE name LIKE '%s'
    	  AND name LIKE 'C%';

/*
20.	Use the web_events table to find all information regarding individuals who were contacted via organic or adwords and started 
their account at any point in 2016 sorted from newest to oldest.
*/

    SELECT *
    FROM web_events
    WHERE channel IN ('organic', 'adwords')
          AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
    ORDER BY occurred_at DESC;

/*
21.	Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
*/    

    SELECT *
    FROM orders
    WHERE standard_qty > 1000
          AND poster_qty = 0
    	  AND gloss_qty = 0;

/*
22.	Using the accounts table find all the companies whose names do not start with 'C' and end with 's'.
*/

    SELECT *
    FROM accounts
    WHERE NOT (name LIKE 'C%' AND name LIKE '%s');

/*
23.	Use the web_events table to find all information regarding individuals who were contacted via organic or adwords 
and started their account at any point in 2016 sorted from newest to oldest.
*/    
    
    SELECT *
    FROM web_events
    where channel IN ('organic', 'adwords')
    	    AND occurred_at >='2016-01-01'
          AND occurred_at <'2017-01-01'
          ORDER BY occurred_at DESC;