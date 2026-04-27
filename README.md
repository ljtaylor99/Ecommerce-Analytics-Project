# Ecommerce-Analytics-Project

This is the repository for an ongoing independent analytics project. The project aims to use Google Cloud Platform and its associated tools including BigQuery and Looker to monitor Ecommerce activity. This repository will be updated as the work progresses.

## Data Summary
The data source is the BigQuery Public Data Set [thelook_ecommerce](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sbigquery-public-data!2sthelook_ecommerce). This is a synthetic dataset from a ficticious clothing company. The data encompasses 8 tables and includes information about users, transactions, and available items. The data is updated daily with new transactions and inventory items.

## Repository Directory 
- transaction-data.sql - Script to extract transaction data from the public Ecommerce set on BigQuery
- customer-data.sql - Script to extract customer data from the public Ecommerce set on BigQuery

## Project Progress 

Scheduled queries are set up and are extracting data to use for analysis. Work is currently being done to create Looker dashboards to display pertinent information. Here is the current ideas for possible dashboards:

- Customer Demographics: Total number of customers (filtered by country and city), traffic source (email, web search), customer growth over time.
- Profit: Total sales (fitered by geography, product category), profit over time.
- Delivery Status: Number of orders by category (eg. Shipped, Returned etc.), time it takes for a product to be delivered, info about distribution centers. 
