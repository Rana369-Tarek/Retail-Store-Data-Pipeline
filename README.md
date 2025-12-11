# Retail-Store-Data-Pipeline
End-to-End Retail Data Pipeline Project with Python and SQL Server

### **1️⃣ Project Title**

-   **Retail Store Data Pipeline & Analysis**
    

### **2️⃣ Project Overview**

-   Short description of the project:
    
    > This project demonstrates an **end-to-end data pipeline** for a retail store using Python, Pandas, and SQL Server.  
    > It includes data loading, cleaning, transforming, database creation, SQL analysis, and visualization.
    

### **3️⃣ Folder Structure**

-   Explain the folder organization :
    

`clean/ # Python script: main.py (Loading, Cleaning, Transforming) data/ # Original or cleaned CSV datasets sql/ # SQL Server backup + queries + schema python_final_report/ # Analysis visuals and Python report CSV README.md # Project documentation` 

### **4️⃣ Data Sources**

-   List of CSV files used:
    
    -   `products.csv`, `brands.csv`, `categories.csv` …
        

### **5️⃣ Python Script (clean/main.py)**

-   Explain what the script does:
    
    -   Loads all CSV files
        
    -   Cleans missing values, duplicates, and formats
        
    -   Transforms data (merges tables, calculates totals, standardizes phone numbers)
        

### **6️⃣ SQL Server**

-   Explain database creation and loading:
    
    -   Database: `RetailDB`
        
    -   Tables: Brands, Categories, Products, Customers, Orders, OrderItems, Staffs, Stores, Stocks
        
    -   Primary keys, foreign keys, normalization (up to 3NF)
        
    -   Loaded via Python (SQLAlchemy)
        

### **7️⃣ SQL Analysis Queries**

-   Describe the analytical queries included in `analysis_queries.sql`:
    
    -   Sales Analysis: top products, top customers, revenue per store/category, monthly sales trend
        
    -   Inventory Analysis: low stock products, stores with highest inventory
        
    -   Staff Performance: orders per staff, best-performing staff
        
    -   Customer Insights: customers with no orders, average spending per customer
        

### **8️⃣ Python Final Report**

-   Explain what’s included:
    
    -   Visualizations using Matplotlib & Seaborn
        
    -   CSV report (`Python_Report.csv`)
        
    -   Folder `retail_analysis_visuals/` with all plots
        

### **9️⃣ How to Run**

-   Steps to run the project:
    
    1.  Install dependencies (`pandas`, `sqlalchemy`, `matplotlib`, `seaborn`, `pyodbc`)
        
    2.  Place CSV files in `data/` folder
        
    3.  Run `clean/main.py` to clean and transform data
        
    4.  Load data into SQL Server
        
    5.  Run SQL queries from `sql/analysis_queries.sql`
        
    6.  Generate Python visualizations
        

### **🔟 Insights / Notes**

-   Any important observations from analysis, e.g.:
    
    -   Best-selling products
        
    -   Customers with highest spending
        
    -   Stores with low inventory
