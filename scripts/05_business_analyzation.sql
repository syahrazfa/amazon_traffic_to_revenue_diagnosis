-- Business Question
-- 1. What category that destroy the margin?
-- 2. What category deserve to scale?
-- 3. Are discounts killing margin?
-- 4. Which category favored by user?
-- 5. Which categories convert volume into real profit vs fake profit?
-- 6. Which categories survive discounting with positive margin?
-- 7. Which categories fake growth (high sales, negative margin)?
-- 8. Where does price anchoring fail (high discount, low lift)?
-- 9. Which categories are structurally unprofitable regardless of discount?
-- 10. Does trust depth (rating_count) actually protect margin?
-- 11. Which categories need trust repair vs price repair?
-- 12. Where are we over-discounting because trust is weak?
-- 13. Which families convert without heavy discounting?
-- 14. Where should acquisition budget be increased?
-- 15. Where should acquisition be frozen or cut?
-- 16. Which families deserve liquidation vs reinvestment?
-- 17. Which families produce durable vs disposable revenue?

SELECT * FROM silver.fact_product_persuasion;

-- Margin Destroyer Model
CREATE TABLE gold.margin_destruction AS
SELECT
	level_1,
	level_2,
	COUNT(*) as sku_count,
	ROUND(AVG((actual_price - discounted_price)/actual_price),2) as avg_margin_loss,
	ROUND(AVG(discount_percentage),2) as avg_discount_percentage,
	ROUND(AVG(rating),2) as avg_rating,
	ROUND(AVG(rating_count),2) as avg_rating_count
FROM silver.fact_product_persuasion
GROUP BY 1,2
ORDER BY avg_margin_loss DESC;

-- Elasticity Signal Model

CREATE TABLE gold.elasticity_signal AS
SELECT
    level_1,
    level_2,
    ROUND(CORR(discount_percentage, rating_count)::NUMERIC,3) AS discount_trust_corr,
    ROUND(CORR(discount_percentage, discounted_price)::NUMERIC ,3) AS discount_price_corr
FROM silver.fact_product_persuasion
GROUP BY 1,2;

-- Capital Verdict

CREATE TABLE gold.capital_verdict AS
SELECT
    m.level_1,
    m.level_2,
    m.avg_margin_loss,
    m.avg_discount_percentage,
    e.discount_trust_corr,
    CASE
        WHEN m.avg_margin_loss < 0.15 AND e.discount_trust_corr > 0.2 THEN 'SCALE'
        WHEN m.avg_margin_loss BETWEEN 0.15 AND 0.30 THEN 'FIX'
        ELSE 'KILL'
    END AS verdict
FROM gold.margin_destruction m
LEFT JOIN gold.elasticity_signal e USING(level_1, level_2);

SELECT * FROM gold.capital_verdict ORDER BY avg_margin_loss DESC;
SELECT * FROM gold.elasticity_signal WHERE discount_trust_corr > 0.3;
SELECT * FROM gold.margin_destruction ORDER BY avg_margin_loss DESC;
