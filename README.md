# EcommerceDB 
This project is a relational database design for e-commerce platform, developed using MySQL. It captures the core functionalities of an online retail system by managing customers, products, orders, payments, and shipping information.

## Technologies Used
- MySQL 8.x+
- SQL (DDL and DML)

## Database: `ECommerceDB`
The `ECommerceDB` database is designed to demonstrate normalization, referential integrity, and real-world data modeling for online commerce applications.

### Schema Design
**1. Customers**
Captures user profiles.
| Column     | Type         | Description           |
|------------|--------------|-----------------------|
| CustomerID | INT, PK      | Unique customer ID    |
| FirstName  | VARCHAR(50)  | Customer first name   |
| LastName   | VARCHAR(50)  | Customer last name    |
| Email      | VARCHAR(100) | Contact email         |
| Phone      | VARCHAR(15)  | Contact phone number  |

**2. Products**
Stores product listings and inventory details.
| Column     | Type           | Description         |
|------------|----------------|---------------------|
| ProductID  | INT, PK        | Unique product ID   |
| ProductName| VARCHAR(100)   | Name of product     |
| Category   | VARCHAR(50)    | Product category    |
| Price      | DECIMAL(10,2)  | Unit price          |
| Stock      | INT            | Quantity in stock   |

**3. Orders**
Represents customer purchases.
| Column     | Type           | Description            |
|------------|----------------|------------------------|
| OrderID    | INT, PK        | Unique order ID        |
| CustomerID | INT, FK        | Linked to Customers    |
| OrderDate  | DATE           | Date of order placement|
| TotalAmount| DECIMAL(10,2)  | Order total            |

**4. OrderDetails**
| Column        | Type   | Description                   |
|---------------|--------|-------------------------------|
| OrderDetailID | INT, PK| Unique line item ID           |
| OrderID       | INT, FK| Linked to Orders              |
| ProductID     | INT, FK| Linked to Products            |
| Quantity      | INT    | Number of units purchased     |

**5. Payments**
Handles transactions tracking 
| Column         | Type           | Description               |
|----------------|----------------|---------------------------|
| PaymentID      | INT, PK        | Unique payment ID         |
| OrderID        | INT, FK        | Linked to Orders          |
| PaymentDate    | DATE           | Date of payment           |
| Amount         | DECIMAL(10,2)  | Amount paid               |
| PaymentMethod  | VARCHAR(50)    | e.g., Credit Card, PayPal |
| PaymentStatus  | VARCHAR(20)    | Completed, Failed, etc.   |

**6. Shipping**
Tracks order delivery.
| Column         | Type         | Description                |
|----------------|--------------|----------------------------|
| ShippingID     | INT, PK      | Unique shipping ID         |
| OrderID        | INT, FK      | Linked to Orders           |
| ShippingDate   | DATE         | Dispatch date              |
| DeliveryDate   | DATE         | Expected delivery          |
| ShippingMethod | VARCHAR(50)  | Standard, Express, etc.    |
| TrackingNumber | VARCHAR(50)  | Courier tracking ID        |
| ShippingStatus | VARCHAR(20)  | Delivered, In Transit, etc.|


## Table Relationships
- **One-to-Many**: Customers -> Orders
- **One-to-Many**: Orders  -> OrderDetails
- **One-to-One**: Orders -> Payments
- **One-to-One**: Orders -> Shipping
- **Many-to-One**: OrdersDetails -> Products

## Sample Data

Each table includes realistic data entries:
- 10 customers with contact info
- 10 unique products
- 10 customer orders
- Corresponding payments and shipping entries

## How to Use
1. Clone or download the SQL script.
2. Open MySQL Workbench or your preferred SQL client.
3. Run the script to create and populate the `ECommerceDB` database.
4. Query the database to analyse relationships or build visual dashboards.

## Learning Highlights
- SQL DDL &DML in practice
- Data normalization
- Foreign key constraints
- Real -world relational modeling
- Clean database architecture

## Potential Extentions
 - Add user login/authentication table
 - Integrate product reviews/ ratings
 - Track inventory and restocks
 - Include returns, refunds, and coupons
 - Add audit logs and timestamps

   
## License
  Licensed under the MIT lincense.

