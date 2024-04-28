# Write your MySQL query statement below
SELECT 
    Prices.product_id,
    COALESCE(ROUND(SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units), 2), 0) AS average_price
FROM 
    Prices
LEFT JOIN 
    UnitsSold
ON
    UnitsSold.purchase_date <= Prices.end_date 
    AND 
    UnitsSold.purchase_date >= Prices.start_date
    AND 
    UnitsSold.product_id = Prices.product_id
GROUP BY
    Prices.product_id;