SELECT * FROM property_data
--SECTION 1 COUNT AGGREGATIONS
--1. How many total properties are in the database?
SELECT COUNT(*) FROM property_data
SELECT COUNT(property_ID) FROM property_data

--2. How many properties are listed in each province?
SELECT province, COUNT(DISTINCT property_id) AS total_quantity
FROM property_data
GROUP BY province

--3. How many properties are listed in each city?
SELECT city, COUNT(DISTINCT property_id) AS total_quantity
FROM property_data
GROUP BY city

--4. How many properties have more than 2 bedrooms?
SELECT COUNT(property_id)
FROM property_data
WHERE bedrooms>2

--5. How many properties have 2 or more bathrooms?
SELECT COUNT(property_id)
FROM property_data
WHERE bathrooms>=2

--6. How many properties have parking for at least 2 cars?
SELECT COUNT(property_id)
FROM property_data
WHERE parking >=2

--7. How many properties are priced above R3,000,000?
SELECT COUNT(property_id)
FROM property_data
WHERE property_price> 3000000

--8. How many properties are in Gauteng?
SELECT COUNT(property_id)
FROM property_data
WHERE province='Gauteng'

--9. How many properties per province have floor size greater than 200?
SELECT province, COUNT(DISTINCT property_id) AS total_quantity
FROM property_data
WHERE floor_size>200
GROUP BY province

--10. How many distinct provinces are in the table?
SELECT COUNT(DISTINCT province)
FROM property_data

--SECTION 2 SUM AGGREGATIONS
--11. What is the total value of all properties combined?
SELECT SUM(property_price) AS total_value
FROM property_data

--12. What is the total property value per province?
SELECT province, SUM(property_price) AS total_quantity
FROM property_data
GROUP BY province

--13. What is the total property value per city?
SELECT city, SUM(property_price) AS total_quantity
FROM property_data
GROUP BY city

--14. What is the total monthly repayment for all properties?
SELECT SUM(monthly_repayment)
FROM property_data

--15. What is the total monthly repayment per province?
SELECT province, SUM(monthly_repayment) AS total_quantity
FROM property_data
GROUP BY province

--16. What is the total once-off cost for all properties?
SELECT SUM(total_once_off_costs)
FROM property_data

--17. What is the total once-off cost per province?
SELECT province, SUM(total_once_off_costs) AS total_quantity
FROM property_data
GROUP BY province

--18. What is the total property value for Gauteng?
SELECT SUM(property_price)
FROM property_data
WHERE province='Gauteng'

--19. What is the total property value for properties priced above R4,000,000?
SELECT SUM(property_price)
FROM property_data
WHERE property_price>4000000

--20. What is the total minimum gross monthly income required per province?
SELECT province, SUM(min_gross_monthly_income) AS total_quantity
FROM property_data
GROUP BY province

--SECTION 3 AVG AGGREGATIONS
--21. What is the average property price overall?
SELECT AVG(property_price)
FROM property_data

--22. What is the average property price per province?
SELECT province, AVG(property_price) AS average_price
FROM property_data
GROUP BY province

--23. What is the average property price per city?
SELECT city, AVG(property_price) AS average_price
FROM property_data
GROUP BY city

--24. What is the average number of bedrooms per province?
SELECT province, AVG(bedrooms) AS average_number
FROM property_data
GROUP BY province

--25. What is the average number of bathrooms per province?
SELECT province, AVG(bathrooms) AS average_number
FROM property_data
GROUP BY province

--26. What is the average floor size per province?
SELECT province, AVG(floor_size) AS average_number
FROM property_data
GROUP BY province

--27. What is the average monthly repayment per province?
SELECT province, AVG(monthly_repayment) AS average_price
FROM property_data
GROUP BY province

--28. What is the average once-off cost per province?
SELECT province, AVG(total_once_off_costs) AS average_price
FROM property_data
GROUP BY province

--29. What is the average minimum gross monthly income per province?
SELECT province, AVG(min_gross_monthly_income) AS average_price
FROM property_data
GROUP BY province

--30. What is the average property price for properties above R3,000,000?
SELECT AVG(property_price)
FROM property_data
WHERE property_price>3000000

--SECTION 4 GROUP BY + FILTERING
31. Which province has the highest average property price?
SELECT province, AVG(property_price) AS average_price
FROM property_data
GROUP BY province
ORDER BY average_price DESC

--32. Which province has the lowest average property price?
SELECT province, AVG(property_price) AS average_price
FROM property_data
GROUP BY province
ORDER BY average_price ASC

--33. Which city has the highest total property value?
 SELECT city, SUM(property_price) AS total_price
 FROM property_data
 GROUP BY city
 ORDER BY total_price DESC
 
 --34. Which city has the lowest average property price?
SELECT city, AVG(property_price) AS average_price
FROM property_data
GROUP BY city
ORDER BY average_price ASC

--35. How many properties per province are priced above R2,000,000?
SELECT province, COUNT(DISTINCT property_id) AS total
FROM property_data
WHERE property_price>2000000
GROUP BY province

--36. What is the average floor size per province for properties above R3,000,000?
SELECT province, AVG(floor_size) AS average_number
FROM property_data
WHERE property_price > 3000000
GROUP BY province

--37. What is the total property value per province for properties with 3 or more bedrooms?
SELECT province, SUM(property_price) AS total
FROM property_data
WHERE bedrooms>=3
GROUP BY province

--38. What is the average monthly repayment per province for properties above R4,000,000?
SELECT province, AVG(monthly_repayment) AS average
FROM property_data
WHERE property_price>4000000
GROUP BY province

--39. How many properties per city have parking for 2 or more cars?
SELECT city, COUNT(property_id) AS total
FROM property_data
WHERE parking>=2
GROUP BY city

40. What is the average minimum gross monthly income per province for properties above R5,000,000?
SELECT province, AVG(min_gross_monthly_income) AS average
FROM property_data
WHERE property_price>5000000
GROUP BY province