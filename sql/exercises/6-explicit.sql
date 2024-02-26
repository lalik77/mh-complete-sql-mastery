USE sql_store;

SELECT sh.name AS shipper,
       p.name AS 'product name'
FROM shippers sh
         CROSS JOIN products p
ORDER BY sh.name;