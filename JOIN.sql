/*joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
use bestbuy;
 SELECT products.NAME, categories.NAME FROM categories
 INNER JOIN products
 ON categories.CategoryID = products.CategoryID
 WHERE categories.NAME = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(Sales.Quantity) AS "Total" FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY Total DESC
LIMIT 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS "Department", categories.Name AS "Category" FROM departments
INNER JOIN categories 
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Apliances" OR categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) AS "Total Sales", Sum(sales.Quantity * sales.PricePerUnit) AS "Total Sales" FROM sales
INNER JOIN products
ON sales.ProductID = products.ProductID
WHERE products.Name LIKE "%Hotel%"
GROUP BY sales.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%Visio%" AND reviews.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */