# Ecommerce-Analytics-Project

This is the repository for an ongoing independent analytics project. The project aims to use Google Cloud Platform and its associated tools including BigQuery and Looker to analyze Ecommerce activity. This repository will be updated as the work progresses.

## Data Summary
The data source is the BigQuery Public Data Set [thelook_ecommerce](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sbigquery-public-data!2sthelook_ecommerce). This is a synthetic dataset from a ficticious clothing company. The data encompasses 8 tables and includes information about users, transactions, and available items. The data is updated daily with new transactions and inventory items.

## Repository Directory 
- transaction-data.sql - Script to extract transaction data from the public Ecommerce set on BigQuery.
- customer-data.sql - Script to extract customer data from the public Ecommerce set on BigQuery.
- aggregated-sales.sql - Script to extract transaction data aggregated at the order level.

## Project Progress 

Scheduled SQL queries are set up and are extracting data to use for analysis. Another scheduled query was added to get aggregated sales data (by order) to get info such as average cost of orders and average numebr of items in an order.



Work is currently being done on Looker dashboards to display information. Here are the current existing dashboards:

- Customer Demographics: Total number of customers (filtered by country and city), traffic source (email, web search), customer growth over time.
- Profit: Total sales (fitered by geography, product category), profit over time. Average price of an order, average numer of items. Profit broken down by product catgory (treemap on seperate page).
- Delivery Status: Number of orders by category (eg. Shipped, Returned etc.), time it takes for a product to be delivered, info about distribution centers.

When visualizing data it was discovered that there is some null city values in the datasets. Although langauge is in scheduled queries to filter null values it was not adequetely excluded because the values were a string "null" rather than an actual null value. This type of null spans around 1700 rows.

### To Do
- Figure out how to include finished dashboards on repository (link,embedding).
- Research example Looker dashboard to get inspiration for organization/layouts.
- Investigate null city values and determine how to deal with them (dropping values, imputation).
