# Snowflake, DBT ELT Pipeline to Analyse Wine Reviews and Compare with Inventory

An end-to-end ELT Pipeline project that combines wine reviews with LCBO product inventory data to explore the best reviewed wines and compare them with product availability. The project implements a **Medallion Architecture** using **Airbyte, Snowflake, dbt, and Astronomer Cosmos**.

This project builds an automated ELT pipeline that:
1. Ingests raw wine reviews and LCBO product data.
2. Stores the raw data in Snowflake.
3. Cleans and transforms the data using dbt.
4. Splits the data into fact, dimension and mart tables to be used for downstream analytics.
5. Orchestrates the dbt workflow using Apache Airflow through Astronomer Cosmos.

## Architecture and Data Flow

<img width="2260" height="1058" alt="project design" src="https://github.com/user-attachments/assets/95871852-083a-4537-a5b1-41787c41cafb" />

<img width="2565" height="1253" alt="project design (1)" src="https://github.com/user-attachments/assets/e1afde6e-4987-4a14-9a31-5f92430e1490" />

## Data Warehouse Design
The data warehouse in Snowflake follows the Medallion Architecture, separating the transformation stages into three layers:
1. **Bronze Layer:** This contains the raw data ingested from external sources (Google Drive via Airbyte in this case) with minimal transformations. The purpose of this layer is to preserve the original source data and provide a reliable starting point for downstream transformations.
2. **Silver Layer:** This layer standardises and cleans the raw data. Typical transformations include removing duplicates, standardising text, handling null values, converting data types and handling special characters. This layer mainly focuses on preparing data for analytical modelling.
3. **Gold Layer:** This layer contains analytics-ready models, namely the fact, dimension and mart tables.

## Data Modelling
The project yields a combination of fact and dimension tables:

**Fact Table** (`fct_wine_reviews`): Contains measurable and review related information such as review description/content, points, taster name and socials, winery, variety, country etc. A surrogate key is used to uniquely identify fact records.

**Dimension Table** (`dim_lcbo_wines`): Contains descriptive information about wines available in the LCBO inventory such as product id, category, abv, country, producer, product type, price etc. The dimension is filtered to wines only so that unrelated LCBO categories such as spirits, beer and coolers are excluded.

## Matching Products

One major challenge encountered during this project was that the wine review dataset and the LCBO inventory dataset did not share a reliable common product identifier. Exact product-name matching produced very limited results. 
To investigate whether the datasets could be linked through winery/producer names, fuzzy string matching using **Jaro-Winkler similarity** was explored. For example:


`JAROWINKLER_SIMILARITY(
            TRIM(LOWER(reviews.winery)),
            TRIM(LOWER(wines.producer))
        ) AS similarity_score,`

