# Snowflake - DBT ELT Pipeline to Analyse Wine Reviews and Compare with Inventory

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

