# Snowflake - DBT ELT Pipeline to Analyse Wine Reviews and Compare with Inventory

An end-to-end ELT Pipeline project that combines wine reviews with LCBO product inventory data to explore the best reviewed wines and compare them with product availability. The project implements a **Medallion Architecture** using **Airbyte, Snowflake, dbt, and Astronomer Cosmos**.

This project builds an automated ELT pipeline that:
1. Ingests raw wine reviews and LCBO product data.
2. Stores the raw data in Snowflake.
3. Cleans and transforms the data using dbt.
4. Splits the data into fact and dimension tables.
5. Orchestrates the dbt workflow using Apache Airflow through Astronomer Cosmos.
