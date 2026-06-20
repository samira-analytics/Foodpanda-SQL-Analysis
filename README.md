# Foodpanda-SQL-Analysis
SQL data cleaning and exploratory data analysis project using Foodpanda order data. Includes data transformation, duplicate handling, revenue analysis, customer insights, and product performance analysis.

Foodpanda Data Cleaning & Exploratory Data Analysis (SQL)
Project Overview

This project focuses on cleaning and analysing customer order data from Foodpanda using SQL. The objective was to improve data quality, prepare the dataset for analysis, and generate business insights related to customer behaviour, order activity, revenue trends, and product performance.

Business Problem

Food delivery platforms generate large volumes of customer and transaction data. Before meaningful analysis can be conducted, the data must be cleaned and standardised to ensure accuracy and consistency. This project demonstrates the process of transforming raw Foodpanda order data into a reliable dataset and using SQL to uncover key business insights.

Tools Used
MySQL
SQL
Window Functions
Aggregate Functions
Data Cleaning Techniques
Exploratory Data Analysis (EDA)
Data Cleaning Process

The following data cleaning steps were performed:

Created backup copies of the original dataset.
Checked for duplicate records using ROW_NUMBER().
Validated and assessed missing values across all columns.
Removed leading and trailing spaces using TRIM().
Converted date fields from text format to SQL DATE format.
Standardised the dataset structure for further analysis.
Exploratory Data Analysis

The analysis explored several key business metrics, including:

Customer Analysis
Total number of unique customers.
Customer distribution by city.
Order Analysis
Total number of orders placed.
Order activity across the dataset.
Revenue Analysis
Calculated order revenue using quantity × price.
Analysed monthly revenue trends to identify business performance over time.
Product Analysis
Identified the most popular dishes based on total quantity sold.
Highlighted top-performing menu items.
Key Skills Demonstrated
Data Cleaning
Data Transformation
Data Validation
SQL Window Functions
Aggregations and Grouping
Business Intelligence
Exploratory Data Analysis
Revenue and Customer Analytics
Files Included
Practice Dataset - Foodpanda.sql
SQL scripts for data cleaning and analysis
Project Outcome

The project successfully transformed raw Foodpanda order data into a clean and structured dataset suitable for analysis. The resulting insights provide visibility into customer activity, sales performance, revenue trends, and product popularity, supporting data-driven business decision-making.
