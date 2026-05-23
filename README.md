# Online Bookstore Database & Analytics System

An end-to-end SQL project designed to model an online bookstore infrastructure, handle transactional operations, and extract data-driven business insights.

## 📊 Business Scenario
An online bookstore requires a robust relational database management system (RDBMS) to track inventory, maintain customer data, and process sales orders. This project builds the foundational schema and runs key analytical queries to help management optimize stock levels, track revenue, and analyze customer purchasing behavior.

## 🗄️ Database Architecture
The database consists of three main entities connected via relational constraints:
* **Books:** Tracks inventory details, pricing, and genres.
* **Customers:** Maintains client contact and location demographics.
* **Orders:** Bridges customers and books to record transactions.

## 🚀 Key Features & SQL Techniques Used
* **DDL & DML:** Schema creation with primary and foreign key constraints.
* **Data Aggregation:** Using `SUM()`, `AVG()`, and `COUNT()` to calculate revenue, stock levels, and order patterns.
* **Relational Joins:** Implementing `INNER JOIN` and `LEFT JOIN` to combine metrics across multiple tables.
* **Advanced Analytical Filtering:** Utilizing `GROUP BY`, `HAVING`, and `COALESCE()` to isolate top spending habits and manage real-time inventory remaining.

## 📈 Sample Business Insights Solved
Here are a few critical business questions answered by the script:
1. **Inventory Control:** *What is our remaining stock balance after deducting processed sales?* (Solved using a `LEFT JOIN` combined with `COALESCE` to prevent null errors).
2. **Customer Segmentation:** *Which customers have ordered at least twice?* (Solved using `HAVING COUNT(order_id) >= 2`).
3. **Revenue Analysis:** *Which customer is our highest spender to date?* (Solved via multi-table joins and aggregations).

## 💻 How to Run
1. Clone the repository.
2. Run the `Scripts/bookstore_queries.sql` file in your preferred SQL environment (MySQL, PostgreSQL, etc.).
