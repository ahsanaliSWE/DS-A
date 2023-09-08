/* Task#01 – Basic SQL -Run the following queries:
  1. Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.*/
      
    SELECT *
    FROM orders
    WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

/* 2. Using the accounts table find all the companies whose names do not start with 'C' and end with 's'.*/

   SELECT *
   FROM accounts
   WHERE name NOT LIKE 'C%' AND name LIKE '%s';


/* 3. Use the web_events table to find all information regarding individuals who were contacted via organic or adwords and started their account at any point in 2016 sorted from newest to oldest.*/
   
    SELECT *
    FROM web_events
    WHERE channel IN ('organic', 'adwords') 
    	AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
    ORDER BY occurred_at DESC;

/*Task#02 – Joins  -Run the following queries:
   1. Provide a table that provides the region for each sales_rep along with their associated accounts. 
   This time only for the Midwest region. Your final table should include three columns: the region name, 
   the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
*/  
    SELECT r.name region, s.name rep, a.name account
    FROM sales_reps s
    JOIN region r
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    WHERE r.name = 'Midwest'
    ORDER BY a.name;
    
/*
  2. Provide a table that provides the region for each sales_rep along with their associated accounts. 
  This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. 
  Your final table should include three columns: the region name, the sales rep name, and the account name. 
  Sort the accounts alphabetically (A-Z) according to account name.
*/

    SELECT r.name region, s.name rep, a.name account
    FROM sales_reps s
    JOIN region r
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
    ORDER BY a.name;
/*    
  3. Provide a table that provides the region for each sales_rep along with their associated accounts. 
  This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
  Your final table should include three columns: the region name, the sales rep name, and the account name. 
  Sort the accounts alphabetically (A-Z) according to account name.
*/
    
    SELECT r.name region, s.name rep, a.name account
    FROM sales_reps s
    JOIN region r
    ON s.region_id = r.id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
    ORDER BY a.name;
    
/* 
Task#03 – SQL Aggregations -Run the following queries:
 1. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. 
 This should give a dollar amount for each order in the table.
*/

    SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
    FROM orders;
/*
 2. Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. 
  Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
*/
    SELECT AVG(standard_qty) standard_average_qty,
           AVG(standard_amt_usd) standard_average_usd,
           AVG(gloss_qty) gloss_average_qty,
           AVG(gloss_amt_usd) gloss_average_usd,
           AVG(poster_qty) poster_average_qty,
           AVG(poster_amt_usd) poster_average_usd
    FROM orders     


/*
3. Which account used facebook most as a channel?    
*/
    
    SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
    FROM accounts a
    JOIN web_events w
    ON a.id = w.account_id
    WHERE w.channel = 'facebook'
    GROUP BY a.id, a.name, w.channel
    ORDER BY use_of_channel DESC
    limit 1

/*
Task#04 –SQL Subqueries-Run the following queries:
   1. Use DATE_TRUNC or EXTRACT to pull month level information about the first order ever placed in the orders table.   
*/    

    SELECT EXTRACT(YEAR FROM MIN(occurred_at)) AS first_order_year,
       EXTRACT(MONTH FROM MIN(occurred_at)) AS first_order_month
    FROM orders;

/*
Task#05 –SQL Data Cleaning -Run the following queries:
   1. In the accounts table, there is a column holding the website for each company. 
   The last three digits specify what type of web address they are using. 
   A list of extensions (and pricing) is provided here. Pull these extensions and provide how many of each website type exist in the accounts table
*/    

    SELECT count(*)
    FROM (
        SELECT Right(website,3)
        FROM accounts
    GROUP BY 1
    ) sub
    
