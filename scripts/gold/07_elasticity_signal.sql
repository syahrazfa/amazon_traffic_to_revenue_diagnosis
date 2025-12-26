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

-- Elasticity Signal Model

CREATE TABLE gold.elasticity_signal AS
SELECT
    level_1,
    level_2,
    ROUND(CORR(discount_percentage, rating_count)::NUMERIC,3) AS discount_trust_corr,
    ROUND(CORR(discount_percentage, discounted_price)::NUMERIC ,3) AS discount_price_corr
FROM silver.fact_product_persuasion
GROUP BY 1,2;
