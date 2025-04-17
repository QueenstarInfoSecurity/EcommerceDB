CREATE DATABASE ECommerceDB;

USE ECommerceDB;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

USE ECommerceDB;
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

USE ECommerceDB;
CREATE TABLE IF NOT EXISTS Shipping (
    ShippingID INT PRIMARY KEY,
    OrderID INT,
    ShippingDate DATE,
    DeliveryDate DATE,
    ShippingMethod VARCHAR(50),
    TrackingNumber VARCHAR(50),
    ShippingStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);




-- Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES 
(1, 'Emily', 'Johnson', 'emilyjohnson@cxstudio.com', '023-1234'),
(2, 'Michael', 'Boateng', 'michael.boateng@cxstudio.com', '023-5678'),
(3, 'Sarah', 'Otoo', 'sarah.ot@cxstudio.com', '023-9012'),
(4, 'David', 'Anderson', 'david.anderson@cxstudio.com', '023-3456'),
(5, 'Jessica', 'Bempson', 'jessica.bempson@cxstudio.com', '023-7890'),
(6, 'Daniel', 'Uto', 'daniel.uto@cxstudio.com', '025-2345'),
(7, 'Laura', 'Origa', 'laura.origa@cxstudio.com', '057-6789'),
(8, 'James', 'Moiprit', 'james.moiprit@cxstudio.com', '023-0123'),
(9, 'Olivia', 'Hassan', 'olivia.hassan@cxstudio.com', '023-4567'),
(10, 'Martin', 'Clarke', 'martin.clarke@cxstudio.com', '025-8901');

-- Products Table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
(101, 'Laptop', 'Electronics', 999.99, 10),
(102, 'Phone', 'Electronics', 499.99, 25),
(103, 'Tablet', 'Electronics', 299.99, 30),
(104, 'Headphones', 'Accessories', 79.99, 50),
(105, 'Keyboard', 'Accessories', 49.99, 40),
(106, 'Mouse', 'Accessories', 29.99, 60),
(107, 'Monitor', 'Electronics', 199.99, 20),
(108, 'Smartwatch', 'Wearable', 149.99, 35),
(109, 'External Hard Drive', 'Storage', 89.99, 15),
(110, 'USB Flash Drive', 'Storage', 19.99, 100);

-- Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2024-05-10', 1499.98),
(2, 2, '2024-06-15', 499.99),
(3, 3, '2024-07-20', 379.98),
(4, 4, '2024-08-05', 199.99),
(5, 5, '2024-09-10', 49.99),
(6, 6, '2024-10-12', 79.99),
(7, 7, '2024-11-01', 1299.98),
(8, 8, '2024-11-22', 169.98),
(9, 9, '2024-12-05', 299.99),
(10, 10, '2024-12-20', 999.99);


INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus)
VALUES 
(1, 1, '2023-05-11', 1499.98, 'Credit Card', 'Completed'),
(2, 2, '2023-05-12', 299.99, 'PayPal', 'Completed'),
(3, 3, '2023-05-13', 89.50, 'Debit Card', 'Pending'),
(4, 4, '2023-05-14', 450.00, 'Bank Transfer', 'Completed'),
(5, 5, '2023-05-15', 1200.75, 'Credit Card', 'Failed'),
(6, 6, '2023-05-16', 349.99, 'PayPal', 'Completed'),
(7, 7, '2023-05-17', 560.49, 'Debit Card', 'Pending'),
(8, 8, '2023-05-18', 99.99, 'Credit Card', 'Completed'),
(9, 9, '2023-05-19', 250.00, 'Bank Transfer', 'Refunded'),
(10, 10, '2023-05-20', 75.25, 'Debit Card', 'Completed');


INSERT INTO Shipping (ShippingID, OrderID, ShippingDate, DeliveryDate, ShippingMethod, TrackingNumber, ShippingStatus)
VALUES 
(1, 1, '2024-05-12', '2024-05-15', 'Express', 'TRACK12345', 'In Transit'),
(2, 2, '2024-05-13', '2024-05-16', 'Standard', 'TRACK12346', 'Shipped'),
(3, 3, '2024-05-14', '2024-05-17', 'Express', 'TRACK12347', 'Delivered'),
(4, 4, '2024-05-15', '2024-05-18', 'Overnight', 'TRACK12348', 'In Transit'),
(5, 5, '2024-05-16', '2024-05-19', 'Standard', 'TRACK12349', 'Shipped'),
(6, 6, '2024-05-17', '2024-05-20', 'Express', 'TRACK12350', 'Delivered'),
(7, 7, '2024-05-18', '2024-05-21', 'Overnight', 'TRACK12351', 'Pending'),
(8, 8, '2024-05-19', '2024-05-22', 'Standard', 'TRACK12352', 'Shipped'),
(9, 9, '2024-05-20', '2024-05-23', 'Express', 'TRACK12353', 'In Transit'),
(10, 10, '2024-05-21', '2024-05-24', 'Standard', 'TRACK12354', 'Delivered');