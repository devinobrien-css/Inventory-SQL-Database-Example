/*****************************************************************************************************************************/
/* DATA BASE INPUT
 * Created By Devin O'Brien
 * Version 3
 */

/*****************************************************************************************************************************/
/* SYNTAX BRIEFING 
 * ---------------
 * Inventory is a combination of general items, a dry ingredient list and a wet ingredient list
 *
 *  SQU NUMBERS
 *  -----------
 *  Dry Ingredient LIKE '101%'
 *  Wet Ingredient LIKE '111%'
 *  General Item LIKE '100%'
 *   NOTE:
 *    1) Every Inventory Item has an SQU
 *    2) Invoices are referenced by SQU
 *    3) TimeStamps are by inventoryID, not SQU
 *
 *  TIME STAMPS
 *  -----------
 *  Time stamps reference items in the dry and wet ingredient lists by inventoryID.
 *  Contains best by information.
 *
 *  INVOICES
 *  --------
 *  Invoices reference inventory items by their SQU once they are sold or
 *  used within the store.
 *  Tracks when it was sold and who sold it.
 *
 */

/*****************************************************************************************************************************/
/*********************************************CREATE INVENTORY LIST***********************************************************/
/*****************************************************************************************************************************/

/*****************************************************************************************************************************/
/* ADD WET INGREDIENT LIST TO LIST OF INVENTORY ITEMS */
INSERT INTO inventory_item
(
    SQU,purchase_price,logged_by,logged_date
) 
VALUES
    (1010000000,3.99,'Georgia Thomas','2020-05-07 11:30:13'), -- FIRST SHIPMENT
    (1010000001,3.99,'Georgia Thomas','2020-05-07 11:31:25'),
    (1010000002,3.99,'Georgia Thomas','2020-05-07 11:31:43'),
    (1010000003,3.99,'Georgia Thomas','2020-05-07 11:32:22'),
    (1010000004,3.99,'Georgia Thomas','2020-05-07 11:32:33'),
    (1010000005,3.99,'Georgia Thomas','2020-05-07 11:33:03'),
    (1010000006,3.99,'Georgia Thomas','2020-05-07 11:33:24'),
    (1010000007,3.99,'Georgia Thomas','2020-05-07 11:33:28'),
    (1010000008,3.99,'Georgia Thomas','2020-05-07 11:34:33'),
    (1010000009,3.99,'Georgia Thomas','2020-05-07 11:35:56'),
    (1010000010,3.99,'Georgia Thomas','2020-05-07 11:36:14'),
    (1010000011,3.99,'Georgia Thomas','2020-05-07 11:36:32'),
    (1010000012,3.99,'Georgia Thomas','2020-05-07 11:36:43'),
    (1010000013,3.99,'Georgia Thomas','2020-05-07 11:37:03'),
    (1010000014,3.99,'Georgia Thomas','2020-05-07 11:38:13'),
    (1010000015,3.99,'Georgia Thomas','2020-05-07 11:39:03'),
    (1010000016,3.99,'Georgia Thomas','2020-05-07 11:39:27'),
    (1010000017,3.99,'Georgia Thomas','2020-05-07 11:39:54'),
    (1010000018,3.99,'Georgia Thomas','2020-05-07 11:40:23'),
    (1010000019,3.99,'Georgia Thomas','2020-05-07 11:40:32'),
    (1010000020,4.99,'Georgia Thomas','2020-05-07 12:50:13'),
    (1010000021,4.99,'Georgia Thomas','2020-05-07 12:51:25'),
    (1010000022,4.99,'Georgia Thomas','2020-05-07 12:51:43'),
    (1010000023,4.99,'Georgia Thomas','2020-05-07 12:52:22'),
    (1010000024,4.99,'Georgia Thomas','2020-05-07 12:52:33'),
    (1010000025,4.99,'Georgia Thomas','2020-05-07 12:53:03'),
    (1010000026,4.99,'Georgia Thomas','2020-05-07 12:53:24'),
    (1010000027,4.99,'Georgia Thomas','2020-05-07 12:53:28'),
    (1010000028,4.99,'Georgia Thomas','2020-05-07 12:54:33'),
    (1010000029,4.99,'Georgia Thomas','2020-05-07 12:55:56'),
    (1010000030,8.99,'Georgia Thomas','2020-05-07 12:56:14'),
    (1010000031,8.99,'Georgia Thomas','2020-05-07 12:56:32'),
    (1010000032,8.99,'Georgia Thomas','2020-05-07 12:56:43'),
    (1010000033,8.99,'Georgia Thomas','2020-05-07 12:57:03'),
    (1010000034,8.99,'Georgia Thomas','2020-05-07 12:58:13'),
    (1010000035,8.99,'Georgia Thomas','2020-05-07 12:59:03'),
    (1010000036,8.99,'Georgia Thomas','2020-05-07 12:59:27'),
    (1010000037,8.99,'Georgia Thomas','2020-05-07 12:59:54'),
    (1010000038,8.99,'Georgia Thomas','2020-05-07 13:00:23'),
    (1010000039,8.99,'Georgia Thomas','2020-05-07 13:00:32'),
    (1010000040,7.99,'Georgia Thomas','2020-05-07 13:01:14'),
    (1010000041,7.99,'Georgia Thomas','2020-05-07 13:06:32'),
    (1010000042,7.99,'Georgia Thomas','2020-05-07 13:06:43'),
    (1010000043,7.99,'Georgia Thomas','2020-05-07 13:07:03'),
    (1010000044,7.99,'Georgia Thomas','2020-05-07 13:08:13'),
    (1010000045,7.99,'Georgia Thomas','2020-05-07 13:09:03'),
    (1010000046,7.99,'Georgia Thomas','2020-05-07 13:09:27'),
    (1010000047,7.99,'Georgia Thomas','2020-05-07 13:09:54'),
    (1010000048,7.99,'Georgia Thomas','2020-05-07 13:10:23'),
    (1010000049,7.99,'Georgia Thomas','2020-05-07 13:10:32'),
    (1010000050,5.99,'Georgia Thomas','2020-05-07 13:11:14'),
    (1010000051,5.99,'Georgia Thomas','2020-05-07 13:16:32'),
    (1010000052,5.99,'Georgia Thomas','2020-05-07 13:16:43'),
    (1010000053,5.99,'Georgia Thomas','2020-05-07 13:17:03'),
    (1010000054,5.99,'Georgia Thomas','2020-05-07 13:18:13'),
    (1010000055,5.99,'Georgia Thomas','2020-05-07 13:19:03'),
    (1010000056,5.99,'Georgia Thomas','2020-05-07 13:19:27'),
    (1010000057,5.99,'Georgia Thomas','2020-05-07 13:19:54'),
    (1010000058,5.99,'Georgia Thomas','2020-05-07 13:20:23'),
    (1010000059,5.99,'Georgia Thomas','2020-05-07 13:20:32'),
    (1010000060,4.99,'Georgia Thomas','2020-05-07 13:21:14'),
    (1010000061,4.99,'Georgia Thomas','2020-05-07 13:26:32'),
    (1010000062,4.99,'Georgia Thomas','2020-05-07 13:26:43'),
    (1010000063,4.99,'Georgia Thomas','2020-05-07 13:27:03'),
    (1010000064,4.99,'Georgia Thomas','2020-05-07 13:28:13'),
    (1010000065,4.99,'Georgia Thomas','2020-05-07 13:29:03'),
    (1010000066,4.99,'Georgia Thomas','2020-05-07 13:29:27'),
    (1010000067,4.99,'Georgia Thomas','2020-05-07 13:29:54'),
    (1010000068,4.99,'Georgia Thomas','2020-05-07 13:30:23'),
    (1010000069,4.99,'Georgia Thomas','2020-05-07 13:30:32'),
    (1010000070,2.99,'Georgia Thomas','2020-05-07 13:31:14'),
    (1010000071,2.99,'Georgia Thomas','2020-05-07 13:36:32'),
    (1010000072,2.99,'Georgia Thomas','2020-05-07 13:36:43'),
    (1010000073,2.99,'Georgia Thomas','2020-05-07 13:37:03'),
    (1010000074,2.99,'Georgia Thomas','2020-05-07 13:38:13'),
    (1010000075,2.99,'Georgia Thomas','2020-05-07 13:39:03'),
    (1010000076,2.99,'Georgia Thomas','2020-05-07 13:39:27'),
    (1010000077,2.99,'Georgia Thomas','2020-05-07 13:39:54'),
    (1010000078,2.99,'Georgia Thomas','2020-05-07 13:40:23'),
    (1010000079,2.99,'Georgia Thomas','2020-05-07 13:40:32'),
    (1010000080,4.99,'Georgia Thomas','2020-05-07 13:41:14'),
    (1010000081,4.99,'Georgia Thomas','2020-05-07 13:46:32'),
    (1010000082,4.99,'Georgia Thomas','2020-05-07 13:46:43'),
    (1010000083,4.99,'Georgia Thomas','2020-05-07 13:47:03'),
    (1010000084,4.99,'Georgia Thomas','2020-05-07 13:48:13'),
    (1010000085,4.99,'Georgia Thomas','2020-05-07 13:49:03'),
    (1010000086,4.99,'Georgia Thomas','2020-05-07 13:49:27'),
    (1010000087,4.99,'Georgia Thomas','2020-05-07 13:49:54'),
    (1010000088,4.99,'Georgia Thomas','2020-05-07 13:50:23'),
    (1010000089,4.99,'Georgia Thomas','2020-05-07 13:50:32'),
    (1010000090,4.99,'Georgia Thomas','2020-05-07 13:51:14'),
    (1010000091,4.99,'Georgia Thomas','2020-05-07 13:56:32'),
    (1010000092,4.99,'Georgia Thomas','2020-05-07 13:56:43'),
    (1010000093,4.99,'Georgia Thomas','2020-05-07 13:57:03'),
    (1010000094,4.99,'Georgia Thomas','2020-05-07 13:58:13'),
    (1010000095,4.99,'Georgia Thomas','2020-05-07 13:59:03'),
    (1010000096,4.99,'Georgia Thomas','2020-05-07 13:59:27'),
    (1010000097,4.99,'Georgia Thomas','2020-05-07 13:59:54'),
    (1010000098,4.99,'Georgia Thomas','2020-05-07 14:00:23'),
    (1010000099,4.99,'Georgia Thomas','2020-05-07 14:00:32'),
    (1010000100,4.99,'Georgia Thomas','2020-05-07 14:01:14'),
    (1010000101,4.99,'Georgia Thomas','2020-05-07 14:02:32'),
    (1010000102,4.99,'Georgia Thomas','2020-05-07 14:02:43'),
    (1010000103,4.99,'Georgia Thomas','2020-05-07 14:03:03'),
    (1010000104,4.99,'Georgia Thomas','2020-05-07 14:04:13'),
    (1010000105,4.99,'Georgia Thomas','2020-05-07 14:05:03'),
    (1010000106,4.99,'Georgia Thomas','2020-05-07 14:05:27'),
    (1010000107,4.99,'Georgia Thomas','2020-05-07 14:05:54'),
    (1010000108,4.99,'Georgia Thomas','2020-05-07 14:06:23'),
    (1010000109,4.99,'Georgia Thomas','2020-05-07 14:06:32'),
    (1010000110,4.99,'Georgia Thomas','2020-05-07 14:06:32'),
    (1010000111,4.99,'Georgia Thomas','2020-05-07 14:02:32'),
    (1010000112,4.99,'Georgia Thomas','2020-05-07 14:02:43'),
    (1010000113,4.99,'Georgia Thomas','2020-05-07 14:03:03'),
    (1010000114,4.99,'Georgia Thomas','2020-05-07 14:04:13'),
    (1010000115,4.99,'Georgia Thomas','2020-05-07 14:05:03'),
    (1010000116,4.99,'Georgia Thomas','2020-05-07 14:05:27'),
    (1010000117,4.99,'Georgia Thomas','2020-05-07 14:05:54'),
    (1010000118,4.99,'Georgia Thomas','2020-05-07 14:06:23'),
    (1010000119,4.99,'Georgia Thomas','2020-05-07 14:06:32'),
    (1010000120,4.99,'Georgia Thomas','2020-05-07 14:06:32'),
    (1010000121,4.99,'Georgia Thomas','2020-05-07 14:02:32'),
    (1010000122,4.99,'Georgia Thomas','2020-05-07 14:02:43'),
    (1010000123,4.99,'Georgia Thomas','2020-05-07 14:03:03'),
    (1010000124,4.99,'Georgia Thomas','2020-05-07 14:04:13'),
    (1010000125,4.99,'Jess Systellia','2020-05-14 14:05:03'), --SECOND SHIPMENT
    (1010000126,4.99,'Jess Systellia','2020-05-14 14:05:27'),
    (1010000127,4.99,'Jess Systellia','2020-05-14 14:05:54'),
    (1010000128,4.99,'Jess Systellia','2020-05-14 14:06:23'),
    (1010000129,4.99,'Jess Systellia','2020-05-14 14:06:32'),
    (1010000130,4.99,'Jess Systellia','2020-05-14 14:06:32'),
    (1010000131,4.99,'Jess Systellia','2020-05-14 14:12:32'),
    (1010000132,4.99,'Jess Systellia','2020-05-14 14:12:43'),
    (1010000133,4.99,'Jess Systellia','2020-05-14 14:13:03'),
    (1010000134,4.99,'Jess Systellia','2020-05-14 14:14:13'),
    (1010000135,4.99,'Jess Systellia','2020-05-14 14:15:03'),
    (1010000136,4.99,'Jess Systellia','2020-05-14 14:15:27'),
    (1010000137,4.99,'Jess Systellia','2020-05-14 14:15:54'),
    (1010000138,4.99,'Jess Systellia','2020-05-14 14:16:23'),
    (1010000139,4.99,'Jess Systellia','2020-05-14 14:16:32'),
    (1010000140,4.99,'Jess Systellia','2020-05-14 14:16:32'),
    (1010000141,4.99,'Jess Systellia','2020-05-14 14:22:32'),
    (1010000142,4.99,'Jess Systellia','2020-05-14 14:22:43'),
    (1010000143,4.99,'Jess Systellia','2020-05-14 14:23:03'),
    (1010000144,4.99,'Jess Systellia','2020-05-14 14:24:13'),
    (1010000145,4.99,'Jess Systellia','2020-05-14 14:25:03'),
    (1010000146,4.99,'Jess Systellia','2020-05-14 14:25:27'),
    (1010000147,4.99,'Jess Systellia','2020-05-14 14:25:54'),
    (1010000148,4.99,'Jess Systellia','2020-05-14 14:26:23'),
    (1010000149,4.99,'Jess Systellia','2020-05-14 14:26:32'),
    (1010000150,4.99,'Jess Systellia','2020-05-14 14:26:32'),
    (1010000151,4.99,'Jess Systellia','2020-05-14 14:32:32'),
    (1010000152,4.99,'Jess Systellia','2020-05-14 14:32:43'),
    (1010000153,4.99,'Jess Systellia','2020-05-14 14:33:03'),
    (1010000154,4.99,'Jess Systellia','2020-05-14 14:34:13'),
    (1010000155,4.99,'Jess Systellia','2020-05-14 14:35:03'),
    (1010000156,4.99,'Jess Systellia','2020-05-14 14:35:27'),
    (1010000157,4.99,'Jess Systellia','2020-05-14 14:35:54'),
    (1010000158,4.99,'Jess Systellia','2020-05-14 14:36:23'),
    (1010000159,4.99,'Jess Systellia','2020-05-14 14:36:32');
/*****************************************************************************************************************************/

/*****************************************************************************************************************************/
/* ADD LIST OF INVENTORY ITEMS */
INSERT INTO inventory_item
(
    SQU,purchase_price,logged_by,logged_date
) 
VALUES
    (1110000000,2.99,'Jess Systellia','2020-05-07 06:20:13'),-- FIRST SHIPMENT
    (1110000001,2.99,'Jess Systellia','2020-05-07 06:21:25'),
    (1110000002,2.99,'Jess Systellia','2020-05-07 06:21:43'),
    (1110000003,2.99,'Jess Systellia','2020-05-07 06:22:22'),
    (1110000004,2.99,'Jess Systellia','2020-05-07 06:22:33'),
    (1110000005,2.99,'Jess Systellia','2020-05-07 06:23:03'),
    (1110000006,2.99,'Jess Systellia','2020-05-07 06:23:24'),
    (1110000007,2.99,'Jess Systellia','2020-05-07 06:23:28'),
    (1110000008,2.99,'Jess Systellia','2020-05-07 06:24:33'),
    (1110000009,2.99,'Jess Systellia','2020-05-07 06:25:56'),
    (1110000010,2.99,'Jess Systellia','2020-05-07 06:26:14'),
    (1110000011,2.99,'Jess Systellia','2020-05-07 06:26:32'),
    (1110000012,2.99,'Jess Systellia','2020-05-07 06:26:43'),
    (1110000013,2.99,'Jess Systellia','2020-05-07 06:27:03'),
    (1110000014,2.99,'Jess Systellia','2020-05-07 06:28:13'),
    (1110000015,2.99,'Jess Systellia','2020-05-07 06:29:03'),
    (1110000016,4.99,'Jess Systellia','2020-05-07 06:29:27'),
    (1110000017,4.99,'Jess Systellia','2020-05-07 06:29:54'),
    (1110000018,4.99,'Jess Systellia','2020-05-07 06:30:23'),
    (1110000019,4.99,'Jess Systellia','2020-05-07 06:30:32'),
    (1110000020,4.99,'Jess Systellia','2020-05-07 07:20:13'),
    (1110000021,4.99,'Jess Systellia','2020-05-07 07:21:25'),
    (1110000022,4.99,'Jess Systellia','2020-05-07 07:21:43'),
    (1110000023,4.99,'Jess Systellia','2020-05-07 07:22:22'),
    (1110000024,3.99,'Jess Systellia','2020-05-07 07:22:33'),
    (1110000025,3.99,'Jess Systellia','2020-05-07 07:23:03'),
    (1110000026,3.99,'Jess Systellia','2020-05-07 07:23:24'),
    (1110000027,3.99,'Jess Systellia','2020-05-07 07:23:28'),
    (1110000028,3.99,'Jess Systellia','2020-05-07 07:24:33'),
    (1110000029,3.99,'Jess Systellia','2020-05-07 07:25:56'),
    (1110000030,3.99,'Jess Systellia','2020-05-07 07:26:14'),
    (1110000031,3.99,'Jess Systellia','2020-05-07 07:26:32'),
    (1110000032,4.99,'Jess Systellia','2020-05-07 07:26:43'),
    (1110000033,4.99,'Jess Systellia','2020-05-07 07:27:03'),
    (1110000034,4.99,'Jess Systellia','2020-05-07 07:28:13'),
    (1110000035,4.99,'Jess Systellia','2020-05-07 07:29:03'),
    (1110000036,4.99,'Jess Systellia','2020-05-07 07:29:27'),
    (1110000037,4.99,'Jess Systellia','2020-05-07 07:29:54'),
    (1110000038,4.99,'Jess Systellia','2020-05-07 07:30:23'),
    (1110000039,4.99,'Jess Systellia','2020-05-07 07:30:32'),
    (1110000040,2.99,'Jess Systellia','2020-05-07 07:26:14'),
    (1110000041,2.99,'Jess Systellia','2020-05-07 07:26:32'),
    (1110000042,2.99,'Jess Systellia','2020-05-07 07:26:43'),
    (1110000043,2.99,'Jess Systellia','2020-05-07 07:27:03'),
    (1110000044,2.99,'Jess Systellia','2020-05-07 07:28:13'),
    (1110000045,1.99,'Jess Systellia','2020-05-07 07:29:03'),
    (1110000046,1.99,'Jess Systellia','2020-05-07 07:29:27'),
    (1110000047,1.99,'Jess Systellia','2020-05-07 07:29:54'),
    (1110000048,1.99,'Jess Systellia','2020-05-07 07:30:23'),
    (1110000049,1.99,'Jess Systellia','2020-05-07 07:30:32'),
    (1110000050,3.99,'Jess Systellia','2020-05-07 07:40:13'),
    (1110000051,3.99,'Jess Systellia','2020-05-07 07:41:25'),
    (1110000052,3.99,'Jess Systellia','2020-05-07 07:41:43'),
    (1110000053,3.99,'Jess Systellia','2020-05-07 07:42:22'),
    (1110000054,3.99,'Jess Systellia','2020-05-07 07:42:33'),
    (1110000055,4.99,'Jess Systellia','2020-05-07 07:43:03'),
    (1110000056,4.99,'Jess Systellia','2020-05-07 07:43:24'),
    (1110000057,4.99,'Jess Systellia','2020-05-07 07:43:28'),
    (1110000058,4.99,'Jess Systellia','2020-05-07 07:44:33'),
    (1110000059,4.99,'Jess Systellia','2020-05-07 07:45:56'),
    (1110000060,5.99,'Jess Systellia','2020-05-07 07:46:14'),
    (1110000061,5.99,'Jess Systellia','2020-05-07 07:46:32'),
    (1110000062,5.99,'Jess Systellia','2020-05-07 07:46:43'),
    (1110000063,5.99,'Jess Systellia','2020-05-07 07:47:03'),
    (1110000064,5.99,'Jess Systellia','2020-05-07 07:48:13'),
    (1110000065,7.99,'Jess Systellia','2020-05-07 07:49:03'),
    (1110000066,7.99,'Jess Systellia','2020-05-07 07:49:27'),
    (1110000067,7.99,'Jess Systellia','2020-05-07 07:49:54'),
    (1110000068,7.99,'Jess Systellia','2020-05-07 07:50:23'),
    (1110000069,7.99,'Jess Systellia','2020-05-07 07:50:32'),
    (1110000070,7.99,'Jess Systellia','2020-05-07 07:50:13'),
    (1110000071,7.99,'Jess Systellia','2020-05-07 07:51:25'),
    (1110000072,7.99,'Jess Systellia','2020-05-07 07:51:43'),
    (1110000073,7.99,'Jess Systellia','2020-05-07 07:52:22'),
    (1110000074,7.99,'Jess Systellia','2020-05-07 07:52:33'),
    (1110000075,7.99,'Jess Systellia','2020-05-07 07:53:03'),
    (1110000076,7.99,'Jess Systellia','2020-05-07 07:53:24'),
    (1110000077,7.99,'Jess Systellia','2020-05-07 07:53:28'),
    (1110000078,7.99,'Jess Systellia','2020-05-07 07:54:33'),
    (1110000079,7.99,'Jess Systellia','2020-05-07 07:55:56'),
    (1110000080,7.99,'Jess Systellia','2020-05-07 07:56:14'),
    (1110000081,7.99,'Jess Systellia','2020-05-07 07:56:32'),
    (1110000082,7.99,'Jess Systellia','2020-05-07 07:56:43'),
    (1110000083,7.99,'Jess Systellia','2020-05-07 07:57:03'),
    (1110000084,7.99,'Jess Systellia','2020-05-07 07:58:13'),
    (1110000085,7.99,'Jess Systellia','2020-05-07 07:59:03'),
    (1110000086,7.99,'Jess Systellia','2020-05-07 07:59:27'),
    (1110000087,7.99,'Jess Systellia','2020-05-07 07:59:54'),
    (1110000088,7.99,'Jess Systellia','2020-05-07 08:00:23'),
    (1110000089,7.99,'Jess Systellia','2020-05-07 08:00:32'),
    (1110000090,7.99,'Jess Systellia','2020-05-07 08:06:14'),
    (1110000091,7.99,'Jess Systellia','2020-05-07 08:06:32'),
    (1110000092,7.99,'Jess Systellia','2020-05-07 08:06:43'),
    (1110000093,7.99,'Jess Systellia','2020-05-07 08:07:03'),
    (1110000094,7.99,'Jess Systellia','2020-05-07 08:08:13'),
    (1110000095,7.99,'Jess Systellia','2020-05-07 08:09:03'),
    (1110000096,7.99,'Jess Systellia','2020-05-07 08:09:27'),
    (1110000097,7.99,'Jess Systellia','2020-05-07 08:09:54'),
    (1110000098,7.99,'Jess Systellia','2020-05-07 08:10:23'),
    (1110000099,7.99,'Jess Systellia','2020-05-07 08:10:32'),
    (1110000100,7.99,'Jess Systellia','2020-05-07 08:06:14'),
    (1110000101,7.99,'Jess Systellia','2020-05-07 08:06:32'),
    (1110000102,7.99,'Jess Systellia','2020-05-07 08:06:43'),
    (1110000103,7.99,'Jess Systellia','2020-05-07 08:07:03'),
    (1110000104,7.99,'Jess Systellia','2020-05-07 08:08:13'),
    (1110000105,7.99,'Jess Systellia','2020-05-07 08:09:03'),
    (1110000106,7.99,'Jess Systellia','2020-05-07 08:09:27'),
    (1110000107,7.99,'Jess Systellia','2020-05-07 08:09:54'),
    (1110000108,7.99,'Jess Systellia','2020-05-07 08:10:23'),
    (1110000109,7.99,'Jess Systellia','2020-05-07 08:10:32'),
    (1110000110,7.99,'Jess Systellia','2020-05-07 08:06:14'),
    (1110000111,7.99,'Jess Systellia','2020-05-07 08:06:32'),
    (1110000112,7.99,'Jess Systellia','2020-05-07 08:06:43'),
    (1110000113,7.99,'Jess Systellia','2020-05-07 08:07:03'),
    (1110000114,7.99,'Jess Systellia','2020-05-07 08:08:13'),
    (1110000115,2.99,'Georgia Thomas','2020-05-14 08:09:03'), --SECOND SHIPMENT
    (1110000116,2.99,'Georgia Thomas','2020-05-14 08:09:27'),
    (1110000117,2.99,'Georgia Thomas','2020-05-14 08:09:54'),
    (1110000118,2.99,'Georgia Thomas','2020-05-14 08:10:23'),
    (1110000119,2.99,'Georgia Thomas','2020-05-14 08:10:32'),
    (1110000120,2.99,'Georgia Thomas','2020-05-14 08:16:14'),
    (1110000121,2.99,'Georgia Thomas','2020-05-14 08:16:32'),
    (1110000122,2.99,'Georgia Thomas','2020-05-14 08:16:43'),
    (1110000123,2.99,'Georgia Thomas','2020-05-14 08:17:03'),
    (1110000124,2.99,'Georgia Thomas','2020-05-14 08:18:13'),
    (1110000125,2.99,'Georgia Thomas','2020-05-14 08:19:03'),
    (1110000126,2.99,'Georgia Thomas','2020-05-14 08:19:27'),
    (1110000127,2.99,'Georgia Thomas','2020-05-14 08:19:54'),
    (1110000128,2.99,'Georgia Thomas','2020-05-14 08:20:23'),
    (1110000129,2.99,'Georgia Thomas','2020-05-14 08:20:32'),
    (1110000130,2.99,'Georgia Thomas','2020-05-14 08:26:14'),
    (1110000131,4.99,'Georgia Thomas','2020-05-14 08:26:32'),
    (1110000132,4.99,'Georgia Thomas','2020-05-14 08:26:43'),
    (1110000133,4.99,'Georgia Thomas','2020-05-14 08:27:03'),
    (1110000134,4.99,'Georgia Thomas','2020-05-14 08:28:13'),
    (1110000135,4.99,'Georgia Thomas','2020-05-14 08:29:03'),
    (1110000136,4.99,'Georgia Thomas','2020-05-14 08:29:27'),
    (1110000137,4.99,'Georgia Thomas','2020-05-14 08:29:54'),
    (1110000138,4.99,'Georgia Thomas','2020-05-14 08:30:23'),
    (1110000139,3.99,'Georgia Thomas','2020-05-14 08:30:32'),
    (1110000140,3.99,'Georgia Thomas','2020-05-14 08:36:14'),
    (1110000141,3.99,'Georgia Thomas','2020-05-14 08:36:32'),
    (1110000142,3.99,'Georgia Thomas','2020-05-14 08:36:43'),
    (1110000143,3.99,'Georgia Thomas','2020-05-14 08:37:03'),
    (1110000144,3.99,'Georgia Thomas','2020-05-14 08:38:13'),
    (1110000145,3.99,'Georgia Thomas','2020-05-14 08:39:03'),
    (1110000146,3.99,'Georgia Thomas','2020-05-14 08:39:27'),
    (1110000147,4.99,'Georgia Thomas','2020-05-14 08:39:54'),
    (1110000148,4.99,'Georgia Thomas','2020-05-14 08:40:23'),
    (1110000149,4.99,'Georgia Thomas','2020-05-14 08:40:32'),
    (1110000150,4.99,'Georgia Thomas','2020-05-14 08:46:14'),
    (1110000151,4.99,'Georgia Thomas','2020-05-14 08:46:32'),
    (1110000152,4.99,'Georgia Thomas','2020-05-14 08:46:43'),
    (1110000153,4.99,'Georgia Thomas','2020-05-14 08:47:03'),
    (1110000154,4.99,'Georgia Thomas','2020-05-14 08:48:13'),
    (1110000155,2.99,'Georgia Thomas','2020-05-14 08:49:03'),
    (1110000156,2.99,'Georgia Thomas','2020-05-14 08:49:27'),
    (1110000157,2.99,'Georgia Thomas','2020-05-14 08:49:54'),
    (1110000158,1.99,'Georgia Thomas','2020-05-14 08:50:23'),
    (1110000159,1.99,'Georgia Thomas','2020-05-14 08:50:32'),
    (1110000160,1.99,'Georgia Thomas','2020-05-14 08:56:14'),
    (1110000161,3.99,'Georgia Thomas','2020-05-14 08:56:32'),
    (1110000162,3.99,'Georgia Thomas','2020-05-14 08:56:43'),
    (1110000163,3.99,'Georgia Thomas','2020-05-14 08:57:03'),
    (1110000164,4.99,'Georgia Thomas','2020-05-14 08:58:13'),
    (1110000165,4.99,'Georgia Thomas','2020-05-14 08:59:03'),
    (1110000166,4.99,'Georgia Thomas','2020-05-14 08:59:27'),
    (1110000167,5.99,'Georgia Thomas','2020-05-14 08:59:54'),
    (1110000168,5.99,'Georgia Thomas','2020-05-14 09:00:23'),
    (1110000169,5.99,'Georgia Thomas','2020-05-14 09:00:32'),
    (1110000170,7.99,'Jeff Collins','2020-05-21 09:06:14'), -- THIRD SHIPMENT
    (1110000171,7.99,'Jeff Collins','2020-05-21 09:06:32'),
    (1110000172,7.99,'Jeff Collins','2020-05-21 09:06:43'),
    (1110000173,7.99,'Jeff Collins','2020-05-21 09:07:03'),
    (1110000174,7.99,'Jeff Collins','2020-05-21 09:08:13'),
    (1110000175,3.99,'Jeff Collins','2020-05-21 09:09:03'),
    (1110000176,3.99,'Jeff Collins','2020-05-21 09:09:27'),
    (1110000177,3.99,'Jeff Collins','2020-05-21 09:09:54'),
    (1110000178,3.99,'Jeff Collins','2020-05-21 09:10:23'),
    (1110000179,3.99,'Jeff Collins','2020-05-21 09:10:32'),
    (1110000180,7.99,'Jeff Collins','2020-05-21 09:11:14'),
    (1110000181,7.99,'Jeff Collins','2020-05-21 09:11:32'),
    (1110000182,7.99,'Jeff Collins','2020-05-21 09:12:43'),
    (1110000183,7.99,'Jeff Collins','2020-05-21 09:13:03'),
    (1110000184,7.99,'Jeff Collins','2020-05-21 09:15:13'),
    (1110000185,7.99,'Jeff Collins','2020-05-21 09:19:03'),
    (1110000186,7.99,'Jeff Collins','2020-05-21 09:19:27'),
    (1110000187,7.99,'Jeff Collins','2020-05-21 09:19:54'),
    (1110000188,7.99,'Jeff Collins','2020-05-21 09:20:23'),
    (1110000189,7.99,'Jeff Collins','2020-05-21 09:20:32'),
    (1110000190,7.99,'Jeff Collins','2020-05-21 09:22:14'),
    (1110000191,7.99,'Jeff Collins','2020-05-21 09:22:32'),
    (1110000192,7.99,'Jeff Collins','2020-05-21 09:22:43'),
    (1110000193,7.99,'Jeff Collins','2020-05-21 09:23:03'),
    (1110000194,7.99,'Jeff Collins','2020-05-21 09:23:13'),
    (1110000195,3.99,'Jeff Collins','2020-05-21 09:25:03'),
    (1110000196,3.99,'Jeff Collins','2020-05-21 09:25:27'),
    (1110000197,3.99,'Jeff Collins','2020-05-21 09:26:54'),
    (1110000198,3.99,'Jeff Collins','2020-05-21 09:30:23'),
    (1110000199,3.99,'Jeff Collins','2020-05-21 09:30:32');
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* ADD GENERAL ITEM LIST TO LIST OF INVENTORY ITEMS */
INSERT INTO inventory_item
(
    SQU,purchase_price,logged_by,logged_date
) 
VALUES
    (1100000000,3.99,'Jess Systellia','2020-05-07 06:20:13'),-- FIRST SHIPMENT
    (1100000001,3.99,'Jess Systellia','2020-05-07 06:21:25'),
    (1100000002,3.99,'Jess Systellia','2020-05-07 06:21:43'),
    (1100000003,3.99,'Jess Systellia','2020-05-07 06:22:22'),
    (1100000004,3.99,'Jess Systellia','2020-05-07 06:22:33'),
    (1100000005,3.99,'Jess Systellia','2020-05-07 06:23:03'),
    (1100000006,3.99,'Jess Systellia','2020-05-07 06:23:24'),
    (1100000007,3.99,'Jess Systellia','2020-05-07 06:23:28'),
    (1100000008,3.99,'Jess Systellia','2020-05-07 06:24:33'),
    (1100000009,3.99,'Jess Systellia','2020-05-07 06:25:56'),
    (1100000010,3.99,'Jess Systellia','2020-05-07 06:26:14'),
    (1100000011,3.99,'Jess Systellia','2020-05-07 06:26:32'),
    (1100000012,3.99,'Jess Systellia','2020-05-07 06:26:43'),
    (1100000013,3.99,'Jess Systellia','2020-05-07 06:27:03'),
    (1100000014,3.99,'Jess Systellia','2020-05-07 06:28:13'),
    (1100000015,3.99,'Jess Systellia','2020-05-07 06:29:03'),
    (1100000016,3.99,'Jess Systellia','2020-05-07 06:29:27'),
    (1100000017,3.99,'Jess Systellia','2020-05-07 06:29:54'),
    (1100000018,3.99,'Jess Systellia','2020-05-07 06:30:23'),
    (1100000019,3.99,'Jess Systellia','2020-05-07 06:30:32'),
    (1100000020,3.99,'Jess Systellia','2020-05-07 07:20:13'),
    (1100000021,3.99,'Jess Systellia','2020-05-07 07:21:25'),
    (1100000022,3.99,'Jess Systellia','2020-05-07 07:21:43'),
    (1100000023,3.99,'Jess Systellia','2020-05-07 07:22:22'),
    (1100000024,3.99,'Jess Systellia','2020-05-07 07:22:33'),
    (1100000025,3.99,'Jess Systellia','2020-05-07 07:23:03'),
    (1100000026,3.99,'Jess Systellia','2020-05-07 07:23:24'),
    (1100000027,3.99,'Jess Systellia','2020-05-07 07:23:28'),
    (1100000028,3.99,'Jess Systellia','2020-05-07 07:24:33'),
    (1100000029,3.99,'Jess Systellia','2020-05-07 07:25:56'),
    (1100000030,3.99,'Jess Systellia','2020-05-07 07:26:14'),
    (1100000031,3.99,'Jess Systellia','2020-05-07 07:26:32'),
    (1100000032,3.99,'Jess Systellia','2020-05-07 07:26:43'),
    (1100000033,3.99,'Jess Systellia','2020-05-07 07:27:03'),
    (1100000034,3.99,'Jess Systellia','2020-05-07 07:28:13'),
    (1100000035,3.99,'Jess Systellia','2020-05-07 07:29:03'),
    (1100000036,3.99,'Jess Systellia','2020-05-07 07:29:27'),
    (1100000037,3.99,'Jess Systellia','2020-05-07 07:29:54'),
    (1100000038,3.99,'Jess Systellia','2020-05-07 07:30:23'),
    (1100000039,3.99,'Jess Systellia','2020-05-07 07:30:32'),
    (1100000040,3.99,'Jess Systellia','2020-05-07 07:26:14'),
    (1100000041,3.99,'Jess Systellia','2020-05-07 07:26:32'),
    (1100000042,3.99,'Jess Systellia','2020-05-07 07:26:43'),
    (1100000043,3.99,'Jess Systellia','2020-05-07 07:27:03'),
    (1100000044,3.99,'Jess Systellia','2020-05-07 07:28:13'),
    (1100000045,3.99,'Jess Systellia','2020-05-07 07:29:03'),
    (1100000046,3.99,'Jess Systellia','2020-05-07 07:29:27'),
    (1100000047,3.99,'Jess Systellia','2020-05-07 07:29:54'),
    (1100000048,3.99,'Jess Systellia','2020-05-07 07:30:23'),
    (1100000049,3.99,'Jess Systellia','2020-05-07 07:30:32'),
    (1100000050,3.99,'Jess Systellia','2020-05-07 07:40:13'),
    (1100000051,3.99,'Jess Systellia','2020-05-07 07:41:25'),
    (1100000052,3.99,'Jess Systellia','2020-05-07 07:41:43'),
    (1100000053,3.99,'Jess Systellia','2020-05-07 07:42:22'),
    (1100000054,3.99,'Jess Systellia','2020-05-07 07:42:33'),
    (1100000055,3.99,'Jess Systellia','2020-05-07 07:43:03'),
    (1100000056,3.99,'Jess Systellia','2020-05-07 07:43:24'),
    (1100000057,3.99,'Jess Systellia','2020-05-07 07:43:28'),
    (1100000058,3.99,'Jess Systellia','2020-05-07 07:44:33'),
    (1100000059,3.99,'Jess Systellia','2020-05-07 07:45:56');
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/*DEFINE DRY INGREDIENTS WITHIN INVENTORY LIST*/
INSERT INTO dry_ingredient
    SELECT i.SQU,i.inventoryID FROM inventory_item i
    WHERE i.SQU LIKE '101%'
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/*DEFINE DRY INGREDIENTS WITHIN INVENTORY LIST*/
INSERT INTO wet_ingredient
    SELECT i.SQU,i.inventoryID FROM inventory_item i
    WHERE i.SQU LIKE '111%'
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/*************************************************SHIPMENT ONE****************************************************************/
/*****************************************************************************************************************************/

/* DRY INGREDIENTS */

/*****************************************************************************************************************************/
/* INSERT BEANS INTO DRY INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.bean ON

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cafe Blanc','Sicily, Italy','Light','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000010 AND d.SQU >= 1010000000

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cafe Espresso','Guatemala, Central America','Dark','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000020 AND d.SQU >= 1010000010

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cafe Americano','Brazil, South America','Medium','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000030 AND d.SQU >= 1010000020

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Espresso Blend','Peru, South America','Dark','5lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000035 AND d.SQU >= 1010000030

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cold Brew Blend','Congo, Africa','Dark','5lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000040 AND d.SQU >= 1010000035

SET IDENTITY_INSERT dbo.bean OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT TEA INTO DRY INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.tea ON
        
        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'White Tea Needle','Fujian Province, China','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000050 AND d.SQU >= 1010000040

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Chamomile Flower','Tipperary, Ireland','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000060 AND d.SQU >= 1010000050

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Chai Spice','Assam, India','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000070 AND d.SQU >= 1010000060

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Lavender Flower','Washington, United States','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000080 AND d.SQU >= 1010000070

SET IDENTITY_INSERT dbo.tea OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT SUGAR INTO DRY INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.box_of_sugar ON
        
        INSERT INTO box_of_sugar(SQU,type,count,dry_ingredientID)
            SELECT d.SQU,'Splenda',750,d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000085 AND d.SQU >= 1010000080

        INSERT INTO box_of_sugar(SQU,type,count,dry_ingredientID)
            SELECT d.SQU,'Equal',750,d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000090 AND d.SQU >= 1010000085

        INSERT INTO box_of_sugar(SQU,type,count,dry_ingredientID)
            SELECT d.SQU,'Truvia',750,d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000095 AND d.SQU >= 1010000090

        INSERT INTO box_of_sugar(SQU,type,count,dry_ingredientID)
            SELECT d.SQU,'Raw',750,d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000100 AND d.SQU >= 1010000095

        INSERT INTO box_of_sugar(SQU,type,count,dry_ingredientID)
            SELECT d.SQU,'Domino',750,d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000105 AND d.SQU >= 1010000100

SET IDENTITY_INSERT dbo.box_of_sugar OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT SUGAR INTO DRY INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.seasoning ON
        
        INSERT INTO seasoning(SQU,name,size,dry_ingredientID)
            SELECT d.SQU,'Chocolate Powder','8oz.',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000110 AND d.SQU >= 1010000105

        INSERT INTO seasoning(SQU,name,size,dry_ingredientID)
            SELECT d.SQU,'Cinnamon Powder','8oz.',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000115 AND d.SQU >= 1010000110

        INSERT INTO seasoning(SQU,name,size,dry_ingredientID)
            SELECT d.SQU,'Nutmeg Powder','4oz.',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000120 AND d.SQU >= 1010000115

        INSERT INTO seasoning(SQU,name,size,dry_ingredientID)
            SELECT d.SQU,'Cinnamon Dolce Powder','4oz.',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000125 AND d.SQU >= 1010000120

SET IDENTITY_INSERT dbo.seasoning OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* CREATE TIME STAMPS FOR TEA BEAN AND SUGAR */
INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-09-01','14 days'
    FROM inventory_item i WHERE i.SQU < 1010000040

INSERT INTO time_stamp
    SELECT i.inventoryID,'2022-09-01','180 days'
    FROM inventory_item i WHERE i.SQU >= 1010000040 AND i.SQU < 1010000080

INSERT INTO time_stamp
    SELECT i.inventoryID,'2025-09-01','N/A'
    FROM inventory_item i WHERE i.SQU >= 1010000080 AND i.SQU < 1010000105

INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-09-01','14 days'
    FROM inventory_item i WHERE i.SQU >= 1010000105 AND i.SQU < 1010000110

INSERT INTO time_stamp
    SELECT i.inventoryID,'2023-05-01','N/A'
    FROM inventory_item i WHERE i.SQU >= 1010000110 AND i.SQU < 1010000125
/*****************************************************************************************************************************/

/* WET INGREDIENTS */

/*****************************************************************************************************************************/
/* INSERT MILK INTO WET INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.milk ON

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, '2%','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000008

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, '0%','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000016 AND w.SQU >= 1110000008

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Half and Half','.5Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000024 AND w.SQU >= 1110000016

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Almond','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000032 AND w.SQU >= 1110000024

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Oat','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000040 AND w.SQU >= 1110000032

SET IDENTITY_INSERT dbo.milk OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT JUICE INTO WET INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.juice ON

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Orange','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000045 AND w.SQU >= 1110000040

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Apple','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000050 AND w.SQU >= 1110000045

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Grape','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000055 AND w.SQU >= 1110000050

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Passion','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000060 AND w.SQU >= 1110000055

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Hibiscus','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000065 AND w.SQU >= 1110000060

SET IDENTITY_INSERT dbo.juice OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT SYRUP INTO WET INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.syrup ON

        INSERT INTO syrup(SQU,type,size,wet_ingredientID)
            SELECT w.inventoryID, 'Vanilla','.5Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000075 AND w.SQU >= 1110000065

        INSERT INTO syrup(SQU,type,size,wet_ingredientID)
            SELECT w.inventoryID, 'Caramel','.5Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000085 AND w.SQU >= 1110000075

        INSERT INTO syrup(SQU,type,size,wet_ingredientID)
            SELECT w.inventoryID, 'Cinnamon Dolce','.5Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000095 AND w.SQU >= 1110000085

        INSERT INTO syrup(SQU,type,size,wet_ingredientID)
            SELECT w.inventoryID, 'Hazelnut','.5Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000105 AND w.SQU >= 1110000095

        INSERT INTO syrup(SQU,type,size,wet_ingredientID)
            SELECT w.inventoryID, 'Cherry','.5Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000110 AND w.SQU >= 1110000105

        INSERT INTO syrup(SQU,type,size,wet_ingredientID)
            SELECT w.inventoryID, 'Mocha','.5Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000115 AND w.SQU >= 1110000110

SET IDENTITY_INSERT dbo.syrup OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* CREATE TIME STAMPS FOR MILK JUICE AND SYRUP */
INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-05-14','5 days'
    FROM inventory_item i WHERE i.SQU >= 1110000000 AND i.SQU < 1110000024

INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-11-07','7 days'
    FROM inventory_item i WHERE i.SQU >= 1110000024 AND i.SQU < 1110000040

INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-11-07','7 days'
    FROM inventory_item i WHERE i.SQU >= 1110000040 AND i.SQU < 1110000065

INSERT INTO time_stamp
    SELECT i.inventoryID,'2022-05-01','30 days'
    FROM inventory_item i WHERE i.SQU >= 1110000065 AND i.SQU < 1110000115
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT CUPS INTO INVENTORY LIST */
SET IDENTITY_INSERT dbo.box_of_cups ON

        INSERT INTO box_of_cups(SQU,num_of_cups,temperature,size,inventoryID)
            SELECT i.SQU,500,'Hot','Large',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000005 AND i.SQU >= 1100000000

        INSERT INTO box_of_cups(SQU,num_of_cups,temperature,size,inventoryID)
            SELECT i.SQU,500,'Hot','Medium',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000010 AND i.SQU >= 1100000005

        INSERT INTO box_of_cups(SQU,num_of_cups,temperature,size,inventoryID)
            SELECT i.SQU,500,'Hot','Small',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000015 AND i.SQU >= 1100000010

        INSERT INTO box_of_cups(SQU,num_of_cups,temperature,size,inventoryID)
            SELECT i.SQU,500,'Cold','Large',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000020 AND i.SQU >= 1100000015

        INSERT INTO box_of_cups(SQU,num_of_cups,temperature,size,inventoryID)
            SELECT i.SQU,500,'Cold','Medium',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000025 AND i.SQU >= 1100000020

        INSERT INTO box_of_cups(SQU,num_of_cups,temperature,size,inventoryID)
            SELECT i.SQU,500,'Cold','Small',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000030 AND i.SQU >= 1100000025

SET IDENTITY_INSERT dbo.box_of_cups OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT LIDS INTO INVENTORY LIST */
SET IDENTITY_INSERT dbo.box_of_lids ON

        INSERT INTO box_of_lids(SQU,num_of_lids,temperature,size,inventoryID)
            SELECT i.SQU,500,'Hot','Large',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000005 AND i.SQU >= 1100000000

        INSERT INTO box_of_lids(SQU,num_of_lids,temperature,size,inventoryID)
            SELECT i.SQU,500,'Hot','Medium',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000010 AND i.SQU >= 1100000005

        INSERT INTO box_of_lids(SQU,num_of_lids,temperature,size,inventoryID)
            SELECT i.SQU,500,'Hot','Small',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000015 AND i.SQU >= 1100000010

        INSERT INTO box_of_lids(SQU,num_of_lids,temperature,size,inventoryID)
            SELECT i.SQU,500,'Cold','Large',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000020 AND i.SQU >= 1100000015

        INSERT INTO box_of_lids(SQU,num_of_lids,temperature,size,inventoryID)
            SELECT i.SQU,500,'Cold','Medium',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000025 AND i.SQU >= 1100000020

        INSERT INTO box_of_lids(SQU,num_of_lids,temperature,size,inventoryID)
            SELECT i.SQU,500,'Cold','Small',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000030 AND i.SQU >= 1100000025

SET IDENTITY_INSERT dbo.box_of_lids OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT LIDS INTO INVENTORY LIST */
SET IDENTITY_INSERT dbo.box_of_straws ON

        INSERT INTO box_of_straws(SQU,num_of_straws,size,inventoryID)
            SELECT i.SQU,750,'Large',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000010 AND i.SQU >= 1100000000

        INSERT INTO box_of_straws(SQU,num_of_straws,size,inventoryID)
            SELECT i.SQU,750,'Medium',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000020 AND i.SQU >= 1100000010

        INSERT INTO box_of_straws(SQU,num_of_straws,size,inventoryID)
            SELECT i.SQU,750,'Small',i.inventoryID
            FROM inventory_item i WHERE i.SQU < 1100000030 AND i.SQU >= 1100000020

SET IDENTITY_INSERT dbo.box_of_straws OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/*************************************************SHIPMENT TWO****************************************************************/
/*****************************************************************************************************************************/


/* SHIPMENT TWO DRY*/

/*****************************************************************************************************************************/
/* INSERT BEANS INTO DRY INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.bean ON

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cafe Blanc','Sicily, Italy','Light','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000130 AND d.SQU >= 1010000125 

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cafe Espresso','Guatemala, Central America','Dark','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000135 AND d.SQU >= 1010000130 

        INSERT INTO bean(SQU,name,source,roast,bag_size,dry_ingredientID)
            SELECT d.SQU,'Cafe Americano','Brazil, South America','Medium','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000140 AND d.SQU >= 1010000135 

SET IDENTITY_INSERT dbo.bean OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT TEA INTO DRY INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.tea ON
        
        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'White Tea Needle','Fujian Province, China','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000144 AND d.SQU >= 1010000140

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Chamomile Flower','Tipperary, Ireland','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000148 AND d.SQU >= 1010000144

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Chai Spice','Assam, India','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000152 AND d.SQU >= 1010000148

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Lavender Flower','Washington, United States','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000156 AND d.SQU >= 1010000152

        INSERT INTO tea(SQU,name,source,bag_size,dry_ingredientID)
            SELECT d.SQU,'Green Tea','Uji, Japan','1lb',d.dry_ingredientID
            FROM dry_ingredient d WHERE d.SQU < 1010000160 AND d.SQU >= 1010000156

SET IDENTITY_INSERT dbo.tea OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* CREATE TIME STAMPS FOR TEA AND BEAN */
INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-09-08','14 days'
    FROM inventory_item i WHERE i.SQU < 1010000140 AND i.SQU >= 1010000125

INSERT INTO time_stamp
    SELECT i.inventoryID,'2022-09-08','180 days'
    FROM inventory_item i WHERE i.SQU < 1010000175 AND i.SQU >= 1010000140
/*****************************************************************************************************************************/


/* SHIPMENT TWO WET*/


/*****************************************************************************************************************************/
/* INSERT MILK INTO WET INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.milk ON

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, '2%','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000123 AND w.SQU >= 1110000115

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, '0%','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000131 AND w.SQU >= 1110000123

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Half and Half','.5Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000139 AND w.SQU >= 1110000131

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Almond','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000147 AND w.SQU >= 1110000139

        INSERT INTO milk(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Oat','1Gal', w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000155 AND w.SQU >= 1110000147

SET IDENTITY_INSERT dbo.milk OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* INSERT JUICE INTO WET INGREDIENTS LIST */
SET IDENTITY_INSERT dbo.juice ON

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Orange','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000158 AND w.SQU >= 1110000155

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Apple','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000161 AND w.SQU >= 1110000158

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Grape','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000164 AND w.SQU >= 1110000161

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Passion','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000167 AND w.SQU >= 1110000164

        INSERT INTO juice(SQU,type,size,wet_ingredientID)
            SELECT w.SQU, 'Hibiscus','1Gal',w.wet_ingredientID
            FROM wet_ingredient w WHERE w.SQU < 1110000170 AND w.SQU >= 1110000167

SET IDENTITY_INSERT dbo.juice OFF
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* CREATE TIME STAMPS FOR MILK JUICE AND SYRUP */
INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-05-07','5 days'
    FROM inventory_item i WHERE i.SQU >= 1110000115 AND i.SQU < 1110000139

INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-11-14','7 days'
    FROM inventory_item i WHERE i.SQU >= 1110000139 AND i.SQU < 1110000155

INSERT INTO time_stamp
    SELECT i.inventoryID,'2020-11-14','7 days'
    FROM inventory_item i WHERE i.SQU >= 1110000155 AND i.SQU < 1110000169
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/********************************************************SALES****************************************************************/
/*****************************************************************************************************************************/


/*****************************************************************************************************************************/
/* CREATE LIST OF INVOICES */
INSERT INTO invoice(SQU,logged_date,logged_by,sold) VALUES
    (1010000000,'2020-05-07','Jeff Collins',1), 
    (1010000001,'2020-05-07','Jeff Collins',0),
    (1010000010,'2020-05-07','Jeff Collins',1),
    (1010000011,'2020-05-07','Jeff Collins',0),
    (1010000020,'2020-05-07','Jeff Collins',1),
    (1010000022,'2020-05-07','Jeff Collins',0),
    (1010000030,'2020-05-07','Jeff Collins',0),
    (1010000035,'2020-05-07','Jeff Collins',0),
    (1010000040,'2020-05-07','Jeff Collins',1),
    (1010000041,'2020-05-07','Jeff Collins',0),
    (1010000050,'2020-05-07','Jeff Collins',0),
    (1010000051,'2020-05-07','Jeff Collins',1),
    (1010000060,'2020-05-07','Jeff Collins',0),
    (1010000061,'2020-05-07','Jeff Collins',1),
    (1010000070,'2020-05-07','Jeff Collins',0),
    (1010000071,'2020-05-07','Jeff Collins',1),
    (1010000080,'2020-05-07','Jeff Collins',0),
    (1010000090,'2020-05-07','Jeff Collins',0),
    (1110000000,'2020-05-07','Jeff Collins',0),
    (1110000008,'2020-05-07','Jeff Collins',0),
    (1110000016,'2020-05-07','Jeff Collins',0),
    (1110000024,'2020-05-07','Jeff Collins',0),
    (1110000025,'2020-05-07','Jeff Collins',0),
    (1110000032,'2020-05-07','Georgia Thomas',0),
    (1110000040,'2020-05-07','Georgia Thomas',0),
    (1110000045,'2020-05-07','Georgia Thomas',0),
    (1110000050,'2020-05-07','Georgia Thomas',0),
    (1110000055,'2020-05-07','Georgia Thomas',0),
    (1110000060,'2020-05-07','Georgia Thomas',0),
    (1110000070,'2020-05-07','Georgia Thomas',0),
    (1010000002,'2020-05-08','Georgia Thomas',0), 
    (1010000012,'2020-05-08','Georgia Thomas',1),
    (1010000023,'2020-05-08','Georgia Thomas',1),
    (1010000042,'2020-05-08','Georgia Thomas',1),
    (1010000052,'2020-05-08','Georgia Thomas',1),
    (1010000053,'2020-05-08','Georgia Thomas',0),
    (1010000072,'2020-05-08','Georgia Thomas',0),
    (1010000095,'2020-05-08','Jess Systellia',0),
    (1010000100,'2020-05-08','Jess Systellia',0),
    (1010000101,'2020-05-08','Jess Systellia',0),
    (1110000001,'2020-05-08','Jess Systellia',0),
    (1110000009,'2020-05-08','Jess Systellia',0),
    (1110000017,'2020-05-08','Jess Systellia',0),
    (1110000026,'2020-05-08','Jess Systellia',0),
    (1110000033,'2020-05-08','Jess Systellia',0),
    (1110000046,'2020-05-08','Jess Systellia',0),
    (1110000051,'2020-05-08','Jess Systellia',0),
    (1110000056,'2020-05-08','Jess Systellia',0),
    (1110000075,'2020-05-08','Jess Systellia',0),
    (1110000081,'2020-05-08','Jess Systellia',0),
    (1010000003,'2020-05-09','Georgia Thomas',0),
    (1010000004,'2020-05-09','Georgia Thomas',1),
    (1010000013,'2020-05-09','Georgia Thomas',1),
    (1010000043,'2020-05-09','Georgia Thomas',0),
    (1010000073,'2020-05-09','Georgia Thomas',0),
    (1110000002,'2020-05-09','Georgia Thomas',0),
    (1110000003,'2020-05-09','Georgia Thomas',0),
    (1110000010,'2020-05-09','Georgia Thomas',0),
    (1110000018,'2020-05-09','Georgia Thomas',0),
    (1110000027,'2020-05-09','Georgia Thomas',0),
    (1110000047,'2020-05-09','Georgia Thomas',0),
    (1110000057,'2020-05-09','Georgia Thomas',0),
    (1110000061,'2020-05-09','Georgia Thomas',1),
    (1110000065,'2020-05-09','Georgia Thomas',0),
    (1110000086,'2020-05-09','Georgia Thomas',0),
    (1010000014,'2020-05-10','Jess Systellia',0),
    (1010000015,'2020-05-10','Jess Systellia',1),
    (1010000024,'2020-05-10','Jess Systellia',1),
    (1010000025,'2020-05-10','Jess Systellia',0),
    (1010000021,'2020-05-10','Jess Systellia',1),
    (1010000036,'2020-05-10','Jess Systellia',0),
    (1010000044,'2020-05-10','Jess Systellia',0),
    (1010000062,'2020-05-10','Jess Systellia',1),
    (1010000075,'2020-05-10','Jess Systellia',0),
    (1010000063,'2020-05-10','Jess Systellia',0),
    (1110000004,'2020-05-10','Jess Systellia',0),
    (1110000011,'2020-05-10','Jess Systellia',0),
    (1110000019,'2020-05-10','Jess Systellia',0),
    (1110000028,'2020-05-10','Jess Systellia',0),
    (1110000034,'2020-05-10','Jess Systellia',0),
    (1110000035,'2020-05-10','Jess Systellia',0),
    (1110000041,'2020-05-10','Jess Systellia',0),
    (1110000048,'2020-05-10','Jess Systellia',0),
    (1110000058,'2020-05-10','Jess Systellia',0),
    (1110000062,'2020-05-10','Jess Systellia',0),
    (1110000090,'2020-05-10','Jess Systellia',0),
    (1110000097,'2020-05-10','Jess Systellia',0),
    (1010000005,'2020-05-11','Jeff Collins',0),
    (1010000016,'2020-05-11','Jeff Collins',1),
    (1010000026,'2020-05-11','Jeff Collins',1),
    (1010000027,'2020-05-11','Jeff Collins',0),
    (1010000054,'2020-05-11','Jeff Collins',0),
    (1010000064,'2020-05-11','Jeff Collins',0),
    (1010000076,'2020-05-11','Jeff Collins',0),
    (1010000081,'2020-05-11','Jeff Collins',0),
    (1010000088,'2020-05-11','Jeff Collins',0),
    (1010000091,'2020-05-11','Jeff Collins',0),
    (1110000005,'2020-05-11','Jeff Collins',0),
    (1110000012,'2020-05-11','Jeff Collins',0),
    (1110000020,'2020-05-11','Jeff Collins',0),
    (1110000029,'2020-05-11','Jeff Collins',0),
    (1110000036,'2020-05-11','Jeff Collins',0),
    (1110000066,'2020-05-11','Jeff Collins',0);
/*****************************************************************************************************************************/
 