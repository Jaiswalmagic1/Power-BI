-- Create new database
create database cancer;

-- Use cancer database.

use cancer;

-- Import CSV to Cancer.

-- Show table

SELECT * FROM cancer;

-- 1.	Total Cancer Cases

SELECT COUNT(*) AS Total_Cases FROM cancer;

-- 2.	Total Cancer Cases (Current Year - 2024)
SELECT COUNT(*) AS total_cases_for_current_year FROM cancer WHERE YEAR = 2024;

-- 3.	Year-on-Year Growth Rate
WITH DATA AS 
(SELECT Year,COUNT(*) AS CY_Cases, 
LAG (COUNT(*), 1) OVER(ORDER BY YEAR) AS PY_Cases
FROM cancer
GROUP BY YEAR)

SELECT *,  CONCAT(
		CASE 
			WHEN PY_Cases IS NULL THEN 0 
			ELSE CAST(ROUND(((CY_Cases-PY_Cases)*1.0/PY_Cases)*100,2) AS DECIMAL(10,2))
		END
,'%') AS YoY_Growth_Rate
FROM DATA;


-- 4.	Top Affected Country
SELECT TOP 1 Country_Region, COUNT(*) AS Num_Of_Cases FROM CANCER
GROUP BY Country_Region
ORDER BY COUNT(*) DESC;

-- 5.	Most Common Cancer Type
SELECT TOP 1 cancer_type, count(*) AS Num_Of_Cases FROM cancer
GROUP BY cancer_type
ORDER BY count(*) DESC;


-- 6.	Male vs Female Ratio
SELECT gender, count(*) as num_of_cases,
CONCAT(CAST(count(*)*1.0/(SELECT COUNT(*) FROM cancer) AS DECIMAL(10,2)),'%') AS '%age of total'
FROM cancer
GROUP BY gender;

-- 7.	Average Cases per Country
SELECT count(*)/(select count(distinct Country_Region) FROM cancer) AS Avg_Of_Cases 
FROM cancer;

-- 8.	Most Affected Age Group
WITH age_class AS
(SELECT Patient_id, age,
CASE
	WHEN age>10 AND age<21 THEN '10-20'
	WHEN age>20 AND age<31 THEN '21-30'
	WHEN age>30 AND age<41 THEN '31-40'
	WHEN age>40 AND age<51 THEN '41-50'
	WHEN age>50 AND age<61 THEN '51-60'
	WHEN age>60 AND age<71 THEN '61-70'
	WHEN age>70 AND age<81 THEN '71-80'
	WHEN age>80 AND age<91 THEN '81-90'
	ELSE null
END AS 'age_group'
FROM cancer) 

SELECT TOP 1 age_group as Most_affected_age_group, count(*) AS num_of_cases FROM age_class
GROUP BY age_group
ORDER BY count(*) DESC;


-- 9. Average Treatment Cost
SELECT CAST(AVG(Treatment_Cost_USD) AS DECIMAL(10,2)) as AVG_Treatment_Cost FROM cancer;


-- 10.	Average Survival Years
SELECT CAST(AVG(Survival_Years) AS DECIMAL(10,2)) as AVG_Survival_Years FROM cancer;


-- 11.	Severity Risk Index
SELECT CAST(AVG(Target_Severity_Score) AS DECIMAL(10,2)) as AVG_Target_Severity_Score FROM cancer;


-- 12.	Yearly Cancer Trend
SELECT Year, COUNT(Patient_ID) AS num_of_cases FROM cancer GROUP BY Year ORDER BY Year;


-- 13.	Cancer Cases by Country
SELECT Country_Region, COUNT(Patient_ID) AS num_of_cases FROM cancer GROUP BY Country_Region ORDER BY Country_Region;


-- 14.	Cancer Cases by Type
SELECT Cancer_Type, COUNT(Patient_ID) AS num_of_cases FROM cancer GROUP BY Cancer_Type ORDER BY Cancer_Type;


-- 15.	Cancer Cases by Gender
SELECT Gender, COUNT(Patient_ID) AS num_of_cases FROM cancer GROUP BY Gender ORDER BY Gender;


-- 16.	Cancer Cases by Age Group
WITH age_class AS
(SELECT Patient_id, age,
CASE
	WHEN age>10 AND age<21 THEN '10-20'
	WHEN age>20 AND age<31 THEN '21-30'
	WHEN age>30 AND age<41 THEN '31-40'
	WHEN age>40 AND age<51 THEN '41-50'
	WHEN age>50 AND age<61 THEN '51-60'
	WHEN age>60 AND age<71 THEN '61-70'
	WHEN age>70 AND age<81 THEN '71-80'
	WHEN age>80 AND age<91 THEN '81-90'
	ELSE null
END AS 'age_group'
FROM cancer) 

SELECT age_group as Most_affected_age_group, count(*) AS num_of_cases FROM age_class
GROUP BY age_group
ORDER BY age_group;


-- 17.	Top 5 Countries by Specific Cancer Type
WITH base_data as 
(SELECT Cancer_Type, Country_Region, COUNT(Patient_ID) AS num_of_cases
FROM cancer GROUP BY Cancer_Type, Country_Region), 

final_data as 
(SELECT Cancer_Type, Country_Region, num_of_cases,
DENSE_RANK() OVER(PARTITION BY cancer_type ORDER BY num_of_cases DESC) as rnk
FROM base_data)

SELECT Cancer_Type, Country_Region, num_of_cases, rnk as Rank
FROM final_data
WHERE rnk<6;


--18.	Country vs Year Heatmap
SELECT Year, Country_Region, COUNT(Patient_ID) as Num_of_Cases
FROM cancer
GROUP BY Year, Country_Region
ORDER BY Year, Country_Region;


-- 19.	Average Treatment Cost by Cancer Type
SELECT Cancer_Type, CAST(AVG(Treatment_Cost_USD) AS DECIMAL(10,2)) as AVG_Treatment_Cost 
FROM cancer
GROUP BY Cancer_Type;

-- 20.	Average Severity by Cancer Type
SELECT Cancer_Type, CAST(AVG(Target_Severity_Score) AS DECIMAL(10,2)) as AVG_Target_Severity_Score 
FROM cancer
GROUP BY Cancer_Type;

-- 21.	Average Severity by Age Group
WITH age_class AS
(SELECT Patient_id, age, Target_Severity_Score,
CASE
	WHEN age>10 AND age<21 THEN '10-20'
	WHEN age>20 AND age<31 THEN '21-30'
	WHEN age>30 AND age<41 THEN '31-40'
	WHEN age>40 AND age<51 THEN '41-50'
	WHEN age>50 AND age<61 THEN '51-60'
	WHEN age>60 AND age<71 THEN '61-70'
	WHEN age>70 AND age<81 THEN '71-80'
	WHEN age>80 AND age<91 THEN '81-90'
	ELSE null
END AS 'age_group'
FROM cancer) 

SELECT age_group, CAST(AVG(Target_Severity_Score) AS DECIMAL(10,2)) as AVG_Target_Severity_Score 
FROM age_class
GROUP BY age_group
ORDER BY age_group;


-- 22.	Average Genetic Risk Score
SELECT CAST(AVG(Genetic_Risk) AS decimal(10,2)) AS Average_Genetic_Risk_Score FROM cancer;

-- 23.	Average Air Pollution Exposure
SELECT CAST(AVG(Air_Pollution) AS decimal(10,2)) AS Average_Air_Pollution FROM cancer;


--24.	Smoking vs Severity Score
WITH base_data as 
(SELECT 
CASE
	WHEN Smoking =0 THEN '0'
	WHEN Smoking >0 and Smoking<1 THEN '>0'
	WHEN Smoking >=1 and Smoking<2 THEN '>=1'
	WHEN Smoking >=2 and Smoking<3 THEN '>=2'
	WHEN Smoking >=3 and Smoking<4 THEN '>=3'
	WHEN Smoking >=4 and Smoking<5 THEN '>=4'
	WHEN Smoking >=5 and Smoking<6 THEN '>=5'
	WHEN Smoking >=6 and Smoking<7 THEN '>=6'
	WHEN Smoking >=7 and Smoking<8 THEN '>=7'
	WHEN Smoking >=8 and Smoking<9 THEN '>=8'
	WHEN Smoking >=9 and Smoking<10 THEN '>=9'
	WHEN Smoking >=10 THEN '>=10'
ELSE Null
END as 'Smoking_categ', *
FROM cancer) 

SELECT Smoking_categ, AVG(Target_Severity_Score) as Avg_Target_Severity_Score
FROM base_data
GROUP BY Smoking_categ ORDER BY Avg_Target_Severity_Score DESC;


-- 25.	Survival Years vs Severity Score
SELECT CAST(Survival_Years as Int) as Survival_Years, CAST(AVG(Target_Severity_Score) AS DECIMAL(10,2)) as Avg_Target_Severity_Score
FROM cancer
GROUP BY CAST(Survival_Years as Int)
Order BY Survival_Years;