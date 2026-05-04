

CREATE DATABASE SmartPhoneStore;
USE SmartPhoneStore;

-- BẢNG 1 : PRODUCT
CREATE TABLE Product (
    IdProduct VARCHAR(100),
    ProductName VARCHAR(255),
    TypeProduct VARCHAR(255),
    Price DECIMAL(10,2),
    Quanlity INT
);

-- BẢNG 2 : CUSTOMER
CREATE TABLE Customer (
    IdCustomer VARCHAR(100),
    FullName VARCHAR(255),
    PhoneNumber INT,
    Rating VARCHAR(255)
);

-- BẢNG 3 : ORDERS
CREATE TABLE Orders (
    Id_Product VARCHAR(225),
    Put_Products VARCHAR(255),
    TotalAmount DECIMAL(15,2),
    OrderDate DATE
);

-- BẢNG 4 : ORDER_DETAIL
CREATE TABLE Order_Detail (
    Price_now DECIMAL(10,2),
    Id_item VARCHAR(225),
    Id_Product VARCHAR(255),
    Buy_Quality INT
);

-- THÊM CỘT BẢO HÀNH VÀO PRODUCT
ALTER TABLE Product
ADD warranty_period VARCHAR(100);


ALTER TABLE Customer
CHANGE Rating MemberLevel VARCHAR(255);



-- THÊM DỮ LIỆU PRODUCT
INSERT INTO Product (IdProduct, ProductName, TypeProduct, Price, Quanlity, warranty_period) VALUES
('1','Laptop Gaming Nitro 5','Electronic',25000000,3,'24 months'),
('2','SamSung Tivi 24 inch','Electronic',20000000,25,'36 months'),
('3','Điện thoại Honor X7D','Electronic',8500000,40,'12 months'),
('4','Kính cường lực Iphone X','Accessories',200000,50,'6 months'),
('5','Đồng Hồ Thông Minh','Accessories',14500000,30,'12 months');


INSERT INTO Customer (IdCustomer, FullName, PhoneNumber, MemberLevel) VALUES
('C01','Nguyen Van A',912345678,'Gold'),
('C02','Tran Thi B',934567890,'Silver'),
('C03','Le Van C',956789012,'Bronze'),
('C04','Pham Thi D',978901234,'Gold'),
('C05','Hoang Van E',989012345,'Silver');

-- THÊM DỮ LIỆU ORDERS
INSERT INTO Orders (Id_Product, Put_Products, TotalAmount, OrderDate) VALUES
('1','Order 1',50000000,'2026-05-10'),
('2','Order 2',0,'2026-05-15'),
('3','Order 3',17000000,'2026-04-20'),
('4','Order 4',400000,'2026-05-22'),
('5','Order 5',0,'2026-03-18');


INSERT INTO Order_Detail (Price_now, Id_item, Id_Product, Buy_Quality) VALUES
(25000000,'101','1',2),
(20000000,'102','2',1),
(8500000,'103','3',2),
(200000,'101','4',2),
(14500000,'104','5',1);

-- GIẢM GIÁ 10% CÁC SẢN PHẨM LOẠI 'Accessories'
UPDATE Product
SET Price = Price * 0.9
WHERE TypeProduct = 'Accessories';

-- XÓA CÁC ĐƠN HÀNG CÓ TỔNG TIỀN = 0
DELETE FROM Orders
WHERE TotalAmount = 0;

-- PHẦN 4 : TRUY VẤN DỮ LIỆU

-- 1. SẢN PHẨM CÓ GIÁ > 15 TRIỆU
SELECT *
FROM Product
WHERE Price > 15000000;

-- 2. KHÁCH HÀNG CÓ CẤP ĐỘ GOLD HOẶC SILVER
SELECT *
FROM Customer
WHERE MemberLevel IN ('Gold','Silver');

-- 3. ĐƠN HÀNG TRONG THÁNG 05 NĂM 2026
SELECT *
FROM Orders
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 2026;

-- 4. SẢN PHẨM TÊN BẮT ĐẦU 'SamSung' VÀ TỒN KHO > 20
SELECT *
FROM Product
WHERE ProductName LIKE 'SamSung%' AND Quanlity > 20;

-- 5. MÃ ĐƠN HÀNG VÀ TỔNG TIỀN CHI TIẾT VỚI SẢN PHẨM MÃ 101
SELECT 
    Id_item AS OrderID,
    SUM(Price_now * Buy_Quality) AS TotalOrderDetail
FROM Order_Detail
WHERE Id_Product = '101'
GROUP BY Id_item;

-- XÓA BẢNG ORDER_DETAIL VÀ ORDERS
DROP TABLE Order_Detail;
DROP TABLE Orders;