USE sql_invoicing;

SELECT date,
       c.name AS client,
       amount,
       pm.name AS name
FROM payments p
         JOIN clients c
              USING (client_id)
         JOIN payment_methods pm
              ON p.payment_method = pm.payment_method_id;