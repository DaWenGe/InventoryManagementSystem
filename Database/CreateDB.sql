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
    Password varchar(255) NOT NULL,
    FirstName varchar(100) NULL,
    Email varchar(100) NULL,
    UserTypeID int NOT NULL,
    PRIMARY KEY (UserID),
    FOREIGN KEY (UserTypeID) REFERENCES UserTypes (UserTypeID)
);