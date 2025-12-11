SELECT COUNT(*) AS total_rows FROM Brands;
SELECT COUNT(*) AS total_rows FROM Products;
SELECT COUNT(*) AS total_rows FROM Orders;


-- =======================
-- A) Sales Analysis
-- =======================

--Top 10 best-selling products
SELECT TOP 10 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.total_price) AS total_sales
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

-- Top 5 customers by spending
SELECT TOP 5
    c.full_name,
    SUM(oi.total_price) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY c.full_name
ORDER BY total_spent DESC;

-- Revenue per store
SELECT
    s.store_name,
    SUM(oi.total_price) AS total_revenue
FROM Orders o
JOIN Stores s ON o.store_id = s.store_id
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY s.store_name
ORDER BY total_revenue DESC;

--Revenue per category
SELECT
    c.category_name,
    SUM(oi.total_price) AS total_revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

--  Monthly sales trend
-- Monthly sales trend
SELECT
    FORMAT(CONVERT(DATE, o.order_date), 'yyyy-MM') AS month,
    SUM(oi.total_price) AS total_sales
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY FORMAT(CONVERT(DATE, o.order_date), 'yyyy-MM')
ORDER BY month;






-- =======================
-- B) Inventory Analysis
-- =======================

--  Products with low stock
SELECT
    p.product_name,
    SUM(s.quantity) AS total_stock
FROM Stocks s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.quantity) < 50
ORDER BY total_stock ASC;

--  Stores with the highest inventory levels
SELECT
    st.store_name,
    SUM(s.quantity) AS total_inventory
FROM Stocks s
JOIN Stores st ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY total_inventory DESC;




-- =======================
-- C) Staff Performance
-- =======================

--  Number of orders handled by each staff member
SELECT
    st.first_name + ' ' + st.last_name AS staff_name,
    COUNT(o.order_id) AS total_orders
FROM Orders o
JOIN Staffs st ON o.staff_id = st.staff_id
GROUP BY st.first_name, st.last_name
ORDER BY total_orders DESC;

--  Best-performing staff member by total sales
SELECT TOP 1
    st.first_name + ' ' + st.last_name AS staff_name,
    SUM(oi.total_price) AS total_sales
FROM Orders o
JOIN Staffs st ON o.staff_id = st.staff_id
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY st.first_name, st.last_name
ORDER BY total_sales DESC;

-- =======================
-- D) Customer Insights
-- =======================

--  Customers with no orders
SELECT
    c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Average spending per customer
SELECT
    sub.full_name,
    AVG(sub.customer_total) AS avg_spending
FROM (
    SELECT
        c.customer_id,
        c.full_name,
        SUM(oi.total_price) AS customer_total
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderItems oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.full_name
) AS sub
GROUP BY sub.full_name
ORDER BY avg_spending DESC;
