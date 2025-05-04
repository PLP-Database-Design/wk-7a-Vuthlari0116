 Create a new table to store the normalized data
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Insert data into the new table, splitting the Products column
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
SELECT 
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM 
    ProductDetail,
    STRING_SPLIT(Products, ',') AS products;

-- Alternatively, if your database management system doesn't support STRING_SPLIT,
-- you might need to use a different approach, such as a recursive query or a custom function.

-- Drop the original table (optional)
-- DROP TABLE ProductDetail;

-- Rename the new table to the original table name (optional)


