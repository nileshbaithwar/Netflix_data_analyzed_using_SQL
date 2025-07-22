📊 Netflix Dataset Analysis with SQL Workbench

## 1. 🛠️ Project Overview

Analyze Netflix’s movie and TV show dataset using SQL in SQL Workbench to uncover trends, content distribution, and answer key business questions.

## 2. 🎯 Objectives

* Measure distribution of content types (movies vs. TV shows)
* Determine most common genres, ratings, countries
* Track trends: release years, additions, durations
* Identify top directors, actors, and country-specific content

## 3. 📦 Dataset

* Source: Kaggle “Netflix Movies and TV Shows” (e.g., `netflix_titles.csv`)
* Schema:

  ```sql
  CREATE TABLE netflix (
    show_id VARCHAR(10),
    type VARCHAR(10),
    title VARCHAR(250),
    director VARCHAR(550),
    cast VARCHAR(1050),
    country VARCHAR(550),
    date_added DATE,
    release_year INT,
    rating VARCHAR(15),
    duration VARCHAR(15),
    listed_in VARCHAR(250),
    description TEXT
  );
  ```

## 4. 🔧 Setup

1. Open SQL Workbench
2. Create and connect to a database
3. Run the above `CREATE TABLE`
4. Use `LOAD DATA LOCAL INFILE 'netflix_titles.csv' …` to import

## 5. 🧩 Data Cleaning

* Normalize multi-valued columns using `UNNEST(STRING_TO_ARRAY(...))`—genre & country unnesting follows established patterns ([Medium][1], [GitHub][2], [bizopsanalytics.com][3])
* Optionally create intermediate views for normalized analysis

## 6. 📋 Sample Queries

| Task                              | SQL                                                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Count movies vs TV shows          | `SELECT type, COUNT(*) FROM netflix GROUP BY type;` ([Medium][1], [GitHub][4])                                                                        |
| Most frequent ratings by type     | CTE + `RANK()` approach ([GitHub][4], [GitHub][2])                                                                                                    |
| Top 10 genres                     | `SELECT genre, COUNT(*) FROM (…) GROUP BY genre ORDER BY COUNT DESC LIMIT 10;` ([Read Medium articles with AI][5], [Read Medium articles with AI][6]) |
| Top 5 content-producing countries | Unnest country and count ([GitHub][4], [GitHub][2])                                                                                                   |
| Top directors / actors            | Similar pattern with `UNNEST` on `director` or `cast` columns ([Read Medium articles with AI][5], [GitHub][2])                                        |
| Longest duration title            | Parse `duration` via string functions ([Read Medium articles with AI][5], [GitHub][2])                                                                |
| Most recent additions             | `SELECT title, date_added FROM netflix ORDER BY date_added DESC LIMIT 10;` ([Read Medium articles with AI][5], [Read Medium articles with AI][6])     |

## 7. 📘 Database Optimization

* Consider splitting into `titles`, `credits` tables
* Use normalized lookup tables for genres, countries ([Medium][1])

## 8. 📈 Insights & Findings

* Content types distribution
* Genre popularity and trends
* Regional content breakdown
* Longest/shortest titles, most-active creators

## 9. 🧠 Business Value

* Guide content strategy based on popular genres/regions
* Identify gaps in content library
* Inform future acquisitions or production efforts

## 10. 🧪 Optional Extensions

* Temporal analysis: genre growth over years
* Keyword content filtering (e.g., “violence”) ([GitHub][2], [ionots.com][7], [bizopsanalytics.com][3])
* Viewership or rating sentiment analysis (if data allows)

## 11. 📝 Project Structure

```
/sql/  
  ├─ schemas.sql      -- table/view definitions  
  ├─ data_import.sql  -- import scripts  
  ├─ analysis_queries.sql  
/README.md  
/netflix_titles.csv
```
