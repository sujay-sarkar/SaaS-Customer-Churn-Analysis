USE saas_customer_churn;

SELECT * FROM customer_churn LIMIT 10;


-- 1. Churn Rate Overview
SELECT 
    Churn,
    COUNT(*) AS Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_churn), 2) AS ChurnRatePercent
FROM customer_churn
GROUP BY Churn;


-- 2. Churn by Subscription Type
SELECT
    SubscriptionType,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRatePercent
FROM customer_churn
GROUP BY SubscriptionType
ORDER BY ChurnRatePercent DESC;


-- 3. Churn by Engagement Buckets
SELECT
    CASE
        WHEN NumLoginsPerWeek <= 5 THEN 'Low (0-5)'
        WHEN NumLoginsPerWeek BETWEEN 6 AND 10 THEN 'Medium (6-10)'
        WHEN NumLoginsPerWeek BETWEEN 11 AND 15 THEN 'High (11-15)'
        ELSE 'Very High (16+)'
    END AS LoginBucket,
    COUNT(*) AS Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS ChurnRatePercent
FROM customer_churn
GROUP BY LoginBucket
ORDER BY ChurnRatePercent DESC;


-- 4. Churn by Tenure Buckets
SELECT
    CASE
        WHEN TenureMonths <= 3 THEN '0–3 months'
        WHEN TenureMonths BETWEEN 4 AND 6 THEN '4–6 months'
        WHEN TenureMonths BETWEEN 7 AND 12 THEN '7–12 months'
        ELSE '12+ months'
    END AS TenureBucket,
    COUNT(*) AS Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS ChurnRatePercent
FROM customer_churn
GROUP BY TenureBucket
ORDER BY ChurnRatePercent DESC;


-- 5. Churn by Support Tickets
SELECT
    CASE
        WHEN SupportTickets = 0 THEN '0'
        WHEN SupportTickets BETWEEN 1 AND 2 THEN '1–2'
        ELSE '3+'
    END AS TicketBucket,
    COUNT(*) AS Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS ChurnRatePercent
FROM customer_churn
GROUP BY TicketBucket
ORDER BY ChurnRatePercent DESC;


-- 6. Churn by Feature Usage
SELECT
    CASE
        WHEN FeatureUsageRate < 0.3 THEN 'Low Usage'
        WHEN FeatureUsageRate BETWEEN 0.3 AND 0.7 THEN 'Medium Usage'
        ELSE 'High Usage'
    END AS UsageBucket,
    COUNT(*) AS Customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS ChurnRatePercent
FROM customer_churn
GROUP BY UsageBucket
ORDER BY ChurnRatePercent DESC;