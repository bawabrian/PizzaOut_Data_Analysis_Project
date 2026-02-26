# 🍕 PizzaOut Sales Analytics Dashboard
### *SQL · Excel · Pivot Tables · Data Visualisation · Business Intelligence*

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft%20Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-2ECC71?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)
![Dataset](https://img.shields.io/badge/Dataset-Kaggle%20(Fictional)-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)
![Company](https://img.shields.io/badge/PizzaOut-Fictional%20Company-lightgrey?style=for-the-badge)

---

> [!WARNING]
> **⚠️ DISCLAIMER — Please Read Before Using**
>
> - 🍕 **PizzaOut is a fictional company**. It does not exist and is not affiliated with any real business.
> - 📂 The dataset used in this project is **fictional** and was sourced from **Kaggle** for practice and learning purposes only.
> - 📊 All revenue figures, order counts, pizza names, and performance metrics are **simulated** and do **not represent real business data**.
> - 💼 This project is part of a **personal professional portfolio** and is intended solely to demonstrate practical **SQL querying, data analysis, and Excel visualisation skills** in a realistic business context.

---

## 📸 Dashboard Preview

![PizzaOut Dashboard](./Dashboard_Pizza_Out.png)

> *A fully interactive Excel dashboard analysing simulated pizza sales data — built using SQL for data extraction and cleaning, pivot tables for aggregation, and Excel charts for visual storytelling.*

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Tech Stack & Workflow](#-tech-stack--workflow)
- [Key Metrics & Findings](#-key-metrics--findings)
- [SQL Analysis](#-sql-analysis)
- [Excel Workbook Structure](#-excel-workbook-structure)
- [Dashboard Features](#-dashboard-features)
- [Key Insights & Recommendations](#-key-insights--recommendations)
- [How to Use](#-how-to-use)
- [Project Structure](#-project-structure)
- [Disclaimer](#️-disclaimer)
- [Author](#-author)

---

## 🎯 Project Overview

This end-to-end data analytics project analyses **PizzaOut's simulated sales performance** using a two-tool pipeline — **MySQL** for querying and data preparation, and **Microsoft Excel** for pivot table analysis and dashboard visualisation.

The project demonstrates a complete analyst workflow: writing SQL queries against a relational database, importing results into Excel, building pivot tables to aggregate the data, and designing an interactive dashboard that communicates business insights clearly to a non-technical stakeholder.

### Business Questions Answered

| # | Question |
|---|----------|
| 1 | What is the total revenue, and what is the average order value? |
| 2 | Which days of the week generate the most orders? |
| 3 | What hours of the day are peak ordering times? |
| 4 | Which pizza sizes are most popular by percentage of sales? |
| 5 | Which pizza categories drive the most revenue? |
| 6 | What are the 5 best-selling and 5 worst-selling pizzas? |
| 7 | How many pizzas are sold per order on average? |

---

## 🛠️ Tech Stack & Workflow

```
RAW DATA (CSV / Kaggle)
        │
        ▼
  ┌─────────────┐
  │    MySQL    │  ── Data cleaning, aggregation & KPI extraction
  │  (SQL)      │  ── 12 queries across daily/hourly trends,
  └─────────────┘     categories, sizes & best/worst sellers
        │
        ▼
  ┌─────────────────┐
  │ Microsoft Excel │  ── Pivot tables for dynamic aggregation
  │  (Workbook)     │  ── Charts: bar, line, donut, pie
  └─────────────────┘  ── Interactive dashboard with timeline slicer
        │
        ▼
  DASHBOARD (Excel)  ── Final deliverable for stakeholder presentation
```

| Tool | Version | Purpose |
|------|---------|---------|
| **MySQL** | 8.x | Data cleaning, KPI queries, trend analysis |
| **Microsoft Excel** | 2019 / 365 | Pivot tables, charts, interactive dashboard |
| **Kaggle** | — | Source dataset (fictional pizza sales data) |

---

## 📊 Key Metrics & Findings

| Metric | Value |
|--------|-------|
| 💰 **Total Revenue** | **$817,860.05** |
| 🛒 **Average Order Value** | **$38.31** |
| 🍕 **Total Pizzas Sold** | **49,574** |
| 📦 **Total Orders Placed** | **21,350** |
| 🔢 **Average Pizzas Per Order** | **2.3** |

### 🔑 Top Findings at a Glance

- **Fridays and Saturdays** are the busiest days — Friday peaks at **3,538 orders**, Saturday at **3,158**
- **12:00–13:00** is the busiest hour of the day with **2,520 orders** — a clear lunch rush
- **Large pizzas** dominate sales at **45.89%** of total — the runaway favourite size
- The **Classic category** leads all categories with **14,888 pizzas** sold
- **The Classic Deluxe Pizza** is the #1 best seller at **2,453 units** sold
- **The Brie Carre Pizza** is the worst performer at just **490 units** sold — nearly 5× less than the top seller
- **Chicken category** contributes the highest revenue share at **26.91%**

---

## 💾 SQL Analysis

All data extraction and KPI calculations were performed in MySQL before being imported into Excel. The script (`Pizza_Out_Script.sql`) contains **12 queries** across five analytical themes.

### Query Index

| # | Query | Purpose |
|---|-------|---------|
| 1 | `Total Revenue` | `SUM(total_price)` across all orders |
| 2 | `Average Order Value` | Total revenue ÷ distinct order count |
| 3 | `Total Pizzas Sold` | `SUM(quantity)` |
| 4 | `Total Orders Placed` | `COUNT(DISTINCT order_id)` |
| 5 | `Average Pizzas per Order` | Total pizzas ÷ total orders |
| 6 | `Daily Trend` | `DAYNAME(order_date)` + order count by day |
| 7 | `Hourly Trend` | `HOUR(order_time)` + order count by hour |
| 8 | `% Sales by Category` | Revenue share per pizza category |
| 9 | `% Sales by Size` | Revenue share per pizza size |
| 10 | `Total Sold by Category` | `SUM(quantity)` grouped by category |
| 11 | `Top 5 Best Sellers` | `ORDER BY SUM(quantity) DESC LIMIT 5` |
| 12 | `Bottom 5 Worst Sellers` | `ORDER BY SUM(quantity) ASC LIMIT 5` |

### Sample Queries

**KPI — Total Revenue**
```sql
SELECT
  ROUND((SELECT SUM(total_price) FROM pizza_sales), 2)
  AS 'Total Revenue Generated';
```

**Daily Trend**
```sql
SELECT
  DAYNAME(order_date) AS `Order Day`,
  COUNT(DISTINCT order_id) AS `Total Orders`
FROM pizza_sales
GROUP BY DAYNAME(order_date);
```

**Top 5 Best Sellers**
```sql
SELECT
  pizza_name AS 'Pizza Name',
  SUM(quantity) AS 'Total Pizzas Sold'
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;
```

**% of Sales by Pizza Category**
```sql
SELECT
  pizza_category AS 'Pizza Category',
  ROUND(SUM(total_price), 2) AS 'Total Sales',
  ROUND(SUM(total_price) * 100 /
    (SELECT SUM(total_price) FROM pizza_sales), 2)
  AS 'Percentage of Sales'
FROM pizza_sales
GROUP BY pizza_category;
```

> 📄 See the full script: [`Pizza_Out_Script.sql`](./Pizza_Out_Script.sql)

---

## 📒 Excel Workbook Structure

The Excel workbook (`PizzaOut_Workbook_Final.xlsx`) is organised into multiple sheets, each serving a specific analytical purpose.

| Sheet | Contents |
|-------|---------|
| **Raw Data** | Source pizza sales data imported from the SQL export |
| **Pivot Tables** | 8 pivot tables aggregating data by day, hour, size, category, and pizza name |
| **KPI Calculations** | Calculated KPI values feeding the dashboard header cards |
| **Charts** | Individual chart sheets for each visualisation |
| **Dashboard** | Final interactive dashboard combining all visuals and a timeline slicer |

### Pivot Tables Built

| Pivot Table | Row Field | Value Field | Purpose |
|------------|-----------|-------------|---------|
| Daily Orders | `order_date` (day name) | COUNT of `order_id` | Daily trend bar chart |
| Hourly Orders | `order_time` (hour) | COUNT of `order_id` | Hourly trend line chart |
| Sales by Size | `pizza_size` | SUM of `total_price` | Size donut chart |
| Sales by Category | `pizza_category` | SUM of `total_price` | Category donut chart |
| Units by Category | `pizza_category` | SUM of `quantity` | Category bar chart |
| Top 5 Sellers | `pizza_name` | SUM of `quantity` (top 5) | Best sellers bar |
| Bottom 5 Sellers | `pizza_name` | SUM of `quantity` (bottom 5) | Worst sellers bar |
| Timeline | `order_date` | — | Interactive date slicer |

---

## ✨ Dashboard Features

The dashboard is laid out in a **3×3 grid** with a full-width KPI header strip at the top. All visuals are connected to pivot tables and respond to the **Toggle Timeline slicer** in the bottom-right panel.

### 📌 Header — KPI Strip
Five headline metrics displayed prominently across the top of the dashboard:

| Card | Value | Formula Basis |
|------|-------|---------------|
| Total Revenue | $817,860.05 | `=SUM(total_price)` |
| Average Order Value | $38.31 | `=Total Revenue / DISTINCT order_id` |
| Total Pizzas Sold | 49,574 | `=SUM(quantity)` |
| Total Orders Placed | 21,350 | `=COUNT(DISTINCT order_id)` |
| Average Pizzas Per Order | 2.3 | `=Total Pizzas / Total Orders` |

---

### 📈 Visual Panels

#### Panel 1 — Busiest Days & Times (Text Summary Card)
A narrative summary panel on the left that auto-updates based on the data:
- **TIME:** PizzaOut receives most of its orders in the evenings
- **DAYS:** PizzaOut is busiest on Fridays and Saturdays

#### Panel 2 — Daily Trends for Total Orders (Bar Chart)
Clustered bar chart showing order count per day of the week. Clearly shows the Friday–Saturday weekend peak.

| Day | Orders |
|-----|--------|
| Sunday | 2,624 |
| Monday | 2,794 |
| Tuesday | 2,973 |
| Wednesday | 3,024 |
| Thursday | 3,239 |
| **Friday** | **3,538** |
| Saturday | 3,158 |

#### Panel 3 — Hourly Trends for Total Orders (Line Chart)
Line chart plotting order volume against each hour of the day (9 AM – 11 PM). Reveals two distinct peaks:
- **Lunch rush:** 12:00–13:00 (2,520 & 2,455 orders)
- **Dinner rush:** 17:00–18:00 (2,336 & 2,399 orders)

#### Panel 4 — Sales by Size and Category (Text Summary Card)
Narrative insight card highlighting the dominant size and category:
- **SIZE:** The 'Large' pizza is the most popular offering
- **CATEGORY:** The 'Classic' Category is the most popular offering

#### Panel 5 — % of Sales by Pizza Size (Donut Chart)
Donut chart showing revenue share across 5 pizza sizes:

| Size | Revenue Share |
|------|--------------|
| **Large** | **45.89%** |
| Medium | 30.49% |
| Regular | 21.77% |
| X-Large | 1.72% |
| XX-Large | 0.12% |

#### Panel 6 — % of Sales by Pizza Category (Donut Chart)
Donut chart showing revenue contribution by category:

| Category | Revenue Share |
|----------|--------------|
| **Chicken** | **26.91%** |
| Classic | 26.91% |
| Supreme | 25.46% |
| Veggie | 23.68% |

#### Panel 7 — Best and Worst Sellers (Text Summary Card)
Narrative card summarising the performance extremes:
- **BEST:** Classic Deluxe and The Barbecue Chicken Pizza are the best sellers
- **WORST:** The Brie Carre Pizza is the least popular item in the menu

#### Panel 8 — 5 Best Sellers by Total Pizzas Sold (Bar Chart)
| Rank | Pizza Name | Units Sold |
|------|-----------|-----------|
| 1 | The Classic Deluxe Pizza | 2,453 |
| 2 | The Barbecue Chicken Pizza | 2,432 |
| 3 | The Hawaiian Pizza | 2,422 |
| 4 | The Pepperoni Pizza | 2,418 |
| 5 | The Thai Chicken Pizza | 2,371 |

#### Panel 9 — 5 Worst Sellers by Total Pizzas Sold (Bar Chart)
| Rank | Pizza Name | Units Sold |
|------|-----------|-----------|
| 1 | The Soppressata Pizza | 961 |
| 2 | The Spinach Supreme Pizza | 950 |
| 3 | The Calabrese Pizza | 937 |
| 4 | The Mediterranean Pizza | 934 |
| 5 | **The Brie Carre Pizza** | **490** |

#### Panel 10 — Total Pizza Sold by Pizza Category (Bar Chart)
| Category | Units Sold |
|----------|-----------|
| **Classic** | **14,888** |
| Supreme | 11,987 |
| Veggie | 11,649 |
| Chicken | 11,050 |

#### Panel 11 — Toggle Timeline (Interactive Slicer)
An Excel timeline slicer connected to all pivot tables. Allows filtering the entire dashboard by date range (by month). Can be toggled between All Periods and any custom date window, making the dashboard fully interactive for stakeholder presentations.

---

## 💡 Key Insights & Recommendations

> 📌 The following insights are analytical exercises drawn from a **fictional dataset** and are not real business recommendations.

### 1. 🗓️ Maximise Friday & Weekend Operations
Friday is the single busiest day (3,538 orders). Ensuring maximum staff, inventory, and delivery capacity on Fridays and Saturdays should be the primary operational priority.

### 2. 🕛 Staff for Two Distinct Rush Windows
There are two clear daily peaks — a lunch rush at 12:00–13:00 and a dinner rush at 17:00–18:00. Scheduling should target these windows specifically rather than maintaining uniform staffing throughout the day.

### 3. 🍕 Large Pizza Is the Core Product
At 45.89% of all sales by revenue, the Large pizza is the clear market winner. Promotions, bundles, and upsells should default to Large as the anchor offering.

### 4. 🏆 Protect the Classic Category
The Classic category leads in both units sold (14,888) and is tied for top revenue share. New menu additions should be positioned carefully to avoid cannibalising Classic category demand.

### 5. 🔴 Re-evaluate or Remove The Brie Carre Pizza
At just 490 units sold — less than a quarter of the top seller — The Brie Carre Pizza is a strong candidate for removal or reformulation. Its shelf space and prep capacity could be reallocated to the top-performing lines.

### 6. 📉 Investigate the Bottom 5 Consistently
The gap between the best seller (2,453 units) and the 5th worst seller (934 units) is 2.6×. A quarterly review of the bottom performers against menu addition costs would help keep the product line lean and profitable.

---

## 🚀 How to Use

### Prerequisites
- [MySQL Community Server](https://dev.mysql.com/downloads/) (free) — version 8.x recommended
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) or any SQL client
- Microsoft Excel 2016 or later (pivot tables and timeline slicer required)

### Step 1 — Set Up the Database

```sql
-- Create and select your database
CREATE DATABASE pizzaout_db;
USE pizzaout_db;

-- Import the pizza_sales table
-- (Load from the CSV dataset available on Kaggle)

-- Run the analysis script
SOURCE Pizza_Out_Script.sql;
```

### Step 2 — Run the SQL Queries

```bash
# Open MySQL Workbench
# Connect to your local MySQL instance
# Open Pizza_Out_Script.sql
# Execute each query section individually (Ctrl+Enter per block)
# Export results to CSV for Excel import
```

### Step 3 — Open the Excel Workbook

```
1. Open PizzaOut_Workbook_Final.xlsx in Microsoft Excel
2. If prompted about external connections, click "Enable Content"
3. Navigate to the 📊 Dashboard sheet (last tab)
4. Use the Toggle Timeline slicer (bottom right) to filter by date range
5. Hover over any chart for tooltip detail
6. Click any chart segment to cross-highlight related data
```

### Step 4 — Clone This Repository

```bash
# Clone the repository
git clone https://github.com/bawabrian/pizzaout-sales-dashboard.git

# Navigate to the project folder
cd pizzaout-sales-dashboard
```

---

## 📁 Project Structure

```
pizzaout-sales-dashboard/
│
├── 📄 README.md                       # This file
├── 💾 Pizza_Out_Script.sql            # All 12 SQL queries for KPIs & trends
├── 📊 PizzaOut_Workbook_Final.xlsx    # Excel workbook with pivot tables & dashboard
├── 📸 Dashboard_Pizza_Out.png         # Dashboard screenshot (preview image)
└── 📁 data/
    └── pizza_sales.csv                # Source dataset (Kaggle — fictional)
```

---

## ⚠️ Disclaimer

This project is a **personal portfolio piece** built for learning and skill demonstration purposes only.

| | |
|---|---|
| 🍕 **Company** | **PizzaOut is a fictional company**. It does not exist and has no affiliation with any real pizza brand or business. |
| 📂 **Dataset** | Fictional pizza sales dataset sourced from [Kaggle](https://www.kaggle.com). This is **not** real transactional data from any company. |
| 📊 **Figures & Metrics** | All revenue figures, order counts, pizza names, and performance metrics are **simulated**. They do not represent the actual performance of any business. |
| 💼 **Intent** | This project exists solely to showcase **SQL querying, Excel pivot table analysis, and data dashboard visualisation skills** in a realistic business context. |

---


---

## 📬 Author

**Brian Bawa**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/brian-bawa/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/bawabrian)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:brianbawa@gmail.com)

---


---

<div align="center">

⭐ **If you found this project useful, please give it a star!** ⭐

*Built with 🍕 using MySQL & Excel · Dataset from Kaggle · Portfolio Project · PizzaOut is a fictional company*

</div>
