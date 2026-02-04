SaaS Customer Churn Analysis | SQL + Power BI

Overview

    This project is an interactive Customer Churn Analytics Dashboard built in Power BI to analyze churn behavior, customer engagement, subscription performance, and retention patterns in a SaaS business.
    SQL was used to explore the dataset, segment customers, and identify churn drivers before visualizing insights in Power BI for data-driven decision making.

Key Metrics

    - Total Customers

    - Churned Customers

    - Churn Rate (%)

    - Average Customer Tenure

    - Average Weekly Engagement (Logins per Week)

Filters (Slicers) Used

    The dashboard includes the following interactive filters:

    - Subscription Type: Basic, Standard, Premium, Enterprise

    - Country

    - Gender

    - Churn Status (Yes / No)

    All KPIs and visuals dynamically update based on selected filters.

Insights Covered

    - Overall churn distribution and retention performance

    - Churn comparison across subscription plans

    - Tenure-based churn trends

    - Customer engagement impact on churn

    - Support ticket behavior among churned users

    - Feature usage patterns affecting retention

Key Business Takeaways

    - Customers in their early tenure period show higher churn risk

    - Lower engagement users churn significantly more than active users

    - Certain subscription plans experience relatively higher churn

    - Increased support interactions correlate with churn behavior

    - Higher feature adoption improves customer retention

    - These insights can help SaaS companies improve onboarding, engagement strategies, and customer support processes.

Tools Used

    - MySQL — SQL analysis and segmentation

    - Power BI — interactive dashboard and visualization

    - Power Query — data cleaning and transformation

    - DAX — KPI calculations and churn metrics

How to Use

    Open Customer Churn Dashboard.pbix in Power BI Desktop

    Use slicers to explore churn patterns across different customer segments

SQL Analysis

    The file customer_churn_sql_analysis.sql contains SQL queries used to:

    - Calculate churn rates

    - Segment customers by tenure, engagement, and behavior

    - Identify major churn drivers

    To run the SQL analysis:

    - Import SaaS_Customer_Churn_Dataset.csv into MySQL

    - Create a table named customer_churn

    - Execute queries in MySQL Workbench

Author

    Sujay Sarkar
    Data Analyst
