-- 7. Who are the top 5 customers based on total amount spent?
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSpent
FROM customer
INNER JOIN invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY customer.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;

-- 8. List customers who have spent more than $50
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSpent
FROM customer
INNER JOIN invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY customer.CustomerId
HAVING TotalSpent > 50.00;

-- 9. Show total sales by country
SELECT BillingCountry, SUM(Total) AS TotalSales
FROM invoice
GROUP BY BillingCountry
ORDER BY TotalSales;
