/*******************************************************************************/
/* DATA BASE ADVANCED QUERIES
 * Created By Devin O'Brien
 * Version 1
 */

/*******************************************************************************/
-- Part 1 – create two grouped queries
-- Determine two queries that make sense in groups. 
-- For example – grouping students by major to get average GPA.
-- Create a view for each query. Confirm the results are correct.
/*******************************************************************************/
/*Grouped Query 1: Gets all beans in inventory that haven't been sold*/
CREATE VIEW vw_BeanCount(Product,Quantity) AS 
(
	SELECT name AS Product,COUNT(*) AS Quantity
	FROM 
	(
   		SELECT b.SQU,name,source 
    	FROM bean b LEFT OUTER JOIN dry_ingredient d 
    	ON b.dry_ingredientID = d.dry_ingredientID
	) s 
	LEFT OUTER JOIN invoice i 
	ON s.SQU = i.SQU 
	WHERE i.invoiceID IS NULL
	GROUP BY name
);

/* DISPLAY VIEW */
SELECT * FROM DB_Inventory.dbo.vw_BeanCount;
/*******************************************************************************/


/*******************************************************************************/
/*Grouped Query 2: Get the amount of sales per day on a given */
CREATE VIEW vw_DailySales AS
(
	SELECT logged_date AS PRODUCT, COUNT(*) AS Sales 
	FROM invoice i 
	WHERE i.logged_date > '2020-05-06' AND i.logged_date < '2020-05-22' AND i.sold = 1
	GROUP BY logged_date
);

/* DISPLAY VIEW */
SELECT * FROM DB_Inventory.dbo.vw_DailySales;
/*******************************************************************************/


/*******************************************************************************/
-- Part 2 – create a temp table
-- Use INSERT INTO to populate a temporary table from one of your views. 
-- Write a query that performs further processing on the temp table.
/*******************************************************************************/
/*Utilizing Temp Table: Fetching list of bean and tea inventory on hand to run
						useful queries */
CREATE TABLE #temp
(
    type VARCHAR(30),
	name VARCHAR(30),
	price SMALLMONEY,
	SQU INT,
	date_in DATE,
    date_expired DATE,
	sold BIT,
	date_out DATE,
    reason VARCHAR(100)
)

INSERT INTO #temp(type,name,price,SQU,date_in,date_expired,sold,date_out,reason) 
    SELECT 'Bean',b.name,x.purchase_price,b.SQU,x.logged_date AS date_in,x.best_by_date AS date_expired,y.sold,y.logged_date AS date_out,y.reason
    FROM bean b 
    INNER JOIN 
    (   
        SELECT i.inventoryID,i.purchase_price,i.SQU,i.logged_date,ts.best_by_date
        FROM inventory_item i 
        INNER JOIN time_stamp ts 
        ON i.inventoryID = ts.inventoryID
        
    )x  ON x.SQU = b.SQU
    LEFT OUTER JOIN
    (
        SELECT inv.SQU,inv.logged_date,inv.sold,inv.reason
        FROM invoice inv
    )y ON x.SQU = y.SQU;
INSERT INTO #temp(type,name,price,SQU,date_in,date_expired,sold,date_out,reason) 
    SELECT 'Tea',t.name,x.purchase_price,t.SQU,x.logged_date AS date_in,x.best_by_date AS date_expired,y.sold,y.logged_date AS date_out,y.reason
    FROM tea t 
    INNER JOIN 
    (   
        SELECT i.inventoryID,i.purchase_price,i.SQU,i.logged_date,ts.best_by_date
        FROM inventory_item i 
        INNER JOIN time_stamp ts 
        ON i.inventoryID = ts.inventoryID
        
    )x  ON x.SQU = t.SQU
    LEFT OUTER JOIN
    (
        SELECT inv.SQU,inv.logged_date,inv.sold,inv.reason
        FROM invoice inv
    )y ON x.SQU = y.SQU;

/* DISPLAY TABLE CONTENTS */
SELECT * FROM #temp;

/* QUERIES FOR TEMP TABLE: */

/* GET ON-HAND BEAN AND TEA INVENTORY */
SELECT name AS Product, COUNT(*) AS On_Hand_Inventory FROM #temp t
	WHERE t.sold = 0
	GROUP BY t.name;

/* GET ALL BEANS IN ON HAND INVENTORY THAT'RE EXPIRED */
SELECT name AS Product,COUNT(*) AS Quantity_Expired FROM #temp t
	WHERE t.date_expired < '2020-09-11' AND t.sold IS NULL 
	GROUP BY t.name;

/* GET MONEY SPENT ON BEANS DURING TWO WEEKS */
SELECT SUM(t.price) AS Money_Spent 
	FROM #temp t 
	WHERE t.date_out > '2020-05-04' AND t.date_out < '2020-05-20';
/*******************************************************************************/

/*******************************************************************************/
-- Part 3 – MERGE 
-- Write a merge statement to update or insert a record in one of your tables.
/*******************************************************************************/
/*Merge Statement: reason for being sold column was added to invoice. Using a 
				   merge statement to fill a default value in for all previous
				   invoices. */
CREATE TABLE #tempt(sold BIT NOT NULL);
INSERT INTO #tempt VALUES (1);

MERGE INTO invoice as target
    USING (SELECT sold FROM #tempt) as source
        ON target.sold = source.sold
    WHEN MATCHED THEN
        UPDATE SET reason = 'sold'
    WHEN NOT MATCHED BY SOURCE THEN
        UPDATE SET reason = 'used in store';

SELECT SQU,logged_date AS Date_Out,sold,reason FROM invoice;

/*******************************************************************************/
-- Part 4 – CTE 
-- Write a query that uses a CTE (common table expression) to simplify the query. 
-- Create a view of the query.
/*******************************************************************************/
/*CTE Simplified Query: */
CREATE VIEW vw_UnexpiredBeansOnHand(name,source,roast,bag_size,purchase_price) AS
	WITH  cte_InventoryTimeStamp(inventoryID,purchase_price,SQU,logged_date,best_by_date)
	AS 
	(
		SELECT i.inventoryID,i.purchase_price,i.SQU,i.logged_date,ts.best_by_date
        FROM inventory_item i 
        INNER JOIN time_stamp ts 
        ON i.inventoryID = ts.inventoryID
    ),
     cte_ItemTimeStampInvoice(purchase_price,SQU,purchase_date,best_by_date,sold_date,sold)
	AS
	(
		SELECT t.purchase_price,t.SQU,t.logged_date AS purchase_price,t.best_by_date,i.logged_date AS sold_date,i.sold
		FROM cte_InventoryTimeStamp t
		LEFT OUTER JOIN invoice i
		ON t.SQU = i.SQU
	)
	SELECT name,source,roast,bag_size,purchase_price FROM bean b LEFT OUTER JOIN cte_ItemTimeStampInvoice t ON b.SQU = t.SQU WHERE t.sold IS NULL AND t.best_by_date > '2020-09-07';

/* DISPLAY VIEW */
SELECT name AS Bean_Product,roast AS Roast,bag_size AS Bag_Size,purchase_price AS Price FROM DB_Inventory.dbo.vw_UnexpiredBeansOnHand;
/*******************************************************************************/


/*******************************************************************************/
-- Part 5 – Dates 
-- Write a query that uses dates and create a view for it. 
-- This could be combined with part 4.
/*******************************************************************************/
/*Query using dates: Get most to least commonly sold coffee between dates*/
CREATE VIEW vw_TopBeans(Most_Commonly_Sold,Amount) AS
(
    SELECT TOP 10 name AS Most_Commonly_Sold, COUNT(*) AS Amount
	    FROM bean b 
	    LEFT OUTER JOIN invoice i
	    ON i.SQU = b.SQU
	    WHERE i.logged_date > '2020-05-01' AND i.logged_date < '2020-05-11'
	    GROUP BY name 
);

/* DISPLAY VIEW */
SELECT * FROM vw_TopBeans ORDER BY amount DESC;
/*******************************************************************************/

