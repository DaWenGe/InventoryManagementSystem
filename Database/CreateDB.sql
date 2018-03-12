CREATE DATABASE IF NOT EXISTS InventorySystemDB;

USE InventorySystemDB;

CREATE TABLE IF NOT EXISTS UserTypes (
	UserTypeID int NOT NULL,
    UserTypeName varchar(100) NOT NULL,
    PRIMARY KEY (UserTypeID)
);

CREATE TABLE IF NOT EXISTS Users (
    UserID int NOT NULL,
    UserName varchar(100) NOT NULL,
    Password varchar(50) NOT NULL,
    FirstName varchar(100) NULL,
    Email varchar(100) NULL,
    UserTypeID int NOT NULL,
    PRIMARY KEY (UserID),
    FOREIGN KEY (UserTypeID) REFERENCES UserTypes (UserTypeID)
);

CREATE TABLE IF NOT EXISTS Products (
	ProductID int NOT NULL,
    ProductName varchar(100) NOT NULL,
    Description text NULL,
    ProductImage varchar(255) NULL,
    ProductCode varchar(50) NOT NULL,
    PRIMARY KEY (ProductID)
);

CREATE TABLE IF NOT EXISTS Colors (
	ColorID int NOT NULL,
    ColorName varchar(100) NOT NULL,
    PRIMARY KEY (ColorID)
);

CREATE TABLE IF NOT EXISTS ProductColors (
	ProductColorID int NOT NULL,
    ProductID int NOT NULL,
    ColorID int NOT NULL,
    PRIMARY KEY (ProductColorID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
    FOREIGN KEY (ColorID) REFERENCES Colors (ColorID)
);

CREATE TABLE IF NOT EXISTS DeliveryStatus (
	DeliveryStatusID int NOT NULL,
    Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (DeliveryStatusID)
);

CREATE TABLE IF NOT EXISTS PaymentType (
	PaymentTypeID int NOT NULL,
    PaymentMethod VARCHAR(100) NOT NULL,
    PRIMARY KEY (PaymentTypeID)
);

CREATE TABLE IF NOT EXISTS Inventory (
	InventoryID int NOT NULL,
    ProductColorID int NOT NULL,
    Quantity int NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (InventoryID),
    FOREIGN KEY (ProductColorID) REFERENCES ProductColors (ProductColorID)
);