-- General overviwe of Table ---

SELECT * FROM population
LIMIT 5

-- Check for the column names and data types 

DESCRIBE population

-- Remaning the Column names

ALTER TABLE population CHANGE `World Population Percentage`  `world_population_percentage` double,

CHANGE `Area (kmÂ²)`  `area` int,

CHANGE `Country/Territory`  `country` varchar (100),

CHANGE `Growth Rate`  `growth_rate` double,

CHANGE `Density (per kmÂ²)`  `pop_density` double,

CHANGE `2022_Population`  `2022_Population` int,

CHANGE `2020 Population`  `2020_Population` int,

CHANGE `2015 Population`  `2015_Population` int,

CHANGE `2010 Population`  `2010_Population` int,

CHANGE `2000 Population`  `2000_Population` int,

CHANGE `1990 Population`  `1990_Population` int,

CHANGE `1980 Population`  `1980_Population` int,

CHANGE `1970 Population`  `1970_Population` int;


-- How many distinct continents are contained in the table

SELECT count(distinct continent) AS Total_Continents
FROM population


-- How many distinct countries are contained in the table

SELECT count(distinct country) AS Total_Countries
FROM population
WHERE country IS NOT NULL


-- What is the average population of each continent in 2022?

SELECT continent, round(avg(2022_Population),2) AS Avg_population
FROM population
GROUP BY continent
ORDER BY Avg_population DESC


-- Find the country with highest population in 2022

SELECT country, max(2022_Population) AS Heighest_population
FROM population
GROUP BY country
ORDER BY  Heighest_population DESC
LIMIT 1


-- Find the country with lowest population in 2022

SELECT country, min(2022_Population) AS Lowest_population
FROM population
GROUP BY country
ORDER BY Lowest_population
LIMIT 1


-- -- Find the population of North America with a capital city called The Valley in the year 2022

SELECT continent, 2022_Population
FROM population
WHERE continent = 'North America' AND capital = 'The Valley'


--  What are the top 10 most populated countries in 2015?

SELECT Country, max(2015_Population) AS Population
FROM population
GROUP BY Country
ORDER BY Population DESC
LIMIT 10


-- Find the bottom 10 populated countries in 2015

SELECT Country, max(2015_Population) AS Population
FROM population
GROUP BY Country
ORDER BY Population ASC
LIMIT 10


-- Find the Top 10 countries with largest area

SELECT country, max(area) AS Area
FROM population
GROUP BY country
ORDER BY Area DESC
LIMIT 10


-- State the countries and their capital from Asia continent in Alphabetical order

SELECT country, capital
FROM Population
WHERE continent = 'Asia'
ORDER BY Country


-- State the Countries whose population decrease from 1970 to 2022

SELECT country, 1970_Population, 2022_Population
FROM population
WHERE 1970_Population > 2022_Population


-- Countries whose population in more than avg population in year 2022

SELECT country, 2022_Population, (SELECT round(avg(2022_Population)) FROM population) AS Avg_population_2022
FROM population
WHERE 2022_Population > (
    SELECT avg(2022_Population)
    FROM population
)
