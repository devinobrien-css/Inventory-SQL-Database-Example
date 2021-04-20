/****************************************************************************************************************************/
/* DATA BASE FUNCTIONS
 * Created By Devin O'Brien
 * Version 1
 */

/*************************************************************************/
/********************************TASK 1***********************************/
-- Create three functions for your database.
-- One scalar, one inline table valued, one multi-line table valued. 
-- The exact functions should make sense for your database. 
/*************************************************************************/
CREATE FUNCTION apply_tax(@current_val NUMERIC(3,2)) --SCALAR
RETURNS NUMERIC(6,2)
AS 
BEGIN 	
	RETURN @current_val + (@current_val * .06)
END;


SELECT 
	i.SQU,
	i.purchase_price AS Original_Price,
	dbo.apply_tax(i.purchase_price) AS Taxed_Price
FROM 
	inventory_item i;
/*************************************************************************/
CREATE  FUNCTION full_price_of_beans(@start_SQU INT, @end_SQU INT) --MULTILINE
	RETURNS @temp TABLE
	(
		item_SQU INT,
		item_name VARCHAR(30),
		item_full_price NUMERIC(6,2)
	)
	AS
    BEGIN
		INSERT INTO @temp (item_SQU,item_name,item_full_price)
			SELECT 
				b.SQU,b.name AS Product,((2.00)+(dbo.apply_tax(i.purchase_price))) AS Full_Price --adds $2 for store profit
			FROM bean b 
			INNER JOIN  inventory_item i ON b.SQU = i.SQU
			WHERE b.SQU >= 1010000000 AND b.SQU < 1010000040
		RETURN
	END; 

SELECT 
	* 
FROM
 	full_price_of_beans(1010000000,1010000040);
/*************************************************************************/
CREATE FUNCTION in_stock_unexpired_beans(@current_date DATE) --INLINE
RETURNS TABLE AS
	RETURN
	(
		SELECT 
			b.name AS Product,
			b.SQU,
			t.best_by_date AS Expiree_Date,
			@current_date AS Date_Today
		FROM
			bean b
		INNER JOIN
			time_stamp t
		ON 
			t.inventoryID = (SELECT inventoryID FROM dry_ingredient d WHERE b.SQU = d.SQU) 
			AND
			(SELECT i.sold FROM invoice i WHERE i.SQU = b.SQU) IS NULL
		WHERE
			t.best_by_date > @current_date
	);


SELECT * FROM dbo.in_stock_unexpired_beans('2020-05-02');
/*************************************************************************/

/*************************************************************************/
/********************************TASK 2***********************************/
-- Create a stored procedure for your database. 
-- Ensure that it takes a parameter. 
-- Wrap it in a transaction to ensure that the whole stored 
-- 	procedure works or it does not.
-- Write a query to test your stored procedure.
/************************************************************************/
CREATE TABLE #temp
(
	SQU INT,
	date_expires DATE,
	date_today DATE
)

CREATE PROCEDURE dbo.all_expired_unsold_inventory (@current_date DATE)  
	AS
	BEGIN 
        BEGIN TRAN 
		INSERT INTO 
			#temp (SQU,date_expires,date_today)
		SELECT 
			i.SQU,
			t.best_by_date,
			@current_date
		FROM 
			inventory_item i
		INNER JOIN 
			time_stamp t
		ON 
			i.inventoryID = t.inventoryID
		WHERE 
			t.best_by_date < @current_date
			AND
			(SELECT sold FROM invoice inv WHERE i.SQU = inv.SQU) IS NULL
	    IF @@rowcount < 1
		    ROLLBACK TRAN
		ELSE 
			COMMIT TRAN
	    END;

EXEC all_expired_unsold_inventory @current_date = '2020-09-03';

SELECT * FROM #temp;
/*************************************************************************/
