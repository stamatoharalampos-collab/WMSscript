CREATE TABLE Products (
    product_id INT PRIMARY KEY ,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(10),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0);
    
    INSERT INTO products VALUES 
    (13,'Laptop Asus 12','Laptop',1500.60,8);
    
     SELECT * FROM products;
     
    CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE);
    
    INSERT INTO Customers Values
    (19351, 'Stamatios','Charalampous','stamato@gmail.com');
    
     SELECT * FROM customers;
     
     CREATE TABLE Orders (
	customer_id INT,
    order_id INT PRIMARY KEY,
    product_id INT,
    total_amount int DEFAULT 0.00,
    stock int ) ;
    
    INSERT INTO ORDERS VALUES
    (19351,1312, 13, 1000, 992) ;
    
    select * from orders;
    
SELECT 
    c.first_name, 
    c.last_name, 
    p.product_name, 
    p.category 
    FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN products as p ON o.product_id=p.product_id ;

CREATE VIEW Manager_Dashboard AS
SELECT 
    o.order_id AS 'Order_No',
    CONCAT(c.first_name," ", c.last_name) AS 'Customer',
    p.product_name AS 'Product',
    p.price AS 'Net_Price',
    ROUND(p.price * 1.24, 2) AS 'Price_with_VAT',
    p.stock_quantity AS 'Remaining_Stock',
    CASE 
        WHEN p.stock_quantity < 5 THEN 'REORDER NOW'
        ELSE 'OK'
    END AS 'Inventory_Status'
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT * FROM manager_dashboard;

SELECT 
    product_name, 
    stock_quantity,
    IF(stock_quantity <= 5, 'REORDER NOW', 'OK') AS 'Status'
FROM Products;

 