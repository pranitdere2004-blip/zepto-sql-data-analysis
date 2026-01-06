# Zepto SQL Data Analysis Project

## Project Overview:
The Zepto SQL Data Analysis Project is a database-driven analytical project designed to explore and analyze product-level data from Zepto using SQL.
This project focuses on understanding pricing, discounts, inventory distribution, and category-wise performance to generate meaningful business insights.

The project uses SQL queries to analyze real-world e-commerce data and supports data-driven decision-making related to pricing strategy, inventory management, and product performance.

---

## Objectives:
- Analyze product pricing and discount patterns
- Identify best-value products based on discounts
- Perform category-wise revenue and inventory analysis
- Group products based on weight for logistics insights
- Generate meaningful business insights using SQL queries

---

## Technologies Used:
- **Database:** MySQL  
- **Language:** SQL  
- **Tools:** MySQL Workbench, Microsoft Excel  

---

## Database Schema:
The project uses a single-table database design.

### Main Table:
- **zepto**
  - sku_id (Primary Key)
  - category
  - name
  - mrp
  - discountPercent
  - discountedSellingprice
  - quantity
  - weightInGrm
  - outOfStock

---

## Data Source:
- Dataset Source: Zepto product dataset
- File Format: Excel (.xlsx)
- The dataset was imported into MySQL after creating the table structure.

---

## Data Cleaning & Preparation:
- Removed products with zero MRP
- Converted price values from paise to rupees
- Checked for null values in important columns
- Ensured correct data types for numerical analysis

---

## Key Features:
- Discount-based product analysis
- Category-wise revenue estimation
- Price-per-gram value analysis
- Weight-based product grouping (Low, Medium, Bulk)
- Inventory weight and value analysis
- Business-focused SQL queries

---

## Sample SQL Queries:

```sql
-- Top 10 products with highest discount percentage
SELECT name, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10:

```

---

## Author:
**Pranit Dere**  
GitHub: https://github.com/pranitdere2004-blip/zepto-sql-data-analysis/edit/main/README.md

