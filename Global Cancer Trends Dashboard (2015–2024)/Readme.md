# Global Cancer Trends Dashboard (2015–2024)

This interactive Power BI dashboard presents a multi-dimensional view of global cancer trends from 2015 to 2024. It offers insights into patient demographics, disease severity, treatment costs, and associated risk factors.

📊 **Data Source:**  
[Global Cancer Patients 2015–2024 – Kaggle](https://www.kaggle.com/datasets/zahidmughal2343/global-cancer-patients-2015-2024/data)

---

## 📘 1. Executive Summary

<img width="705" alt="Dashboard" src="https://github.com/user-attachments/assets/26bbf803-1a5c-41f6-86f6-78c5d6a2df3e" />

- 📉 **YoY Growth Rate:** Cancer cases saw a slight decline in 2024 with a YoY drop of -0.89%.
- 🌍 **Top Affected Country:** Australia ranks highest in total cases across the 10-year span.
- 🔬 **Most Common Cancer Type:** Colon cancer is the most frequently reported.
- ⚖️ **Gender Split:** Male-to-female ratio is nearly 1:1, indicating balanced gender distribution.
- 💰 **Treatment Cost:** Average treatment cost per patient is estimated at **$52.47K**.

---

## 🌍 2. Global Distribution

<img width="705" alt="Global Distribution" src="https://github.com/user-attachments/assets/fa78ad54-1585-45aa-8943-5da29697253f" />

- 🗺️ **Geographic Spread:** Australia, UK, and USA consistently top the patient volume across years.
- 🔥 **Heatmap Insight:** The distribution of cancer types like Colon, Leukemia, and Lung is uniform across countries.
- 🧮 **Country Trends:** Most countries show a steady trend in yearly case volumes, with slight fluctuations.

---

## 💰 3. Treatment Cost Analysis

<img width="703" alt="Treatment Cost" src="https://github.com/user-attachments/assets/eb301ebe-4e8d-40a0-9941-5ebbd252def5" />


- 🧾 **Cost by Year:** Treatment costs peaked between 2017–2020, followed by a dip and a recovery in 2024.
- 🧬 **Cost by Cancer Type:** Colon, Prostate, and Leukemia account for the highest total treatment expenditure.
- 👴 **Cost by Age:** Individuals aged 70–75 account for the highest share of treatment costs.
- 🧭 **Stage-wise Costs:** All stages contribute evenly to total costs, with Stage I slightly leading at ~$529M.

---

## 👥 4. Age and Gender Analysis

<img width="704" alt="Age   Gender" src="https://github.com/user-attachments/assets/d784048b-6b7a-47fe-aa42-e9fe4a59e6c4" />


- 🧑‍🦳 **Age Group with Highest Cases:** Ages 31–40 record the most cases along with the highest average severity (4.97).
- ⚕️ **Gender Consistency:** Cancer types are distributed almost equally across male, female, and other genders.
- 🔬 **Cancer Type by Age:** Younger groups lean toward Breast and Leukemia, while older groups show more Prostate and Lung.
- 📊 **Severity by Stage:** Severity remains consistent across stages, averaging ~4.95 across all.

---

## 🧬 5. Survival & Risk Factors

<img width="704" alt="Survival" src="https://github.com/user-attachments/assets/2af51cc6-5fd2-4e3e-928d-324f5b7a5f3d" />


- 📉 **Survival by Stage:** Average survival drops from 5.04 years in Stage III to 4.98 years in Stage IV.
- 🧪 **Survival by Type:** Skin and Breast cancers show the shortest average survival durations.
- 🧓 **Survival by Age:** Elderly patients (71+) and younger adults (31–40) show reduced survival despite higher diagnosis rates.
- ⚠️ **Risk Factors:** Average scores (0–10 scale) remain stable:  
  - Smoking: 4.99  
  - Obesity: 4.99  
  - Alcohol Use: 5.01  
  - Air Pollution: 5.01  
  - Genetic Risk: 5.00  
  - Target Severity Score: 4.95

---

📌 This dashboard provides a robust foundation for public health officials, researchers, and policy-makers to monitor, compare, and act on global cancer trends with greater precision and clarity.

## 🛠️ Process & Documentation

### 1. Data Preparation in SQL Server
- Imported the Kaggle dataset as a SQL Server table named `cancer`.
- Verified column data types and added necessary constraints (e.g., non-null `Patient_ID`).

### 2. Data Enhancement
- Created a new `Date` column using: `DATE([Year], 1, 1)` for time intelligence support.
- Related this `Date` column to a standard Calendar Table for accurate DAX time functions.

### 3. Calculated Fields via SQL
Defined all calculations necessary for dashboard visuals and KPIs, including:
- Total Cases by Year, Country, Type, Age Group, and Gender.
- Year-over-Year Growth using `LAG()`.
- Most Common Cancer Type and Top Affected Country using `TOPN()`.
- Average Treatment Cost and Severity by Cancer Type and Stage.
- Grouped Age Bins for demographic analysis.
- Risk factor averages: Smoking, Alcohol Use, Obesity, Genetic Risk, and Air Pollution.

### 4. Documentation Before Power BI Build
- Created a Business Requirement Document (BRD) to define goals, scope, stakeholders, and visuals.
- Defined a KPI Table including metric names, formulas, and business relevance.
- Outlined a Visualization Specification Document for each chart: name, data used, chart type, and purpose.
- Compiled a Calculation Definition Document listing every SQL logic required.

---

## 📁 Repository Contents – Global Cancer Trends Dashboard

This repository contains all supporting files and documentation for the **Global Cancer Trends Dashboard (2015–2024)** project. Each file plays a specific role in ensuring the dashboard is well-documented, data-driven, and presentation-ready.

---

### 🗂️ Folders

### `Snips/`
Contains all the screenshots of the Power BI dashboard pages used for documentation, review, or presentation.

---

### 📄 Documents

### `Business Requirement Document.docx`
Defines the project's goals, target audience, KPIs, and overall scope of the Power BI dashboard.

### `SQLQuery.sql`  
Contains raw SQL scripts used for data validation, transformation logic, and creation of calculated fields before importing to Power BI.

### `Visualization Specification.docx`
Lists and explains each planned visualization, including:
- Visualization Name
- Data Used
- Type of Chart
- Purpose and Benefit to the End User

### `Calculation Query Document.docx`
Breaks down each calculated metric used in the dashboard and maps them to the relevant visual or KPI. Ideal for writing SQL queries and validating logic.

### `Global Cancer Trends Dashboard (2015–2024).pbix`
The Power BI report file containing the complete interactive dashboard with all pages, slicers, visuals, and DAX measures.

### `README_Global_Cancer_Dashboard.md`
Provides a structured summary of dashboard insights by page, including:
- Key observations
- Data source reference
- Project documentation
- SQL and Power BI build process

---

### 📊 Data & Themes

### `global_cancer_patients_2015_2024.xlsx`
The raw dataset sourced from Kaggle, cleaned and imported into SQL Server for data modeling.

### `Global_Cancer_Dashboard_Theme.json`
Custom Power BI theme file designed for this project with medical-friendly colors and consistent formatting.

### `Color Theme.docx`
Quick-reference document for the hex codes, use cases, and styling rules followed in the dashboard.

---

📌 This dashboard provides a robust foundation for public health officials, researchers, and policy-makers to monitor, compare, and act on global cancer trends with greater precision and clarity.
"""
## 📬 Contact

**Vishal Jaiswal**  
🔗 [LinkedIn](https://www.linkedin.com/in/vishal-jaiswal-data/)  
📧 [Email](jaiswalmagic1@example.com)
📧 [Visit my Blog Website](https://CuriousClub.in)

---

If you find this project helpful, feel free to ⭐️ the repository and connect with me!
