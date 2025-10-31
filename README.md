# spotify-sql-project

A comprehensive SQL-based analytics project exploring Spotify music data, including track metrics, artist performance, streaming statistics, and YouTube integration analysis.

### Project Overview
This project analyzes a rich dataset of Spotify tracks combined with YouTube metrics to uncover insights about music streaming patterns, track characteristics, and artist performance across platforms.

### Database Schema
Spotify Data Table
sql- Artist (nvarchar 300)
- Track (nvarchar 300)
- Album (nvarchar 300)
- Album_type (nvarchar 60)
- Danceability (float)
- Energy (float)
- Loudness (float)
- Speechiness (float)
- Acousticness (float)
- Instrumentalness (float)
- Liveness (float)
- Valence (float)
- Tempo (float)
- Duration_min (float)
- Title (nvarchar 300)
- Channel (nvarchar 300)
- Views (float)
- Likes (bigint)
- Comments (bigint)
- Licensed (nvarchar 10)
- official_video (nvarchar 10)
- Stream (bigint)
- EnergyLiveness (float)
- most_playedon (nvarchar 60)


## Technical Features
#### SQL Techniques Used

- Aggregate Functions: SUM, AVG, COUNT, MAX, MIN
- Window Functions: DENSE_RANK(), SUM() OVER()
- Common Table Expressions (CTEs): WITH clause
- Conditional Aggregation: CASE statements
- COALESCE: Null handling
- NULLIF: Division by zero prevention
- Subqueries: Nested SELECT statements
- GROUP BY: Data aggregation
- ORDER BY: Result sorting

### Data Quality Checks

- Exploratory Data Analysis (EDA) queries
- Distinct value analysis
- Duration validation (checking for invalid values)
- Missing data handling

### Key Insights Covered

- Streaming Patterns: Cross-platform streaming behavior analysis
- Track Characteristics: Audio features like danceability, energy, and liveness
- Engagement Metrics: Views, likes, and comments analysis
- Artist Performance: Track counts and view rankings per artist
- Album Analytics: Type distribution and aggregate metrics
- Content Type: Licensed vs. unlicensed content performance
- Video Impact: Official video vs. audio-only performance

### Getting Started
Prerequisites

- Microsoft SQL Server or compatible database
= Dataset: cleaned_dataset.csv

## Setup Instructions

### Create Database

#### CREATE DATABASE spotify_db;

### Create Table

- Use the provided CREATE TABLE statement

### Import Data

- Use BULK INSERT command (update file path)
BULK INSERT spotify
FROM 'your_path/cleaned_dataset.csv'
WITH (
    FIELDTERMINATOR = ',',
    FIRSTROW = 2,
    TABLOCK,
    KEEPNULLS
)



### Sample Queries
- Find Most Streamed Artists
SELECT Artist, SUM(Stream) AS total_streams
FROM spotify_data
GROUP BY Artist
ORDER BY total_streams DESC;
Analyze Track Audio Features
sqlSELECT Track, Danceability, Energy, Valence
FROM spotify_data
WHERE Energy > 0.8 AND Danceability > 0.7;

### Use Cases

- Music Industry Analytics: Understanding streaming trends and artist performance
- Content Strategy: Identifying successful track characteristics
- Platform Comparison: Spotify vs YouTube performance analysis
- A&R Insights: Discovering patterns in successful music
- Marketing Analysis: Engagement metrics for promotional strategies

### Future Enhancements

- Time-series analysis for trend detection
- Genre-based categorization and analysis
- Predictive modeling for track success
- Sentiment analysis on comments
- Advanced visualization integration

**Contributing**
- Feel free to fork this project and submit pull requests for:

- Additional analysis queries
- Performance optimizations
- New insights and visualizations
- Documentation improvements



Project Type: SQL Data Analysis
Database: Microsoft SQL Server
Focus Area: Music Streaming Analytics
