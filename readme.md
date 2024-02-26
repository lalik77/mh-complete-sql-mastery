# Retrieving data from a multiple tables

I will use Idea ultimate to generate visualisation for tables inside sql_store.

![](img/sql-store-uml.png)

### 1 - The `INNER JOIN` STATEMENT

Inside `orders` table we don't store info about customers, we only store `customer_id`
We can do not write `INNER` , its by default.
![](img/output-1.png)

We can say which columns we want to receive and retrieve data.

![](img/output-2.png)

What if we add the field `customer_id`
![](img/output-3.png)

We have this column is present in two tables, we have to qualify
![](img/output-4.png)

Pay attention when we are repeating words
![](img/output-5.png)
For this we can use `alias`
![](img/output-6.png)

#### Exercise 1

![](img/exercise-1.png)

Look at the `order_items` table Write a query and join with products table. So for each order, return the product id,
and it's name, followed by the quantity and the unit price Use the `Alias` to simplify the code.

![](img/ex-solution-1-1.png)

![](img/ex-solution-1-2.png)

### 2 - Joining Accross Databases

How combine columns across multiple databases
![](img/output-7.png)

### 3 - Self Joins

In SQL we can also join table with itself Example -> sql_hr
![](img/sql-hr-db.png)

Let's take a look at the data inside
![](img/output-8.png)
Self Join
![](img/output-9.png)
Let's simplify the `select`
![](img/output-10.png)

Joining a table with itself , it's pretty much like join different tables, the only difference we have to give different
alias and use those alis for columns.

### 4 - Joining Multiple Tables

How to join more than two tables when writing a query
![](img/output-11.png)
We want to write a query to obtain a report like this
![](img/output-12.png)

![](img/output-13.png)

#### Exercise 2

In db `sql_invoicing`, we have this table store `client_id` and `payment_method` and other data. Join with `clients`
table and `payment_method`. Produce a view that shows the details of the cliend an the payment method.
![](img/exercise-2.png)

![](img/ex-solution-2.png)

### 5 - Compound Join Conditions

![](img/output-14.png)

Look at this uml , we have `order_items` table that contains more than one primary key

![](img/output-15.png)

in table `order_item_notes`we have two notes for `order_id=1` and `product_id=1`

![](img/output-16.png)

![](img/output-17.png)

### 6 - Implicit Join Syntax

![](img/output-18.png)

### 7 - Outer Joins

`INNER JOIN` -> we can do not write `INNNER` <br>
`OUTER JOIN` -> `RIGHT JOIN` and `LEFT JOIN`

![](img/output-19.png)

If we want to have all orders

![](img/output-20.png)

RIGHT JOIN will be SIMILAR to JOIN

![](img/output-21.png)

#### Exercise 3

Write a query that produce this result. We need to join `products` table with `order_items` table.
![](img/output-22.png)

![](img/output-23.png)

![](img/ex-solution-3.png)

### 8 - Outer Joins Between Multiple Tables

![](img/output-24.png)

![](img/output-25.png)

We will add `LEFT`
![](img/output-26.png)

As a best practice avoid to use `RIGHT JOIN` and use `LEFT JOIN` instead.

#### Exercise 4

Write a query that produce this result.
![](img/exercise-4.png)

![](img/ex-solution-4.png)

### 9 - Self Outer Joins

In `sql_hr` db we have `employees` table.<br>
With `LEFT` join we produce all record, even the condition is true or not

![](img/output-27.png)

### 10 - Using Clause

Let's take a look to this query
![](img/output-28.png)

```sql
ON o.customer_id = c.customer_id;
```

Can be replaced by this and like this is more readable

```sql
USING
    (customer_id)
```

![](img/output-29.png)

Let's take a look to another query

![](img/output-30.png)

#### Exercise 5

![](img/exercise-5.png)

Let's generate in Idea uml diagram
![](img/uml-sql-invoicing.png)

![](img/ex-solution-5.png)

### 11 - Natural Joins

Let's generate uml diagram for sql_store
![](img/uml-sql-store.png)

Easy to code but can be dangerous. Can produce unexpected results.
![](img/output-32.png)

### 12 - Cross Joins

Explicit Syntax
![](img/output-33.png)

Implicit Syntax
![](img/output-34.png)

#### Exercise 6

![](img/exercise-6.png)

Explicit syntax
![](img/ex-solution-6.png)

Implicit syntax
![](img/ex-solution-6-implicit.png)

### 13 - Unions

Using `UNION` we can combine records from multiple queries.

13.1 - Against the same table

Let's take a look to this query

```sql
USE sql_store;
SELECT order_id,
       order_date,
       'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01';
```

![](img/output-35.png)

And to another query

```sql
USE sql_store;

SELECT order_id,
       order_date,
       'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';
```

![](img/output-36.png)

We can use 'UNION'
![](img/output-37.png)

Both those queries are against the same table

13.2 - Against different tables and combine result into one resultset

![](img/output-38.png)

If we inverse the order of queries
![](img/output-39.png)

<span style="color:red">13.3 - Important remark </span>
![](img/output-40.png)

#### Exercise 7
Write a query to produce this report

![](img/exercise-7.png)

```sql
USE sql_store;

SELECT customer_id,
       first_name,
       points,
      'Bronze' AS type
FROM customers
WHERE points < 2000

UNION

SELECT customer_id,
       first_name,
       points,
       'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000

UNION

SELECT customer_id,
       first_name,
       points,
       'Gold' AS type
FROM customers
WHERE points > 3000

ORDER BY first_name;

```

![](img/ex-solution-7.png)

