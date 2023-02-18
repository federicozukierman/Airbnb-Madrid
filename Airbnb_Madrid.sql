SELECT *
FROM PortfolioProject..Airbnb_Madrid;

--- Eliminamos las columnas que no vamos a necesitar
ALTER TABLE Airbnb_Madrid DROP column name;
ALTER TABLE Airbnb_Madrid DROP column last_review; 
ALTER TABLE Airbnb_Madrid DROP column reviews_per_month;
ALTER TABLE Airbnb_Madrid DROP column license;
ALTER TABLE Airbnb_Madrid DROP column host_name;

--- Comprobamos que no existan valores nulos o valores en blanco en la tabla
SELECT *FROM PortfolioProject..airbnb_madrid WHERE price IS NULL AND TRIM (cast(price AS varchar))<>'';

--- Realizamos una agrupación por precio medio y neighbourhood_group de forma descendente
SELECT DISTINCT neighbourhood_group, AVG (price) AS avg_precio 
FROM PortfolioProject..airbnb_madrid
GROUP BY neighbourhood_group 
ORDER BY avg_precio DESC;

---Realizamos una agrupación por neighbourhood y precio
SELECT DISTINCT neighbourhood, neighbourhood_group, 
AVG (price) OVER (PARTITION BY neighbourhood) AS avg_precio 
FROM PortfolioProject..airbnb_madrid
ORDER BY avg_precio DESC;

---Top 10 por número de reviews
SELECT TOP 10 * FROM PortfolioProject..airbnb_madrid
ORDER BY number_of_reviews DESC

-- Número de airbnb por neighbourhood
SELECT DISTINCT neighbourhood, neighbourhood_group, COUNT(id) AS numero_Airbnb  
FROM PortfolioProject..airbnb_madrid
GROUP BY neighbourhood, neighbourhood_group 
ORDER BY numero_Airbnb DESC;

--- Número de airbnb por propietario
SELECT DISTINCT host_id, COUNT(host_id) AS Airbnb_propietario FROM PortfolioProject..airbnb_madrid GROUP BY host_id ORDER BY Airbnb_propietario DESC;

-- Top 10 por número de airbnb por neighbourhood 
SELECT DISTINCT TOP 10 neighbourhood, neighbourhood_group, COUNT(id) AS numero_Airbnb  
FROM PortfolioProject..airbnb_madrid
GROUP BY neighbourhood, neighbourhood_group 
ORDER BY numero_Airbnb DESC 

--Top 10 por número de room_type
SELECT TOP 4 room_type, COUNT(room_type) AS numero_Airbnb FROM PortfolioProject..airbnb_madrid GROUP BY room_type ORDER BY numero_Airbnb DESC;

-- Precio promedio por tipo de room type por neighbourhood
SELECT DISTINCT neighbourhood, room_type, AVG (price) AS Avg_precio FROM PortfolioProject..airbnb_madrid GROUP BY neighbourhood, room_type ORDER BY Avg_precio DESC;

--Promedio disponibilidad durante el año
SELECT DISTINCT neighbourhood_group, AVG (availability_365) AS availability 
FROM PortfolioProject..airbnb_madrid
GROUP BY neighbourhood_group 
ORDER BY availability DESC;







