USE [Assignment2DW];;

DROP TABLE IF EXISTS CustomerDIM;

DROP TABLE IF EXISTS StaffDIM;

DROP TABLE IF EXISTS OrderDIM;

DROP TABLE IF EXISTS StoreDIM;

DROP TABLE IF EXISTS TimeDIM;

DROP TABLE IF EXISTS ProductDIM;

DROP TABLE IF EXISTS CategoryDIM;

DROP TABLE IF EXISTS BrandDIM;

DROP TABLE IF EXISTS SalesFacts;

CREATE TABLE CustomerDIM (
	CustomerKey VARCHAR(8) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	FirstName VARCHAR(10) NOT NULL,
	Phone VARCHAR(14) NULL,
	Email VARCHAR(50) NOT NULL,
	Street VARCHAR(24) NOT NULL,
	City VARCHAR(25) NOT NULL,
	State VARCHAR(2) NOT NULL,
	ZipCode VARCHAR(6) NOT NULL,
	PRIMARY KEY (CustomerKey)
);

CREATE TABLE StaffDIM(
	StaffKey VARCHAR(4) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	FirstName VARCHAR(10) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Phone VARCHAR (14) NOT NULL,
	Active bit NOT NULL,
	StoreId VARCHAR(3) NOT NULL,
	ManagerId VARCHAR(4) NULL,
	PRIMARY KEY(StaffKey)
);

CREATE TABLE OrderDIM(
	OrderKey VARCHAR(8) NOT NULL,
	OrderStatus int NOT NULL,
	OrderDate VARCHAR(10) NOT NULL,
	RequiredDate VARCHAR(10) NOT NULL,
	ShippedDate VARCHAR(10) NULL,
	PRIMARY KEY(OrderKey)
);

CREATE TABLE StoreDIM(
	StoreKey VARCHAR(3) NOT NULL,
	StoreName VARCHAR(50) NOT NULL,
	Phone VARCHAR(14) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Street VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(2) NOT NULL,
	ZipCode VARCHAR(6) NOT NULL,
	PRIMARY KEY(StoreKey)
);

CREATE TABLE TimeDIM
	([TimeKey] INT primary key, 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[HolidayUSA] VARCHAR(50),--Name of Holiday in US
		[IsHolidayUK] BIT Null,
		[HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
);

CREATE TABLE ProductDIM (
	ProductKey VARCHAR(6) NOT NULL,
	ProductName VARCHAR(255) NOT NULL,
	BrandId VARCHAR(4) NOT NULL,
	CategoryId VARCHAR(4) NOT NULL,
	ModelYear VARCHAR(4) NOT NULL,
	PRIMARY KEY(ProductKey)
) CREATE TABLE CategoryDIM(
	CategoryKey VARCHAR(4) NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	PRIMARY KEY(CategoryKey)
) CREATE TABLE BrandDIM(
	BrandKey VARCHAR(4) NOT NULL,
	BrandName VARCHAR(24) NOT NULL,
	PRIMARY KEY(BrandKey)
)
ALTER TABLE
	ProductDIM
ADD
	FOREIGN KEY (BrandId) REFERENCES BrandDIM(BrandKey);

ALTER TABLE
	ProductDIM
ADD
	FOREIGN KEY (CategoryId) REFERENCES CategoryDIM(CategoryKey);

CREATE TABLE SalesFacts(
	TimeKey int NOT NULL,
	OrderKey VARCHAR(8) NOT NULL,
	CustomerKey VARCHAR(8) NOT NULL,
	StaffKey VARCHAR(4) NOT NULL,
	ProductKey VARCHAR(6) NOT NULL,
	StoreKey VARCHAR(3) NOT NULL,
	ListPrice money NULL,
	Quantity int NULL,
	Discount real NULL,
	CONSTRAINT SalesKey PRIMARY KEY (
		TimeKey,
		OrderKey,
		CustomerKey,
		StaffKey,
		ProductKey,
		StoreKey
	)
);

ALTER TABLE
	SalesFacts
ADD
	FOREIGN KEY (CustomerKey) REFERENCES CustomerDIM(CustomerKey);

ALTER TABLE
	SalesFacts
ADD
	FOREIGN KEY (StaffKey) REFERENCES StaffDIM(StaffKey);

ALTER TABLE
	SalesFacts
ADD
	FOREIGN KEY (ProductKey) REFERENCES ProductDIM(ProductKey);

ALTER TABLE
	SalesFacts
ADD
	FOREIGN KEY (StoreKey) REFERENCES StoreDIM(StoreKey);

ALTER TABLE
	SalesFacts
ADD
	FOREIGN KEY (TimeKey) REFERENCES TimeDIM(TimeKey);

ALTER TABLE
	SalesFacts
ADD
	FOREIGN KEY (OrderKey) REFERENCES OrderDIM(OrderKey);