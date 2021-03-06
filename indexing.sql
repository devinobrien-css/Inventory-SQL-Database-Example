/*****************************************************************************************************************************/
/* DATA BASE INDEX CREATION
 * Created By Devin O'Brien
 * Version 1
 */

/***************************************************************************************/
/* INDEXES FOR COFFEHOUSE DATABASE */
/***************************************************************************************/


/***************************************************************************************/
/* INDEX TABLE: inventory_item */
/***************************************************************************************/
CREATE INDEX IX_INVENTORY_ITEM ON inventory_item(SQU,logged_date);

/***************************************************************************************/
/* INDEX TABLE: invoice */
/***************************************************************************************/
CREATE INDEX IX_INVOICE ON invoice(logged_date,sold);

/***************************************************************************************/
/* INDEX TABLE: timestamp */
/***************************************************************************************/
CREATE INDEX IX_TIMESTAMP ON time_stamp(best_by_date,inventoryID);

/***************************************************************************************/
/* INDEX TABLE: box of lids */
/***************************************************************************************/
CREATE INDEX IX_BOX_OF_LIDS ON box_of_lids(temperature,size);

/***************************************************************************************/
/* INDEX TABLE: box of cups */
/***************************************************************************************/
CREATE INDEX IX_BOX_OF_CUPS ON box_of_cups(temperature,size);
