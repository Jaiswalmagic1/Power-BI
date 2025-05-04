# 🍕 Pizza Sales Dashboard (Power BI)

This repository contains an interactive and dynamic Power BI dashboard visualizing detailed insights from pizza sales data. It was created using a flat Excel file that was imported into SQL for preprocessing and validation. Every metric, KPI, and visualization shown in the report has been backed and validated using SQL queries, which are also included in this repository.

---


## 📷 Screenshots

### 📌 Page 1 – Overview  
![Main Dashboard](https://github.com/Jaiswalmagic1/Power-BI/blob/main/Pizza%20Sales%20Dashboard/Dashboard.png)

### 📌 Page 2 – Best/Worst Performers  
![Second Page](https://github.com/Jaiswalmagic1/Power-BI/blob/main/Pizza%20Sales%20Dashboard/Dashboard%202.png)

---

## 📊 Key Features

### 🔹 Dynamic KPIs (Top Row)
The top section of the report includes key performance indicators that respond instantly to any filters applied:
  - **Total Revenue**
  - **Average Order Value**
  - **Total Pizzas Sold**
  - **Total Orders**
  - **Average Pizzas Per Order**

### 🔹 Daily and Monthly Trends
- **Daily Trend for Total Orders** helps identify the busiest days in the week.
- **Monthly Trend for Total Orders** reveals seasonal trends and monthly patterns.

### 🔹 Category & Size Insights
  - **% of Sales by Pizza Category** and **Pizza Size** help understand which categories and sizes drive the most sales.
  - **Total Pizzas Sold by Pizza Category** is a bar chart showing category-wise volumes.

### 🔹 🔁 Dynamic Narrative Texts
A standout feature of this dashboard is the **dynamic textual summaries** on the left panel:
  - These change based on filters selected (e.g., date range, pizza category).
  - They dynamically display the **busiest day**, **top-performing pizza**, and **monthly highlights**.
  - The goal is to blend narrative storytelling with data visuals — offering not just charts but also insights in plain English that adjust automatically.

---

## 🧮 DAX Measures Used

Many custom **DAX measures** were created to power the dynamic visuals and KPIs. These include:
  - Total Revenue
  - Average Order Value
  - Total Orders
  - Pizzas Sold
  - Avg. Pizzas per Order
  - Top Pizza by Revenue / Orders / Quantity
  - Daily / Monthly Trends
  - Filter-based summaries

All these measures were cross-validated with SQL queries before building the visuals.

---

## 🗂 Page 2 – Best and Worst Sellers

The second page deep-dives into **top and bottom performers**, with two structured rows:

### Top 5 Pizzas (Based On):
  - **Revenue**
  - **Quantity Sold**
  - **Number of Orders Received**

### Bottom 5 Pizzas (Based On):
  - **Revenue**
  - **Quantity Sold**
  - **Number of Orders Received**

Each of these is reinforced by dynamic explanatory text on the left side that updates with filters, showcasing the worst and best sellers depending on user selections.

---

## ⚙️ Process & Validation

1. **Data Source**: The raw dataset was originally an Excel file in flat-table format.
2. **SQL Preprocessing**:
   - The file was loaded into SQL Server.
   - All relevant measures (like revenue, quantity, orders) were calculated and validated using SQL queries.
   - These SQL queries and their outputs were saved in a Word document (included in the repo) to guide and verify Power BI development.
3. **Power BI Development**:
   - Measures were recreated in DAX using SQL logic.
   - Visuals were built and aligned with SQL-verified outputs to ensure accuracy.

---

## 📁 Repository Contents

- `Pizza_Sales_Dashboard.pbix` – Power BI dashboard file
- `Pizza Sales.docx` – SQL queries and results used for validation
- `SQL_Queries.sql` - SQL Query File
- `Pizza_sales_data.csv` – The raw dataset 
- Dashboard screenshots (see below)

---

## 📬 Contact

For queries, discussions, or collaboration:  
**Vishal Jaiswal**

---

