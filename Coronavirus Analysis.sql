Create Schema CoronaVirus;
Create database COVISHEILD;
Use coronavirus;
 Select* from coronadataoverall;
 SELECT * 
FROM coronadataoverall
-- Q1. Write a code to check NULL values?
#Checking wheter is is any Null value present is the columns of the data 
#Answer
WHERE Province is null	or CountryRegion is null or Latitude is null or Longitude is null or Dates is null
or Confirmed is null or Deaths is null or Recovered is null; # there is no null values in the data.
-- Q2. If NULL values are present, update them with zeros for all columns. 
-- Hence there are no null values in the columns there is no answer for the Q2 .
-- Q3. check total number of rows
Select count(*) AS Total_Rows
from coronadataoverall; 
# The Answer for the total Rows is 43934. 
-- Q4. Check what is start_date and end_date
SHOW COLUMNS FROM coronadataoverall;
describe coronadataoverall;
SELECT start_date, end_date
FROM coronadataoverall;
-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT MONTH(Dates)) AS num_months
FROM coronadataoverall;
-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
    MONTH(dates) AS month,
    AVG(confirmed) AS avg_confirmed,
    AVG(deaths) AS avg_deaths,
    AVG(recovered) AS avg_recovered
FROM 
    coronadataoverall
GROUP BY 
    MONTH(dates);
-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT 
  DATE_FORMAT(dates, '%Y-%m') AS month, 
  confirmed, 
  COUNT(*) AS frequency
FROM coronadataoverall
GROUP BY month, confirmed
ORDER BY month, frequency DESC, confirmed
LIMIT 1;
-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(dates) AS year,
    MIN(confirmed) AS min_confirmed,
    MIN(deaths) AS min_deaths,
    MIN(recovered) AS min_recovered
FROM 
    coronadataoverall
GROUP BY 
    YEAR(dates);
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT 
    YEAR(dates) AS year,
    max(confirmed) AS max_confirmed,
    max(deaths) AS max_deaths,
    Max(recovered) AS max_recovered
FROM 
    coronadataoverall
GROUP BY 
    YEAR(dates);
-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
    MONTH(dates) AS month,
    SUM(confirmed) AS total_confirmed,
    SUM(deaths) AS total_deaths,
    SUM(recovered) AS total_recovered
FROM 
    coronadataoverall
GROUP BY 
    MONTH(dates);
 
 use coronavirus;
 -- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
#Total confirmed cases.
 SELECT SUM(confirmed) AS total_confirmed_cases
FROM coronadataoverall;   
#Average 
SELECT Avg(confirmed) AS Avg_cases
FROM coronadataoverall;       
#Variance 
SELECT countryRegion, province,
 VARIANCE(confirmed) AS variance_confirmed
FROM coronadataoverall
GROUP BY countryRegion, province;
#Standard Deviation 
SELECT countryRegion, province, STDDEV(confirmed) AS stdev_confirmed
FROM coronadataoverall	
GROUP BY CountryRegion, province;
-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
#Total confirmed cases by each month
 SELECT Deaths AS month, SUM(deaths) AS total_deaths
FROM coronadataoverall
GROUP BY month;
#Average deaths per month
sELECT Deaths as Month, avg(DEaths) as Avg_deaths
From coronadataoverall
Group by MONTH;
#Variance 
SELECT DATE_FORMAT(dates, '%Y-%m') AS month, VARIANCE(deaths) AS variance_deaths
FROM coronadataoverall
GROUP BY month;
# Standard Deviation
SELECT DATE_FORMAT(dates, '%Y-%m') AS month, STDDEV(deaths) AS stdev_deaths
FROM coronadataoverall
GROUP BY month;
-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
#Total Confirmed Cases 
select Recovered as Recovered_cases,
Sum(confirmed) as Total_Confirmed
From coronadataoverall
group by Recovered;
#aVERAGE
SELECT countryREGION, province, AVG(recovered) AS avg_recovered
FROM coronadataoverall
GROUP BY countryREGION, province;
#Variance
select countryregion,province, variance(recovered)as var_rec
from coronadataoverall
GROUP BY countryREGION, province;
 #Standard Deviation
 select countryregion,province, stddev(recovered)as std_rec
from coronadataoverall
GROUP BY countryREGION, province;
    --  Q14. Find Country having highest number of the Confirmed case
 SELECT *
FROM coronadataoverall
WHERE confirmed = (SELECT MAX(confirmed) FROM coronadataoverall);
 -- Q15. Find Country having lowest number of the death case

SELECT countryRegion, SUM(deaths) AS total_deaths
FROM coronadataoverall
GROUP BY countryRegion
ORDER BY total_deaths ASC
LIMIT 1;
-- Q16. Find top 5 countries having highest recovered case
 SELECT countryRegion, SUM(recovered) AS total_recovered
FROM coronadataoverall
GROUP BY countryRegion
ORDER BY total_recovered DESC
LIMIT 5;
 
 
 
 
 
 
 
 
 
 
 
    


	











