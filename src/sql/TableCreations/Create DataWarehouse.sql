use assignment2DW;
/*
alter table SalesFacts
drop constraint CustomerKey;
alter table SalesFacts
drop constraint orderkey;
alter table SalesFacts
drop constraint staffkey;
alter table SalesFacts
drop constraint storeKey;
alter table SalesFacts
drop constraint productKey;
alter table SalesFacts
drop constraint timeKey;
alter table productDim
drop constraint brandKey;
alter table productDim
drop constraint categoryKey;
*/
drop table if exists CustomerDim;
drop table if exists StaffDim;
drop table if exists OrderDim;
drop table if exists StoreDim;
drop table if exists TimeDim;
drop table if exists ProductDim;
drop table if exists CategoryDim;
drop table if exists BrandDim;
drop table if exists SalesFacts;

CREATE TABLE CustomerDIM (
	CustomerKey varchar(8) NOT NULL,
	LastName varchar(20) NOT NULL,
	FirstName varchar(20) NOT NULL,
	Phone varchar(14) NULL,
	Email varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
	City varchar(25) NULL,
	State varchar(2) NOT NULL,
	ZipCode varchar(6) NOT NULL,
	PRIMARY KEY (CustomerKey));

CREATE TABLE StaffDIM(
	StaffKey int NOT NULL,
	LastName varchar(20) NOT NULL,
	FirstName varchar(20) NOT NULL,
	Email varchar(50) NOT NULL,
	Phone varchar (14) NOT NULL,
	Active bit NOT NULL,
	StoreId varchar(3) NOT NULL,
	ManagerId varchar(4) NULL,
	PRIMARY KEY(StaffKey) );

CREATE TABLE OrderDIM(
	OrderKey varchar(8) NOT NULL,
	OrderStatus int NOT NULL,
	OrderDate varchar(10) NOT NULL,
	RequiredDate varchar(10) NOT NULL,
	ShippedDate varchar(10) NULL,
	PRIMARY KEY(OrderKey));

CREATE TABLE StoreDIM(
	StoreKey varchar(3) NOT NULL,
	StoreName varchar(50) NOT NULL,
	Phone varchar(14) NOT NULL,
	Email varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	State varchar(2) NOT NULL,
	ZipCode varchar(6) NOT NULL,
	PRIMARY KEY(StoreKey));

CREATE TABLE TimeDim
	([TimeKey] INT PRIMARY KEY,
	[Date] DATETIME,
	[Month] VARCHAR(2),
	[Year] CHAR(4),
	[MonthName] VARCHAR(9),
	[YearName] CHAR(7),
	[IsHoliday] BIT,
	[IsWeekday] BIT,
	[DayOfMonth] VARCHAR(2),
	[Quarter] CHAR(1),
	[QuarterName] VARCHAR(9));

CREATE TABLE ProductDim (
	ProductKey varchar(6) NOT NULL,
	ProductName varchar(255) NOT NULL,
	BrandId varchar(4) NOT NULL,
	CategoryId varchar(4) NOT NULL,
	ModelYear varchar(4) NOT NULL,
	PRIMARY KEY(ProductKey))

CREATE TABLE SalesFacts(
	TimeKey int NOT NULL,
	OrderKey varchar(8) NOT NULL,
	CustomerKey varchar(8) NOT NULL,
	StaffKey int NOT NULL,
	ProductKey varchar(6) NOT NULL,
	StoreKey varchar(3) NOT NULL,
	ListPrice money NULL,
	Quantity int NULL,
	Discount real NULL,
	CONSTRAINT SalesKey PRIMARY KEY (TimeKey,OrderKey,CustomerKey,StaffKey,ProductKey,StoreKey));
	
CREATE TABLE CategoryDIM(
	CategoryKey varchar(4) NOT NULL,
	CategoryName varchar(50) NOT NULL,
	PRIMARY KEY(CategoryKey))

CREATE TABLE BrandDim(
	BrandKey varchar(4) NOT NULL,
	BrandName varchar(24) NOT NULL,
	PRIMARY KEY(BrandKey))



ALTER TABLE ProductDim ADD FOREIGN KEY (BrandId) REFERENCES BrandDIM(BrandKey);
ALTER TABLE ProductDim ADD FOREIGN KEY (CategoryId) REFERENCES CategoryDIM(CategoryKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (CustomerKey) REFERENCES CustomerDIM(CustomerKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (StaffKey) REFERENCES StaffDIM(StaffKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (ProductKey) REFERENCES ProductDIM(ProductKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (StoreKey) REFERENCES StoreDIM(StoreKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (TimeKey) REFERENCES TimeDIM(TimeKey);
ALTER TABLE SalesFacts  ADD FOREIGN KEY (OrderKey) REFERENCES OrderDIM(OrderKey);