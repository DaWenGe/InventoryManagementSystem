CREATE DATABASE IF NOT EXISTS InventorySystemDB;

USE InventorySystemDB;

CREATE TABLE IF NOT EXISTS UserTypes (
	UserTypeID int NOT NULL AUTO_INCREMENT,
    UserTypeName varchar(100) NOT NULL,
    PRIMARY KEY (UserTypeID)
);

CREATE TABLE IF NOT EXISTS Users (
    UserID int NOT NULL AUTO_INCREMENT,
    UserName varchar(100) NOT NULL,
    Password varchar(50) NOT NULL,
    FirstName varchar(100) NULL,
    Email varchar(100) NULL,
    UserTypeID int NOT NULL,
    PRIMARY KEY (UserID),
    FOREIGN KEY (UserTypeID) REFERENCES UserTypes (UserTypeID)
);

CREATE TABLE IF NOT EXISTS Products (
	ProductID int NOT NULL AUTO_INCREMENT,
    ProductName varchar(100) NOT NULL,
    Description text NULL,
    ProductImage varchar(255) NULL,
    ProductCode varchar(50) NOT NULL,
    PRIMARY KEY (ProductID)
);

CREATE TABLE IF NOT EXISTS Colors (
	ColorID int NOT NULL AUTO_INCREMENT,
    ColorName varchar(100) NOT NULL,
    PRIMARY KEY (ColorID)
);

CREATE TABLE IF NOT EXISTS ProductColors (
	ProductColorID int NOT NULL AUTO_INCREMENT,
    ProductID int NOT NULL,
    ColorID int NOT NULL,
    PRIMARY KEY (ProductColorID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
    FOREIGN KEY (ColorID) REFERENCES Colors (ColorID)
);

CREATE TABLE IF NOT EXISTS DeliveryStatus (
	DeliveryStatusID int NOT NULL AUTO_INCREMENT,
    Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (DeliveryStatusID)
);

CREATE TABLE IF NOT EXISTS PaymentType (
	PaymentTypeID int NOT NULL AUTO_INCREMENT,
    PaymentMethod VARCHAR(100) NOT NULL,
    PRIMARY KEY (PaymentTypeID)
);

CREATE TABLE IF NOT EXISTS Inventory (
	InventoryID int NOT NULL AUTO_INCREMENT,
    ProductColorID int NOT NULL,
    Quantity int NOT NULL,
    Price decimal(10,2) NOT NULL,
    PRIMARY KEY (InventoryID),
    FOREIGN KEY (ProductColorID) REFERENCES ProductColors (ProductColorID)
);
  
CREATE TABLE IF NOT EXISTS Stores (
	StoreID int NOT NULL AUTO_INCREMENT,
    StoreName varchar(100) NOT NULL,
    Address varchar(255) NOT NULL,
    City varchar(50) NOT NULL,
    PhoneNumber varchar(50) NOT NULL,
    PRIMARY KEY (StoreID)
);

CREATE TABLE IF NOT EXISTS UserStores (
	UserID int NOT NULL,
    StoreID int NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (StoreID) REFERENCES Stores (StoreID)
);


CREATE TABLE IF NOT EXISTS Orders (
	OrderID int NOT NULL,
    ProductColorID int NOT NULL,
    OrderQuantity int NOT NULL,
    OrderDateTime datetime NOT NULL,
    GST decimal(10,2) NOT NULL,
    StoreID int NOT NULL,
    DeliveryStatusID int NOT NULL,
    PaymentStatus varchar(50) NOT NULL,
    PaymentTypeID int NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (ProductColorID) REFERENCES ProductColors (ProductColorID),
    FOREIGN KEY (StoreID) REFERENCES Stores (StoreID),
    FOREIGN KEY (DeliveryStatusID) REFERENCES DeliveryStatus (DeliveryStatusID),
    FOREIGN KEY (PaymentTypeID) REFERENCES PaymentType (PaymentTypeID)
);

INSERT INTO UserTypes (UserTypeName) VALUES ('admin'), ('customer');

