--- Quality Check of the Gold Table

-- Checks for dim products
SELECT *
FROM gold.dim_products

SELECT 
   product_key,
   COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

--Checks for dim_customers
--check for Uniqueness of customer key in gold.dim_customers
--Expectation: no result
SELECT *
FROM gold.dim_customers;

SELECT 
   customer_key,
   COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

--Checks for gold.fact_sales
SELECT * 
FROM gold.fact_sales

--Foreign key Integrity (Dimensions)
--CHECK the data model connectivity between fact and dimensions
SELECT  * FROM gold.fact_sales sd
LEFT JOIN gold.dim_products pr ON sd.product_key = pr.product_key
LEFT JOIN gold.dim_customers cs ON sd.customer_key = cs.customer_key
WHERE cs.customer_key IS NULL OR pr.product_key IS NULL
