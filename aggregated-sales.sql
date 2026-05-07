/* Aggregate sales at order level. Include total price of order and number of items in the order. Scheduled to run every 24 hours to extract data */
SELECT order_id, TD.user_id, CD.state,CD.city, CD.country,ROUND(SUM(retail_price),2) as total_price, 
# Number of items in order
COUNT(order_id) AS num_items FROM `true-bit-421817.ecommerce_monitoring.transaction-data` AS TD
JOIN `true-bit-421817.ecommerce_monitoring.customer-data` AS CD ON TD.user_id = CD.user_id
# Ensure columns are not null
WHERE CONCAT(order_id, TD.user_id, CD.state,CD.city, CD.country,retail_price) IS NOT NULL
GROUP BY order_id, user_id, state, city, country
# Group by ids
ORDER BY order_id, user_id