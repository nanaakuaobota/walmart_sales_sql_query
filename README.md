# Walmart Sales

## Introduction

The growth of supermarkets in most populated cities are increasing and market competitions are also high.This project seeks to delve into Walmart sales data to identify top-performing branches and products, discern sales trends, and analyze customer behavior. The objective is to uncover insights that can inform and optimize sales strategies, enhancing the overall performance of the retail giant.

## About DataSet

The dataset contains sales transactions from a three different branches of Walmart over a period of three months,it contains 17 columns and 1000 rows. Find dataset [here](https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales?utm_medium=social&utm_campaign=kaggle-dataset-share&utm_source=twitter). 


| Column                  | Description                             
| :---------------------- | :--------------------------------------------------------- | 
| invoice_id              | Computer generated sales slip invoice identification number
| branch                  | Branch of supercenter (3 branches are available identified by A, B and C). |                     
| city                    | Location of supercenters            |   
| customer_type           | Type of customers, recorded by Members for customers using member card and Normal for without member card.
| gender                  | Gender type of the customer   |  
| product_line            | General item categorization groups - Electronic accessories, Fashion accessories, Food and beverages, Health and beauty, Home and lifestyle, Sports and travel
| unit_price              | The price of each product in $             |
| quantity                | Number of products purchased by customer       |           
| VAT                     | 5% tax fee for customer buying   |
| total                   | Total price including tax         |  
| date                    | Date of purchase (Record available from January 2019 to March 2019) |        
| time                    | Time: Purchase time (10am to 9pm) |     
| payment_method          | Payment used by customer for purchase (3 methods are available – Cash,Credit card and Ewallet) | | cogs                    | Cost of goods sold                      |  
| gross_margin_percentage | Gross margin percentage                 |   
| gross_income            | Gross Income                            | 
| rating                  | Rating                                  | 


## Methodology

#### Database Creation And Data Import
- Created the 'walmart_sales' database
- Created 'sales' table to insert the data to be imported
- Imported the data, check [here](sql-walmart-import.PNG)

#### Feature Engineering 
I created some new columns from existing ones;
- month_name that contains the extracted months of the year which the given transaction took place (Jan, Feb, Mar). This was to determine which months contributed to sales and profit.
- time_of_day column to give insight of sales in the Morning, Afternoon and Evening. 
-  day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

#### Data Query and Exploratory Data Analysis (EDA)
- Executed SQL queries to answer specific questions thus identifying patterns and trends.

#### Data Visualization :
- Loaded the analyzed [data](powerbi-load.PNG) from the database for visualization in Power BI, ensured that the data exported maintained it's integrity and completeness for accurate visualization.
- Utilized Power BI to create interactive visualizations.

#### Documentation and Reporting:
- Documented the entire process, including database setup, data import, analysis steps, and visualization techniques, for future reference and reproducibility.

  ### Tools Used
  - My SQL
  -  PowerBI
 
    ### Insights
  - Branch C in Naypyitaw recorded the highest sales, totaling $110,568.71, while branch B in Mandalay had the lowest sales, amounting to $106,197.67. It is interesting to note that the total sales figures for both branches B and A are quite close, as branch A made total sales of $106,200.37.
    
  - The 'Food and Beverages' product line was recorded as the most profitable, totaling $56,144.84, while the 'Health and Beauty' products were the least profitable, totaling $49,193.74.
 
  - The store achieved its highest sales in January, totaling $116,291.87. Interestingly, sales peak on Saturdays and Tuesdays, indicating these days are particularly lucrative for the store.
 
  - Female customers contribute predominantly to sales, with a notable preference for the 'Food and Beverages' product line.
    Male customers on the other hand tend to favor the 'Health and Beauty' product line in their purchases.

  - Customers exhibit a tendency to make the majority of their purchases during the evening hours.
 
  - The 'Member' customer type significantly contributes to sales, and the preferred payment method among customers is cash

### Recommendations

- Implement strategies such as feedback collection from customers to understand their preferences and pain points,strengthen the store's online presence through social media, a dedicated website, or e-commerce platforms to boost sales at Branch B in Mandalay and Branch A in Yangon.

- Poorly performing product lines especifically the Health and beauty product line should be placed in strategic positions to ensure visibility to prospective customers. Also the stock of 'Food and Beverages' products should be increased to meet customer demand and ensure adequate availability and also increase revenue.

- Focus on increasing staffing during peak sales days and times, particularly Saturdays,Tuesdays and evenings.Allocate resources to staff to meet increased demand and ensure a seamless shopping experience for customers.

- Introduce promotional activities, targeted marketing campaigns, and community engagement initiatives to in boost the store's overall performance and foster growth.


## Code and PowerBI Report(Dashboard)
 - For the sql syntaxes check [here](sql_queries.sql)
 - Interact with the PowerBI dashboard [here]()

### Conclusion
In conclusion, this project provided a hands-on opportunity to explore Walmart sales data using SQL and Power BI. Through this endeavor, I honed my skills in data querying, analysis, and visualization, gaining valuable insights into sales trends and customer behavior. It's been a rewarding experience that reaffirmed my passion for data analytics and continuous learning in the field.
  
