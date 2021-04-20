/*****************************************************************************************************************************/
/* DATA BASE QUERIES
 * Created By Devin O'Brien
 * Version 3
 */

/****************************************************************************************************/
/* QUERY: Validate all beans in inventory have been time stamped */ 
SELECT name,source,best_by_date,use_after_open FROM 
(
	SELECT b.SQU,name,bag_size
	FROM bean b LEFT OUTER JOIN dry_ingredient d 
	ON b.dry_ingredientID = d.dry_ingredientID
) s 
LEFT OUTER JOIN time_stamp t 
ON s.inventoryID = t.inventoryID 
/****************************************************************************************************/

/****************************************************************************************************/
/*QUERY 2: Get all * in inventory that have an invoice(have been used or sold) */ 
/* bean */
SELECT * FROM 
(
	SELECT b.SQU,name,bag_size
	FROM bean b LEFT OUTER JOIN dry_ingredient d 
	ON b.dry_ingredientID = d.dry_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL

/* milk */
SELECT * FROM 
(
	SELECT m.SQU,type,size
	FROM milk m LEFT OUTER JOIN wet_ingredient w 
	ON m.wet_ingredientID = w.wet_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL

/* juice */
SELECT * FROM 
(
	SELECT j.SQU,type,size
	FROM juice j LEFT OUTER JOIN wet_ingredient w 
	ON j.wet_ingredientID = w.wet_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get all beans in inventory that haven't expired according to their time stamp */ 
SELECT SQU,name AS Item,best_by_date AS Use_Before, '2020-05-06' AS Date FROM 
(
	SELECT b.SQU,name,source,inventoryID 
	FROM bean b LEFT OUTER JOIN dry_ingredient d 
	ON b.dry_ingredientID = d.dry_ingredientID
) s 
LEFT OUTER JOIN time_stamp t 
ON s.inventoryID = t.inventoryID 
WHERE t.best_by_date > '2020-05-06' --NOTE: this date must be case specific 
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get all beans that don't have an invoice */
SELECT DISTINCT SQU,name AS Unused_Product FROM bean b
WHERE b.SQU NOT IN (SELECT i.SQU FROM invoice i)
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get all beans that were used (not sold) during specified week and who logged it*/
SELECT b.SQU,b.name AS Bean_Name, i.logged_date AS Date_Used, i.logged_by AS Employee   
    FROM bean b 
    LEFT OUTER JOIN invoice i
    ON i.SQU = b.SQU
    WHERE i.sold = 0 AND i.logged_date > '2020-05-01' AND i.logged_date < '2020-05-09'
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get money spent on inventory during week */
SELECT SUM(purchase_price) AS Money_Spent
	FROM Inventory_item i 
	WHERE i.logged_date < '2020-05-09' AND i.logged_date > '2020-05-06'
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get money spent on beans in most recent shipment */
SELECT SUM(purchase_price) AS Money_Spent
	FROM Inventory_item i 
	INNER JOIN bean b 
	ON b.SQU = i.SQU
	WHERE i.logged_date < '2020-05-09' AND i.logged_date > '2020-05-06'
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Find who logged the recent shipment and retrieve the SQUs of the items logged */
SELECT SQU, logged_by AS Employee, logged_date AS Date 
    FROM invoice i 
    WHERE i.logged_date < '2020-05-09' AND i.logged_date > '2020-05-06'
    ORDER BY Date DESC


/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
 /* QUERY: how much money was made back on sales during the week specified (doesn't include profit from sales price) */
SELECT SUM(purchase_price) AS Money_Back_From_Week_Of_Sales
    FROM inventory_item item
    INNER JOIN invoice inv
    ON item.SQU = inv.SQU
    WHERE inv.logged_date > '2020-05-06' AND inv.logged_date < '2020-05-12'
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: How much the store spent on shipment vs how much was made during week */
SELECT Money_Spent,Money_Back,Money_Spent-Money_Back AS Leftover FROM
(
    SELECT SUM(purchase_price) AS Money_Spent 
    FROM Inventory_item i 
    WHERE i.logged_date < '2020-05-09' AND i.logged_date > '2020-05-06'
) a
FULL OUTER JOIN
(
    SELECT SUM(purchase_price) AS Money_Back
    FROM inventory_item item
    INNER JOIN invoice inv
    ON item.SQU = inv.SQU
    WHERE inv.logged_date > '2020-05-06' AND inv.logged_date < '2020-05-12'
) b
ON a.Money_Spent IS NOT NULL
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get the name and SQU for all beans in inventory that have expired according to their time stamp and haven't been sold*/
SELECT DISTINCT SQU,name as Expired_Good  FROM 
(
    SELECT b.SQU,b.name,t.best_by_date FROM bean b 
    INNER JOIN time_stamp t 
    ON t.inventoryID = (SELECT inventoryID FROM dry_ingredient d WHERE d.dry_ingredientID = b.dry_ingredientID)
    WHERE t.best_by_date < '2020-09-05'
)a
INTERSECT
(
    SELECT SQU,name FROM bean b
    WHERE b.SQU NOT IN (SELECT i.SQU FROM invoice i)
)
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get most to least commonly sold coffee between dates*/
SELECT TOP 10 name AS Most_Commonly_Sold  
    FROM bean b 
    LEFT OUTER JOIN invoice i
    ON i.SQU = b.SQU
    WHERE i.logged_date > '2020-05-01' AND i.logged_date < '2020-05-11'
    GROUP BY name
    ORDER BY COUNT(name) DESC
/*****************************************************************************************************************************/


/****************************************************************************************************/
/*QUERY: Get all beans in inventory and show me all invoices linked with them if any (shows all sold/unsold) */ 
SELECT * FROM 
(
    SELECT b.SQU,name,source
    FROM bean b LEFT OUTER JOIN dry_ingredient d 
    ON b.dry_ingredientID = d.dry_ingredientID

) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU
ORDER BY logged_date DESC
/****************************************************************************************************/


/****************************************************************************************************/
/*QUERY: Get all beans in inventory that have an invoice(have been used or sold) */ 
SELECT * FROM 
(
    SELECT b.SQU,name,source
    FROM bean b LEFT OUTER JOIN dry_ingredient d 
    ON b.dry_ingredientID = d.dry_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL

SELECT * FROM 
(
    SELECT m.SQU,type,size
    FROM milk m LEFT OUTER JOIN wet_ingredient w 
    ON m.wet_ingredientID = w.wet_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL

SELECT * FROM 
(
    SELECT j.SQU,type,size
    FROM juice j LEFT OUTER JOIN wet_ingredient w 
    ON j.wet_ingredientID = w.wet_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL

SELECT * FROM 
(
    SELECT s.SQU,type,size
    FROM syrup s LEFT OUTER JOIN wet_ingredient w 
    ON s.wet_ingredientID = w.wet_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NOT NULL
/****************************************************************************************************/************************************************************************************************/


/****************************************************************************************************/
/*QUERY: Get all beans in inventory that don't have an invoice (haven't been used or sold) */ 
SELECT name,source FROM 
(
    SELECT b.SQU,name,source 
    FROM bean b LEFT OUTER JOIN dry_ingredient d 
    ON b.dry_ingredientID = d.dry_ingredientID
) s 
LEFT OUTER JOIN invoice i 
ON s.SQU = i.SQU 
WHERE i.invoiceID IS NULL
/****************************************************************************************************/


/****************************************************************************************************/
/*QUERY: Get all beans in inventory that have been time stamped */ 
SELECT name,source,best_by_date,use_after_open FROM 
(
    SELECT b.SQU,name,source,inventoryID 
    FROM bean b LEFT OUTER JOIN dry_ingredient d 
    ON b.dry_ingredientID = d.dry_ingredientID
) s 
LEFT OUTER JOIN time_stamp t 
ON s.inventoryID = t.inventoryID 
/****************************************************************************************************/


/*****************************************************************************************************************************/
/* QUERY: Get all beans that were used (not sold) during specified week and who logged it*/
SELECT b.SQU,b.name AS Bean_Name, i.logged_date AS Date_Used, i.logged_by AS Employee   
    FROM bean b 
    LEFT OUTER JOIN invoice i
    ON i.SQU = b.SQU
    WHERE i.sold = 0 AND i.logged_date > '2020-05-01' AND i.logged_date < '2020-05-09'
/*****************************************************************************************************************************/

