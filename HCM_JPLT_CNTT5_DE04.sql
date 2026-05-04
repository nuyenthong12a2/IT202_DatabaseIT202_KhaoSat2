-- Phần 2 : Định  nghĩa dữ liệu DDL 
-- Viết các câu lệnh SQL để thực hiện 

CREATE DATABASE SmartPhoneStore;
USE SmartPhoneStore;
-- Tạo 4 bảng dữ liệu 

-- Bảng thứ 1 : Bảng sản phẩm gồm có mã sản phẩm , tên sản phẩm , loại sản phẩm ,đơn giá , số lượng tồn kho 
CREATE TABLE Product (
IdProduct VARCHAR(100),
ProductName VARCHAR(255),
TypeProduct VARCHAR(255),
Price DECIMAL(10,2) ,
Quanlity INT 
);
--  Bảng thứ 2 : Bảng khách hàng gồm có : Mã khách hàng ,Họ và tên ,eamil ,số điện thoại, Xếp hàng 
CREATE TABLE Customer  (
IdCustomer VARCHAR(100),
FullName VARCHAR(255),
PhoneNumber INT, 
Rating  Varchar(255)
);
-- Bảng thứ 3 :  Tạo bảng đơn hàng 
CREATE TABLE Orders (
Id_Product VARCHAR(225),
Put_Products VARCHAR(255),
TotalAmount Decimal(15,2)
);
-- Bảng thứ 4 :  Tạo bảng chi  tiết đơn hàng : Mã đơn hàng , Số lượng , giá bán thực tế . 
CREATE TABLE Order_Detail (
Price_now DECIMAL(10,2),
Id_item VARCHAR(225),
Id_Product VARCHAR (255),
 Buy_Quality INT (255)
);
-- ALTER TABLE Student  ADD Column Email VARCHAR(100);
-- 3. Thêm một cột thời gian bảo hành vào bảng Product 
ALTER TABLE Product ADD Column warranty_period VARCHAR(100);
-- 4. Đổi tên cột Cấp độ thành viên trong bảng Cusotmer thành tên khác cùng nghĩa 
-- 5.  Viết câu lệnh SQL xóa bảng Order_Detail và bảng Orders 
 DROP TABLE Order_Detail ;
DROP TABLE Orders;
-- Phần 3 : Thao tác dữ liệu với nhóm -DML 
-- Viết các câu lệnh SQL để thực hiện : 
-- 1 . Thêm ít nhất 5 bản ghi cho mỗi bảng sao dữ liệu khớp nối logic với nhau (Khóa ngoại không bị lỗi )
INSERT INTO Product (IdProduct,ProductName,TypeProduct,Price,Quanlity)
VALUES 
(1,'Laptop Gaming Nitro 5','Electronic',25000000,3),
(2,'Tivi SamSung 24 inch ','Electronic',20000000,2),
(3,'Điện thoại Honor X7D','Electronic',85000000,4),
(4,'Kính cường lực Iphone X',200000,5),
(5,'Đồng Hồ Thông Minh ','Electronic',145000000,3);

-- 2. Giảm giá đi 10% cho tất cả sản phẩm thuộc loại là 'Accessories'.
-- 3. Xóa tất cả các đơn hàng trong bảng Orders có tổng tiền bằng 0 .
-- Phần 4 : Truy vấn vấn dữ liệu cơ bản 
-- 1. Tìm danh sách tất cả các sản phẩm có đơn giá lớn hơn 15 triệu VND 
-- 2. Hiển thị thông tin các khách hàng có có cấp độ thành viên là 'Gold ' or 'Silver'
-- 3 . Liệt kê các đơn hàng được thực hiện trong tháng 05 năm 2026 
-- 4. Tìm tất cả các sản phẩm có tên bắt đầu chữ 'SamSung' và còn số lượng tồn kho trên 20 máy .
-- 5. Hiển thị mã đơn hàng và tính toán một cột mới là tổng order_detail cho các sản phẩm có mã là 101 






