/*****************************************************************************************************************************/
/* DATA BASE CREATION
 * Created By Devin O'Brien
 * Version 4
 */

 /***************************************************************************************/
/* COFFEEHOUSE DATABASE CREATION */
/***************************************************************************************/

/* TABLES */
CREATE DATABASE DB_Inventory

GO

USE DB_Inventory

GO

CREATE TABLE inventory_item
(
    inventoryID INT NOT NULL IDENTITY PRIMARY KEY,
    SQU INT NOT NULL,
    purchase_price NUMERIC(6,2) NOT NULL,
    logged_by VARCHAR(50) NOT NULL,
    logged_date DATETIME2 NOT NULL
)

CREATE TABLE time_stamp
(
    time_stampID INT NOT NULL IDENTITY PRIMARY KEY,
    inventoryID INT NULL FOREIGN KEY REFERENCES inventory_item(inventoryID),
    best_by_date DATE NOT NULL,
    use_after_open VARCHAR(20) NOT NULL
)

CREATE TABLE invoice
(
    invoiceID INT NOT NULL IDENTITY PRIMARY KEY,
    SQU INT NOT NULL,
    logged_date DATE NOT NULL, 
    logged_by varchar(50) NOT NULL,
    sold BIT NOT NULL,
    reason VARCHAR(100) NULL
)

CREATE TABLE dry_ingredient
(
    dry_ingredientID INT NOT NULL IDENTITY PRIMARY KEY,
    SQU INT NOT NULL, 
    inventoryID INT NOT NULL FOREIGN KEY REFERENCES inventory_item(inventoryID)
)

CREATE TABLE wet_ingredient
(
    wet_ingredientID INT NOT NULL IDENTITY PRIMARY KEY,
    SQU INT NOT NULL,
    inventoryID INT NOT NULL FOREIGN KEY REFERENCES inventory_item(inventoryID)
)

CREATE TABLE box_of_cups
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    num_of_cups INT NOT NULL,
    temperature VARCHAR(10) NOT NULL,
    size VARCHAR(10) NOT NULL,
    inventoryID INT NOT NULL FOREIGN KEY REFERENCES inventory_item(inventoryID)
)

CREATE TABLE box_of_lids
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    num_of_lids INT NOT NULL,
    temperature VARCHAR(10) NOT NULL,
    size VARCHAR(10) NOT NULL,
    inventoryID INT NOT NULL FOREIGN KEY REFERENCES inventory_item(inventoryID)
)

CREATE TABLE box_of_straws
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    num_of_straws INT NOT NULL,
    size VARCHAR(10) NOT NULL,
    inventoryID INT NOT NULL FOREIGN KEY REFERENCES inventory_item(inventoryID)
)

CREATE TABLE bean
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    source VARCHAR(100) NOT NULL,
    roast VARCHAR(10) NOT NULL,
    bag_size VARCHAR(10) NOT NULL,
    dry_ingredientID INT NOT NULL FOREIGN KEY REFERENCES dry_ingredient(dry_ingredientID)
)

CREATE TABLE tea
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    source VARCHAR(100) NOT NULL,
    bag_size VARCHAR(10) NOT NULL,
    dry_ingredientID INT NOT NULL FOREIGN KEY REFERENCES dry_ingredient(dry_ingredientID)
)

CREATE TABLE seasoning
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    size VARCHAR(20) NOT NULL,
    dry_ingredientID INT NOT NULL FOREIGN KEY REFERENCES dry_ingredient(dry_ingredientID)
)

CREATE TABLE juice
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    type VARCHAR(30) NOT NULL,
    size VARCHAR(20) NOT NULL,
    wet_ingredientID INT NOT NULL FOREIGN KEY REFERENCES wet_ingredient(wet_ingredientID)
)

CREATE TABLE milk
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    type VARCHAR(30) NOT NULL,
    size VARCHAR(20) NOT NULL,
    wet_ingredientID INT NOT NULL FOREIGN KEY REFERENCES wet_ingredient(wet_ingredientID)
)

CREATE TABLE syrup
(
    SQU INT NOT NULL IDENTITY PRIMARY KEY,
    type VARCHAR(30) NOT NULL,
    size VARCHAR(20) NOT NULL,
    wet_ingredientID INT NOT NULL FOREIGN KEY REFERENCES wet_ingredient(wet_ingredientID)
)

CREATE TABLE box_of_sugar
(
	SQU INT NOT NULL IDENTITY PRIMARY KEY,
    type VARCHAR(30) NOT NULL,
    count INT NOT NULL,
    dry_ingredientID INT NOT NULL FOREIGN KEY REFERENCES dry_ingredient(dry_ingredientID)
)

