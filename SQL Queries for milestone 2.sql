CREATE DATABASE OnlineFoodDeliverySystem;
USE OnlineFoodDeliverySystem;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(50),
    Location VARCHAR(50),
    ContactNumber VARCHAR(15)
);


DROP TABLE Customer;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(100) NOT NULL
);

DROP TABLE Restaurant;

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE DeliveryRider (
    RiderID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE MenuItem (
    MenuItemID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Category VARCHAR(50) NOT NULL,
    RestaurantID INT NOT NULL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
    DeliveryCharges DECIMAL(10,2) NOT NULL CHECK (DeliveryCharges >= 0),
    Status VARCHAR(20) NOT NULL,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Subtotal DECIMAL(10,2) NOT NULL CHECK (Subtotal > 0),
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    PaymentStatus VARCHAR(20) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    OrderID INT UNIQUE NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    DeliveryStatus VARCHAR(20) NOT NULL,
    DeliveryTime DATETIME NOT NULL,
    OrderID INT UNIQUE NOT NULL,
    RiderID INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (RiderID) REFERENCES DeliveryRider(RiderID)
);

INSERT INTO Customer (CustomerID, Name, Email, Phone, Address) VALUES
(1, 'Ali Khan', 'ali1@gmail.com', '03001234567', 'Lahore'),
(2, 'Sara Ahmed', 'sara2@gmail.com', '03011234567', 'Karachi'),
(3, 'Usman Tariq', 'usman3@gmail.com', '03021234567', 'Islamabad'),
(4, 'Ayesha Malik', 'ayesha4@gmail.com', '03031234567', 'Lahore'),
(5, 'Bilal Hussain', 'bilal5@gmail.com', '03041234567', 'Faisalabad'),
(6, 'Fatima Noor', 'fatima6@gmail.com', '03051234567', 'Karachi'),
(7, 'Hassan Raza', 'hassan7@gmail.com', '03061234567', 'Multan'),
(8, 'Zain Ali', 'zain8@gmail.com', '03071234567', 'Peshawar'),
(9, 'Maham Khan', 'maham9@gmail.com', '03081234567', 'Quetta'),
(10, 'Ahmed Raza', 'ahmed10@gmail.com', '03091234567', 'Lahore'),
(11, 'Noor Fatima', 'noor11@gmail.com', '03101234567', 'Karachi'),
(12, 'Saad Ahmed', 'saad12@gmail.com', '03111234567', 'Islamabad'),
(13, 'Hira Ali', 'hira13@gmail.com', '03121234567', 'Lahore');

SELECT * FROM Customer;

INSERT INTO Restaurant (RestaurantID, Name, Location, ContactNumber) VALUES
(1, 'KFC', 'Lahore', '0421111111'),
(2, 'McDonalds', 'Karachi', '0212222222'),
(3, 'Pizza Hut', 'Islamabad', '0513333333'),
(4, 'Hardees', 'Lahore', '0424444444'),
(5, 'Subway', 'Faisalabad', '0415555555'),
(6, 'Dominos', 'Karachi', '0216666666'),
(7, 'Burger Lab', 'Lahore', '0427777777'),
(8, 'OPT P', 'Multan', '0618888888'),
(9, 'Cheezious', 'Islamabad', '0519999999'),
(10, 'Howdy', 'Peshawar', '0911010101'),
(11, 'Bundu Khan', 'Lahore', '0422020202'),
(12, 'Student Biryani', 'Karachi', '0213030303'),
(13, 'Albaik', 'Quetta', '0814040404');

SELECT * FROM Restaurant;

INSERT INTO DeliveryRider (RiderID, Name, Phone) VALUES
(1, 'Asad Ali', '03001111111'),
(2, 'Usman Khan', '03002222222'),
(3, 'Hamza Tariq', '03003333333'),
(4, 'Bilal Ahmed', '03004444444'),
(5, 'Saif Ullah', '03005555555'),
(6, 'Zubair Hassan', '03006666666'),
(7, 'Farhan Ali', '03007777777'),
(8, 'Imran Raza', '03008888888'),
(9, 'Kashif Mehmood', '03009999999'),
(10, 'Adnan Malik', '03110000000'),
(11, 'Rizwan Khan', '03111111111'),
(12, 'Shahid Ali', '03112222222'),
(13, 'Noman Aslam', '03113333333');

SELECT * FROM DeliveryRider;

INSERT INTO MenuItem (MenuItemID, Name, Price, Category, RestaurantID) VALUES
(1,  'Bun Kabab',           120.00,  'Snacks',      1),
(2,  'Chicken Pizza',       850.00,  'Pizza',       2),
(3,  'Daal Makhni',         350.00,  'Main Course', 3),
(4,  'Double Beef Burger',  600.00,  'Burger',      4),
(5,  'Chicken Biryani',     450.00,  'Rice',        5),
(6,  'Tandoori Naan',        80.00,  'Bread',       6),
(7,  'Chicken Shawarma',    280.00,  'Snacks',      7),
(8,  'Grilled Fish',        950.00,  'Seafood',     8),
(9,  'Mutton Karahi',      1200.00,  'Main Course', 9),
(10, 'Beef Steak',         1500.00,  'Main Course', 10),
(11, 'Aloo Chaat',          150.00,  'Snacks',      11),
(12, 'Special Biryani',     550.00,  'Rice',        12),
(13, 'Seekh Kabab Plate',   700.00,  'BBQ',         13);

SELECT * FROM MenuItem;

INSERT INTO Orders (OrderID, OrderDate, TotalAmount, DeliveryCharges, Status, CustomerID, RestaurantID) VALUES
(1,  '2025-05-01',  360.00,  50.00, 'Confirmed',  1,  1),
(2,  '2025-05-02',  850.00,  80.00, 'Confirmed',  2,  2),
(3,  '2025-05-03',  700.00,  60.00, 'Confirmed',  3,  3),
(4,  '2025-05-04', 1200.00,  70.00, 'Confirmed',  4,  4),
(5,  '2025-05-05',  900.00,  50.00, 'Confirmed',  5,  5),
(6,  '2025-05-06',  240.00,  40.00, 'Confirmed',  6,  6),
(7,  '2025-05-07',  560.00,  60.00, 'Confirmed',  7,  7),
(8,  '2025-05-08',  950.00,  90.00, 'Confirmed',  8,  8),
(9,  '2025-05-09', 1200.00, 100.00, 'Confirmed',  9,  9),
(10, '2025-05-10', 1500.00, 120.00, 'Pending',    10, 10),
(11, '2025-05-11',  300.00,  40.00, 'Cancelled',  11, 11),
(12, '2025-05-12', 1100.00,  80.00, 'Confirmed',  12, 12),
(13, '2025-05-13', 1400.00,  90.00, 'Pending',    13, 13);

SELECT * FROM Orders;

INSERT INTO OrderDetails (OrderDetailsID, Quantity, Subtotal, OrderID, MenuItemID) VALUES
(1,  3,   360.00,  1,  1),
(2,  1,   850.00,  2,  2),
(3,  2,   700.00,  3,  3),
(4,  2,  1200.00,  4,  4),
(5,  2,   900.00,  5,  5),
(6,  3,   240.00,  6,  6),
(7,  2,   560.00,  7,  7),
(8,  1,   950.00,  8,  8),
(9,  1,  1200.00,  9,  9),
(10, 1,  1500.00, 10, 10),
(11, 2,   300.00, 11, 11),
(12, 2,  1100.00, 12, 12),
(13, 2,  1400.00, 13, 13);

SELECT * FROM OrderDetails;

INSERT INTO Payment (PaymentID, PaymentStatus, Amount, OrderID) VALUES
(1,   'Paid',      410.00,  1),
(2,   'Paid',      930.00,  2),
(3,   'Paid',      760.00,  3),
(4,   'Paid',     1270.00,  4),
(5,   'Paid',      950.00,  5),
(6,   'Paid',      280.00,  6),
(7,   'Paid',      620.00,  7),
(8,   'Paid',     1040.00,  8),
(9,   'Paid',     1300.00,  9),
(10,  'Pending',  1620.00, 10),
(11,  'Refunded',  340.00, 11),
(12,  'Paid',     1180.00, 12),
(13,  'Pending',  1490.00, 13);

SELECT * FROM Payment;

INSERT INTO Delivery (DeliveryID, DeliveryStatus, DeliveryTime, OrderID, RiderID) VALUES
(1,  'Delivered',  '2025-05-01 13:45:00', 1,  1),
(2,  'Delivered',  '2025-05-02 20:10:00', 2,  2),
(3,  'Delivered',  '2025-05-03 14:30:00', 3,  3),
(4,  'Delivered',  '2025-05-04 21:00:00', 4,  4),
(5,  'Delivered',  '2025-05-05 19:20:00', 5,  5),
(6,  'Delivered',  '2025-05-06 12:55:00', 6,  6),
(7,  'In Transit', '2025-05-07 18:40:00', 7,  7),
(8,  'In Transit', '2025-05-08 22:05:00', 8,  8),
(9,  'In Transit', '2025-05-09 20:30:00', 9,  9),
(10, 'Pending',    '2025-05-10 15:00:00', 10, 10),
(11, 'Cancelled',  '2025-05-11 11:15:00', 11, 11),
(12, 'Delivered',  '2025-05-12 19:50:00', 12, 12),
(13, 'Pending',    '2025-05-13 17:25:00', 13, 13);

SELECT * FROM Delivery;

SELECT *
FROM Orders
WHERE Status = 'Cancelled';


SELECT *
FROM MenuItem
WHERE Price < 500 
AND (Category = 'Snacks' OR Category = 'Main Course');


SELECT O.OrderID, O.OrderDate, 
       C.Name AS CustomerName, 
       R.Name AS RestaurantName
FROM Orders O
JOIN Customer C ON O.CustomerID = C.CustomerID
JOIN Restaurant R ON O.RestaurantID = R.RestaurantID;


SELECT R.*,
       MI.MenuItemID, MI.Name AS MenuItemName, 
       MI.Price, MI.Category,
       O.OrderID, O.OrderDate
FROM Restaurant R
LEFT JOIN MenuItem MI ON R.RestaurantID = MI.RestaurantID
LEFT JOIN Orders O ON R.RestaurantID = O.RestaurantID;


SELECT R.Name AS RestaurantName, 
       COUNT(O.OrderID) AS TotalOrders,
       SUM(O.TotalAmount) AS TotalRevenue
FROM Restaurant R
JOIN Orders O ON R.RestaurantID = O.RestaurantID
GROUP BY R.Name;


SELECT Category,
       AVG(Price) AS AveragePrice,
       MAX(Price) AS HighestPrice,
       MIN(Price) AS LowestPrice
FROM MenuItem
GROUP BY Category;


SELECT Category,
       COUNT(MenuItemID) AS TotalItems,
       AVG(Price) AS AveragePrice
FROM MenuItem
WHERE Price > 200
GROUP BY Category;


SELECT Category,
       AVG(Price) AS AveragePrice
FROM MenuItem
GROUP BY Category
HAVING AVG(Price) > 400;


SELECT *
FROM Customer
WHERE CustomerID = (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount = (SELECT MAX(TotalAmount) FROM Orders)
);


SELECT Name, Phone
FROM DeliveryRider
WHERE RiderID IN (
    SELECT RiderID
    FROM Delivery
    WHERE DeliveryStatus = 'In Transit'
);





