-- Join the data 

DROP TABLE IF EXISTS silver.fact_product_persuasion;

CREATE TABLE silver.fact_product_persuasion AS
SELECT
    p.product_id,
    t.level_1,
    t.level_2,
    t.level_3,
    t.level_4,
    t.level_5,
    p.discounted_price,
    p.actual_price,
    p.discount_percentage,
    p.rating,
    p.rating_count
FROM silver.dim_products p
JOIN silver.dim_product_taxonomy t
  ON p.product_id = t.product_id;

SELECT * FROM silver.fact_product_persuasion;
