# Table used: customers_csv
# Focus: SELECT → WHERE → AND → OR → Combined Conditions → LIMIT


# 1. Show first 5 records
SELECT *
FROM Loans_db.customers_csv
LIMIT 5;

# This query retrieves all columns (*) from the table.
# LIMIT 5 restricts the output to only the first 5 rows.
# Useful when you want to quickly preview the dataset without loading everything.


# 2. Show only custID, Gender and ApplicantIncome
SELECT custID, Gender, ApplicantIncome
FROM Loans_db.customers_csv
LIMIT 10;

# Instead of selecting all columns, we explicitly choose only 3 columns.
# This improves readability and performance, especially in large datasets.
# LIMIT ensures we don’t overload the output.


# 3. Find customers who are Graduates
SELECT *
FROM Loans_db.customers_csv
WHERE Education = 'Graduate'
LIMIT 10;

# WHERE filters rows before displaying results.
# Only rows where Education column exactly matches 'Graduate' are returned.
# SQL scans each row and keeps only matching ones.


# 4. Find female customers
SELECT *
FROM Loans_db.customers_csv
WHERE Gender = 'Female'
LIMIT 10;

# Similar to previous query, but filtering on Gender.
# This demonstrates how categorical/text filters work in SQL.


# 5. Find customers with income greater than 5000
SELECT *
FROM Loans_db.customers_csv
WHERE ApplicantIncome > 5000
LIMIT 10;

# This uses a numeric condition.
# SQL evaluates the condition for each row and keeps rows where income is greater than 5000.
# Comparison operators like >, <, >= are commonly used in business analysis.


# 6. Find female customers who are Graduates
SELECT *
FROM Loans_db.customers_csv
WHERE Gender = 'Female' AND Education = 'Graduate'
LIMIT 10;

# AND means BOTH conditions must be true for a row to be selected.
# SQL checks Gender first, then Education, and only keeps rows satisfying both.
# This is useful for narrowing down very specific segments.


# 7. Find married customers with credit history = 1
SELECT *
FROM Loans_db.customers_csv
WHERE Married = 'Yes' AND Credit_History = 1
LIMIT 10;

# Again using AND, but now combining business logic:
# Married status + credit worthiness.
# This mimics real scenarios like loan approval filtering.


# 8. Find customers who are Graduate OR Self Employed
SELECT *
FROM Loans_db.customers_csv
WHERE Education = 'Graduate' OR Self_Employed = 'Yes'
LIMIT 10;

# OR means ANY one condition being true is enough.
# SQL returns rows where either condition matches.
# This increases the result size compared to AND.


# 9. Find customers who are Female OR from Rural area
SELECT *
FROM Loans_db.customers_csv
WHERE Gender = 'Female' OR Property_Area = 'Rural'
LIMIT 10;

# SQL checks both conditions independently.
# If a row satisfies at least one condition, it is included.
# Useful when combining different types of filters (demographic + location).


# 10. Find customers who are Female AND (Graduate OR Self Employed)
SELECT *
FROM Loans_db.customers_csv
WHERE Gender = 'Female'
AND (Education = 'Graduate' OR Self_Employed = 'Yes')
LIMIT 10;

# Brackets control evaluation order.
# SQL first evaluates (Education = 'Graduate' OR Self_Employed = 'Yes').
# Then it applies the AND condition with Gender = 'Female'.
# Without brackets, SQL might evaluate conditions differently and give incorrect results.
# This is a key concept for writing accurate business queries.


# Practice Questions

# 1. Find customers who are Male AND Married.
# Hint: Use AND to combine two categorical conditions.

# 2. Find customers whose income is greater than 6000 AND credit history = 1.
# Hint: Combine numeric + logical filtering.

# 3. Find customers who are NOT Graduate OR Self Employed.
# Hint: Think how OR expands the result set.

# 4. Find customers who are from Urban area AND (Married OR Credit_History = 1).
# Hint: Use brackets to control logic.

# 5. Find customers whose income is less than 3000 OR (CoapplicantIncome > 2000 AND Married = 'Yes').
# Hint: Nested logic — SQL evaluates brackets first, then outer condition.
