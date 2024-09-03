SELECT *
FROM Ramenreviews;


-- Exploratory Data Analysis of Ramenreviews Table

--Average rating of all Ramen products
SELECT  ROUND(AVG(Stars), 2) AS AverageRating, 
		COUNT(*) AS TotalProducts
FROM Ramenreviews;

--Relationship between Style and Rating
SELECT Style,
		ROUND(AVG(Stars), 2) AS AvgRating
FROM Ramenreviews
GROUP BY Style;

--Relationship between Brands and Rating
SELECT Brand, 
		ROUND(AVG(Stars), 2) AS AvgRating
FROM Ramenreviews
GROUP BY Brand
ORDER BY AvgRating DESC;

--Total No. of products per Style
SELECT Style, 
		COUNT(*) AS TotalProducts
FROM Ramenreviews
GROUP BY Style
ORDER BY TotalProducts DESC;

 CREATE VIEW
	ProductsbyStyle as
	SELECT Style, COUNT(*) AS TotalProducts
	FROM Ramenreviews
	GROUP BY Style;

--Changing 'Samyang' in Brand to 'Samyang Foods'
UPDATE Ramenreviews
SET Brand = 'Samyang Foods'
WHERE Brand = 'Samyang';

--Average Ratings and Total Products by Country
SELECT Country, 
		COUNT(*) AS TotalProducts, 
		ROUND(AVG(Stars), 2) AS AvgRating
FROM Ramenreviews
GROUP BY Country
ORDER BY TotalProducts DESC;

--Top Ten Brands with the most diverse products
SELECT TOP 10 Brand, 
		COUNT(*) AS Products 
FROM Ramenreviews
GROUP BY Brand
ORDER BY Products DESC;


--Total Products in descending order for Brands in South Korea, China and Japan
SELECT Country, 
		Brand, 
		COUNT(*) AS Products
FROM Ramenreviews
WHERE Country IN 
		('South Korea', 'China', 'Japan')
GROUP BY Country, Brand
ORDER BY Products DESC;


--Measure of Consistency Ratings within each Brand
SELECT Brand, 
		ROUND(AVG(Stars), 2) AS AvgRating, 
		STDEV(Stars) AS RatingConsistency
FROM Ramenreviews
GROUP BY Brand;

--Top-rated Ramen Varieties across Styles
SELECT Style,
		Variety,
		MAX(Stars) AS MaxStarRating
FROM Ramenreviews
GROUP BY Style, Variety
ORDER BY MaxStarRating DESC;

--Characteristics of Ramen Noodles in TOP TEN column
SELECT *
FROM Ramenreviews
WHERE Top_Ten IS NOT NULL;