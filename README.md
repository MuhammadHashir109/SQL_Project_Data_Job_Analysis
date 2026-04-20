# SQL Project: Data Job Analysis

## Project Overview
This project analyzes job postings, company data, and skill requirements using SQL. The goal is to generate insights about top-paying jobs, in-demand skills, and optimal skill combinations for career planning.

## Key Components
- `csv_files/`: Source CSV datasets used for analysis
  - `company_dim.csv`
  - `job_postings_fact.csv`
  - `skills_dim.csv`
  - `skills_job_dim.csv`
- `sql_load/`: SQL scripts for database setup and table creation
  - `1_create_database.sql`
  - `2_create_tables.sql`
  - `3_modify_tables.sql`
- `Project_sql/`: Final project queries and analysis scripts
  - `1_top_paying_jobs.sql`
  - `2_top_paying_skills.sql`
  - `3_top_demanding_skills.sql`
  - `4_top_skills_by_salary.sql`
  - `5_top_optimal_skills.sql`
- `advanced_sql/`: Supplemental SQL examples and practice queries
  - `Case.sql`
  - `CTEs.sql`
  - `Problem2CTEs.sql`
  - `ProblemCTEs.sql`
  - `quarter1.sql`
  - `Subqueries.sql`
  - `union.sql`
  - `unionall.sql`

## Goals
- Identify the highest paying jobs from the job postings dataset
- Discover skills that correlate with higher salaries
- Find the most demanded skills across job postings
- Analyze skill combinations to recommend optimal learning paths

## Getting Started
1. Load the CSV files into your SQL database.
2. Run the scripts in `sql_load/` to create and modify the database schema.
3. Execute the queries in `Project_sql/` to generate analysis results.

## Notes
- This README is a temporary placeholder to document the current project layout and purpose.
- The repository is focused on SQL-based data analysis and may be expanded with additional datasets or visualizations.
