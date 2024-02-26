
#  Retrieving data from a single table

### 1 - The `SELECT` STATEMENT

```sql
USE sql_store;

SELECT *
FROM customers
-- WHERE customer_id = 1 --
ORDER BY  first_name;
```

### 2 - The `SELECT` Clause

```sql
SELECT first_name, last_name, points, points + 10
FROM customers;

```
![](img/output-1.png)

Using an ALIAS

1 - 
```sql
SELECT first_name,
       last_name,
       points,
       (points + 10) * 100 AS discount_factor
FROM customers;

```
![](img/output-2.png)

2- 
```sql
SELECT first_name,
       last_name,
       points,
       (points + 10) * 100 AS 'discount factor'
FROM customers;

```
![](img/output-3.png)

Using DISTINCT<br>
We have two similar records
```sql
SELECT  state
FROM customers;
```
![](img/output-4.png)
<br>With DISTINCT we retrieve the unique records
```sql
SELECT DISTINCT state
FROM customers;
```
![](img/output-5.png)

#### Exercise

![](img/exercise-1.png)

Solution

![](img/ex-solution-1.png)

#### 3 - The `WHERE` Clause

Used to filter data.

```sql
SELECT *
FROM customers
WHERE points > 3000;

```
![](img/output-6.png)

```sql
SELECT *
FROM customers
WHERE state='VA';
```
![](img/output-7.png)

![](img/output-8.png)

#### Exercise

![](img/exercise-2.png)

![](img/ex-solution-2.png)

### 4 - The `AND` , `OR` and `NOT` Operators

Combine multiple search conditions when filtering data.

`AND`
```sql
SELECT *
FROM customers
WHERE birth_date > '1990-01-01' AND points > 1000;
```
![](img/output-9.png)

`OR`
```sql
SELECT *
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000;
```
![](../../../Yandex.Disk.localized/Скриншоты/output-10.png)

`Combine`

![](img/output-10.png)

`NOT`

![](img/output-11.png)

#### Exercise

![](img/exercise-3.png)

![](img/ex-solution-3.png)

### 5 - The `IN` Operator
There is a cleaner way and short way to get the same result.
![](img/output-12.png)

![](img/output-13.png)

We can use `NOT` to retrieve all records that not corresponding to that states

![](img/output-14.png)

#### Exercise

![](img/exercise-4.png)

![](img/ex-solution-4.png)

### 6 - The `Between` Operator

![](img/output-15.png)

Equivalent code , pay attention that it's inclusive.
```sql
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;
```
#### Exercise

![](img/exercise-5.png)

![](img/ex-solution-5.png)

### 7 - The `Like` Operator

Using patterns with this operator
- % any number of characters
![](img/output-16.png)
![](img/output-17.png)

_ single character

![](img/output-18.png)

#### Exercise
This exercice is about two parts
![](img/exercise-6.png)
first part

![](img/ex-solution-6-1.png)

second part

![](img/ex-solution-6-2.png)


### 8 - The "REGEXP" Operator

![](img/output-19.png)

`^` -> beginning of the string

![](img/output-20.png)

`$` -> end of the string

![](img/output-21.png)

'|' -> Or

![](img/output-22.png)

'[ ]'-> 
![](img/output-23.png)

![](img/output-24.png)

#### Exercise
4 exercices

![](img/exercise-7.png)
Solution 1
![](img/ex-solution-7-1.png)
Solution 2
![](img/ex-solution-7-2.png)
Solution 3
![](img/ex-solution-7-3.png)
Solution 4
![](img/ex-solution-7-4.png)

### 9 - The "Is NULL" Operator
Get records with missing values

![](img/output-25.png)

Inverse cases
![](img/output-26.png)

#### Exercise
![](img/exercise-8.png)
![](img/ex-solution-8.png)

### 1.9 The "ORDER BY" Clause

Sort data
![](img/output-27.png)

In DESCENDING ORDER
![](img/output-28.png)

Sort data by multiple columns (MySQL -not all db managment systems have this)

![](img/output-29.png)
select 2 columns and sort by column that will not be shown (MySQL)
![](img/output-30.png)
sort by alias and first_name
![](img/output-31.png)
![](img/output-32.png)

#### Exercise
In table order_items<br>
You have to write query , which will gives you this result.
Id = 2 , out 4 columns , and sort in Descending order by the total price<br>
(Total price = quantity * unit_price)
![](img/exercise-9.png)

![](img/ex-solution-9.png)

### 10 - The "LIMIT" Clause

![](img/output-32.png)

![](img/output-33.png)

#### Exercise
![](img/exercise-10.png)

Algorithm -> order in Desc  , and limit 3

![](img/ex-solution-10.png)
