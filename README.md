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

## 12. 🧑‍💼 Author & Contact

* **Author**: *Your Name*
* **GitHub**: https://github.com/nileshbaithwar/Netflix_data_analyzed/edit/main/README.md
* **Email**: [youremail@example.com](mailto:youremail@example.com)

---

You can customize this: update sample queries, include visuals (e.g. bar charts from SQL tool outputs), and add specific findings from your dataset. Let me know if you want help refining any part!

[1]: https://medium.com/%40arpita_deb/netflix-data-analysis-a-deep-dive-into-streaming-trends-9a0fcf9724f2?utm_source=chatgpt.com "Netflix Data Analysis: A Deep Dive into Streaming Trends | by Arpita Deb | Medium"
[2]: https://github.com/abhimanoj4423/Netflix-Data-Analysis-Using-SQL?utm_source=chatgpt.com "GitHub - abhimanoj4423/Netflix-Data-Analysis-Using-SQL: Conducted comprehensive analysis of Netflix's dataset using SQL to extract insights on content distribution by genre, release year, and region. Utilized advanced querying techniques to assess content trends, popularity, and regional availability, demonstrating strong SQL skills in data manipulation and business insight generation."
[3]: https://www.bizopsanalytics.com/p/week-1-sql-foundations?utm_source=chatgpt.com "📅 Week 1: SQL Foundations"
[4]: https://github.com/SriSurya-DA/netflix_analytics_sql?utm_source=chatgpt.com "GitHub - SriSurya-DA/netflix_analytics_sql: This project leverages SQL to perform a comprehensive analysis of Netflix's movies and TV shows dataset, with the goal of uncovering actionable insights and addressing critical business questions."
[5]: https://readmedium.com/analysis-of-netflix-data-with-sql-95447b92f7d1?utm_source=chatgpt.com "Analysis of Netflix Data with SQL"
[6]: https://readmedium.com/analysis-of-netflix-data-with-sql-41a41dcf13c6?utm_source=chatgpt.com "Analysis of Netflix Data with SQL"
[7]: https://ionots.com/exploratory-data-analysis-guide-on-netflix-dataset/?utm_source=chatgpt.com "Exploratory Data Analysis guide on Netflix Dataset - Ionots"
