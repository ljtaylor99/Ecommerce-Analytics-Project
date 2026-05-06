/* Query will return info about customers including when they join the company, demographic info (age, gender, city, state, 
country), how they heard aboout the company(traffic source), how many purchases, time since last purchase. Scheduled to run 
every 24 hours to extract data */

# Aggregate order items data to get number of purchases and last date they purchased an item
WITH group_agg AS (
  SELECT  user_id, COUNT(user_id) AS num_purchases, MAX(created_at) AS last_purchase_date
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  GROUP BY user_id
)

SELECT DISTINCT U.id AS user_id, U.created_at, age, gender, state, city, country, traffic_source,
# Replace null values with 0
COALESCE(num_purchases, 0) AS num_purchases,
# Get length of time customer has been with company
DATE_DIFF(CURRENT_DATE(), DATE(U.created_at), month) AS months_as_customer,
# Get number of days since last purchase
DATE_DIFF(CURRENT_DATE(), DATE(GA.last_purchase_date), DAY) AS days_since_purchase
FROM `bigquery-public-data.thelook_ecommerce.users` AS U
# Join customer table with agreggated purchase info
LEFT JOIN group_agg AS GA
ON U.id = GA.user_id
# Exclude rows where user id is null
WHERE U.id IS NOT NULL
ORDER BY U.created_at ASC

