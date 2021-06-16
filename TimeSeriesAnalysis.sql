-- Creating a new column using If statement
/* SELECT *,
	IF(Sales_month = '(S)', 'Supressed', 'null') AS reason_for_null
FROM world.marketsales2016;
*/

/* SELECT *,
	IF(Sales_month = '(S)', 'Supressed', 'null') AS reason_for_null
FROM world.marketsales2017; */ 

/* SELECT *,
	CASE Sales_month
		WHEN  'Apr. 2017' THEN  '2017-04-01'
        WHEN 'Jan. 2017' THEN '2017-01-01'
        WHEN  'Feb. 2017' THEN '2017-02-01'
        WHEN  'Mar. 2017' THEN '2017-03-01'
        WHEN  'May-17' THEN  '2017-05-01'
        WHEN  'Jun. 2017' THEN '2017-06-01'
        WHEN  'Jul. 2017' THEN  '2017-07-01'
        WHEN  'Aug. 2017' THEN  '2017-08-01'
        WHEN  'Sep. 2017' THEN  '2017-09-01'
        WHEN  'Oct. 2017' THEN  '2017-10-01'
        WHEN  'Nov. 2017' THEN  '2017-11-01'
        WHEN  'Dec. 2017' THEN  '2017-12-01'
        END AS Sales_month,
			IF(Sales_month = '(S)', 'Supressed', 'null') AS reason_for_null
	FROM world.marketsales2017;
    

    
ALTER TABLE world.marketsales2017
DROP COLUMN Sales_month;
 */
-- SELECT * FROM world.marketsales2018;


/*SELECT  Sales, 'NAICS Code', 'Kind of Business',
	CASE Sales_month
		WHEN  'Apr. 2018' THEN  '2018-04-01'
        WHEN 'Jan. 2018' THEN '2018-01-01'
        WHEN  'Feb. 2018' THEN '2018-02-01'
        WHEN  'Mar. 2018' THEN '2018-03-01'
        WHEN  'May 2018' THEN  '2018-05-01'
        WHEN  'Jun. 2018' THEN '2018-06-01'
        WHEN  'Jul. 2018' THEN  '2018-07-01'
        WHEN  'Aug. 2018' THEN  '2018-08-01'
        WHEN  'Sep. 2018' THEN  '2018-09-01'
        WHEN  'Oct. 2018' THEN  '2018-10-01'
        WHEN  'Nov. 2018' THEN  '2018-11-01'
        WHEN  'Dec. 2018' THEN  '2018-12-01'
        END AS Months, 
        IF(Sales = '(S)', 'Supressed', 'null') AS reason_for_null
FROM world.marketsales2018; */




/* SELECT  Sales, 'NAICS Code', 'Kind of Business',
	CASE Sales_month
		WHEN  'Apr. 2019' THEN  '2019-04-01'
        WHEN 'Jan. 2019' THEN '2019-01-01'
        WHEN  'Feb. 2019' THEN '2019-02-01'
        WHEN  'Mar. 2019' THEN '2019-03-01'
        WHEN  'May 2019' THEN  '2019-05-01'
        WHEN  'Jun. 2019' THEN '2019-06-01'
        WHEN  'Jul. 2019' THEN  '2019-07-01'
        WHEN  'Aug. 2019' THEN  '2019-08-01'
        WHEN  'Sep. 2019' THEN  '2019-09-01'
        WHEN  'Oct. 2019' THEN  '2019-10-01'
        WHEN  'Nov. 2019' THEN  '2019-11-01'
        WHEN  'Dec. 2019' THEN  '2019-12-01'
        END AS Months, 
        IF(Sales = '(S)', 'Supressed', 'null') AS reason_for_null
FROM world.marketsales2019; */

/* UPDATE world.marketsales2020
SET Sales_month =  
	CASE 
		WHEN  Sales_month ='Apr. 2020' THEN  '2020-04-01'
        WHEN Sales_month = 'Jan. 2020' THEN '2020-01-01'
        WHEN Sales_month = 'Feb. 2020' THEN '2020-02-01'
        WHEN Sales_month = 'Mar. 2020' THEN '2020-03-01'
        WHEN Sales_month = 'May 2020' THEN  '2020-05-01'
        WHEN Sales_month = 'Jun. 2020' THEN '2020-06-01'
        WHEN Sales_month = 'Jul. 2020' THEN  '2020-07-01'
        WHEN Sales_month = 'Aug. 2020' THEN  '2020-08-01'
        WHEN Sales_month = 'Sep. 2020' THEN  '2020-09-01'
        WHEN Sales_month = 'Oct. 2020' THEN  '2020-10-01'
        WHEN Sales_month = 'Nov. 2020' THEN  '2020-11-01'
        WHEN Sales_month = 'Dec. 2020' THEN  '2020-12-01'
        END
WHERE Sales_month IN ('Apr. 2020','Jan. 2020', 'Feb. 2020','Mar. 2020','May 2020', 'Jun. 2020',
                       'Jul. 2020', 'Aug. 2020','Sep. 2020', 'Oct. 2020', 'Nov. 2020','Dec. 2020');
*/

-- SELECT * FROM world.marketsales2020;

-- Simple Trends 
SELECT Sales_month, Kind_of_Business, sum(Sales) AS Sum_Sales
FROM world.marketsales2020
WHERE kind_of_Business = 'Retail and food services sales, total'
GROUP BY Sales_month
ORDER BY Sales_month;

SELECT YEAR(Sales_month) as sales_year,
sum(Sales) as sales
FROM world.marketsales2020
WHERE kind_of_business = 'Retail and food services sales, total'
GROUP BY 1
ORDER BY 1;

-- Comparing other components in the business variable
SELECT Sales_month,
sum(Sales) AS Sales
FROM world.marketsales2020
WHERE kind_of_business IN ('Book stores', 'Sporting good stores','Hobby,toy, and game stores')
GROUP BY Sales_month, Sales
ORDER BY Sales_month, Sales;

SELECT sales_month,
kind_of_business,
sales
FROM world.marketsales2020
WHERE kind_of_business IN ('Men''s clothing stores','Women''s clothing stores')
ORDER BY 1,2;

SELECT YEAR(sales_month) as sales_year,
Kind_of_Business,
sum(Sales) as Sales
FROM world.marketsales2020
WHERE kind_of_business IN ('Men''s clothing stores','Women''s clothing stores')
GROUP BY 1,2;

SELECT YEAR(sales_month) as sales_year,
sum(CASE WHEN Kind_of_Business = 'Women''s clothing stores' THEN Sales END) AS women_sales,
sum(CASE WHEN Kind_of_Business = 'Men''s clothing stores' THEN Sales END) AS Men_sales
FROM world.marketsales2020
WHERE kind_of_Business IN ('Men''s clothing stores', 'Women''s clothing stores')
GROUP BY 1
ORDER BY 1;

-- sum of sales for each category in Kind of Business
SELECT Kind_of_Business, 
       YEAR(Sales_month) AS Sales_Year, 
       sum(Sales) AS Sales
FROM world.marketsales2020
GROUP BY Kind_of_Business
ORDER BY Sales DESC;

-- Using Subquery to get women clothing and men clothing details
SELECT Sales_year,
women_sales - Men_sales AS Women, -- Men sales are null so it gives null 
Men_sales - women_sales AS Men
FROM 
(
	SELECT YEAR(sales_month) as sales_year,
	sum(CASE WHEN Kind_of_Business = 'Women''s clothing stores' THEN Sales END) AS women_sales,
	sum(CASE WHEN Kind_of_Business = 'Men''s clothing stores' THEN Sales END) AS Men_sales
	FROM world.marketsales2020
	WHERE kind_of_Business IN ('Men''s clothing stores', 'Women''s clothing stores')
    AND sales_month <= '2020-12-01'
	GROUP BY 1
) a
ORDER BY 1;

-- Percent of total calculations


























