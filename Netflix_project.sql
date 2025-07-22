/*use netflix
show tables
select * from titles
select count(*) as total_records from titles;
SELECT
COUNT(DISTINCT show_id) AS unique_show_ids,
COUNT(DISTINCT type) AS unique_types,
COUNT(DISTINCT title) AS unique_titles,
COUNT(DISTINCT director) AS unique_directors,
COUNT(DISTINCT cast) AS unique_casts,
COUNT(DISTINCT country) AS unique_countries,
COUNT(DISTINCT date_added) AS unique_dates_added,
COUNT(DISTINCT release_year) AS unique_release_years,
COUNT(DISTINCT rating) AS unique_ratings,
COUNT(DISTINCT duration) AS unique_durations,
COUNT(DISTINCT listed_in) AS unique_listed_in,
COUNT(DISTINCT description) AS unique_descriptions
FROM titles;
SELECT
SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS missing_directors,
SUM(CASE WHEN cast IS NULL THEN 1 ELSE 0 END) AS missing_cast,
SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country,
SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS missing_dates_added,
SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_ratings,
SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS missing_durations
FROM titles;
select director,count(*) as Count from titles
group by director
order by Count desc
limit 10
-- Top 10 Countries
SELECT country, COUNT(*) AS count
FROM titles
GROUP BY country
ORDER BY count DESC
LIMIT 10;
SELECT YEAR(STR_TO_DATE(date_added, '%b %d, %Y')) AS
Year, COUNT(*) AS count
FROM titles
GROUP BY Year
ORDER BY Year;
SELECT COUNT(*) AS count
FROM titles
WHERE listed_in LIKE '%dramas%';
SELECT AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS
average_duration
FROM titles
WHERE duration REGEXP '^[0-9]+ min$';
SELECT COUNT(*) AS count
FROM titles
WHERE director="";
SELECT *
FROM titles
WHERE release_year >= YEAR(CURDATE()) - 5;
SELECT type, title
FROM titles
WHERE country = 'India';
SELECT *
FROM titles
WHERE duration LIKE '%seasons%';*/
seLECT *
FROM titles
WHERE duration LIKE '%seasons%'
AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(duration, ' ', 1), ' ', -1) AS
UNSIGNED) > 2;