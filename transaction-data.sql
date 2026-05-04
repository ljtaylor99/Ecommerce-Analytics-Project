/* Query will return transaction info about the product odered, geographic info from user, and when it was shipped and delivered. 
Scheduled to run every 24 hours to extract data*/


#Duplicate rows
WITH duplicates AS (
SELECT id, COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS OI
GROUP BY id, order_id
HAVING COUNT(*) > 1
)


SELECT OI.id,order_id, category, P.name AS product_name, brand, department, ROUND(retail_price,2) AS retail_price,
DC.name AS distribution_center,state,city,country,OI.created_at,shipped_at, delivered_at, returned_at, DC.distribution_center_geom AS DC_geom,
# Calculate how many days it takes for product to arrive
DATE_DIFF(delivered_at, shipped_at, DAY) AS delivery_time_days,
# Calculate how many hours it takes for product to arrive
DATE_DIFF(delivered_at, shipped_at, HOUR) AS delivery_time_hours,
# Put status as incomplete if delivery hasn't been made within 2 months 
CASE 
WHEN status = 'Shipped' AND DATE_DIFF(CURRENT_DATE(), DATE(shipped_at), MONTH) > 2 THEN 'Incomplete' 
ELSE status END as status
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS OI 
# Join order_items and products tables together
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS P 
ON OI.product_id = P.id
# Join distribution_centers table
LEFT JOIN `bigquery-public-data.thelook_ecommerce.distribution_centers` AS DC
ON P.distribution_center_id = DC.id
# Get customer info
LEFT JOIN `bigquery-public-data.thelook_ecommerce.users` AS U
ON OI.user_id = U.id
# Excludes duplicates null values in demographic and product info
WHERE (OI.id) NOT IN (SELECT id FROM duplicates) AND CONCAT(OI.id,OI.order_id,category,P.name,brand,department,retail_price,DC.name,state,city,country) IS NOT NULL 
ORDER BY OI.created_at ASC