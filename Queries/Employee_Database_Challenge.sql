--Retrieve columns from Employees
SELECT emp_no, first_name, last_name
FROM employees
--Retrieve columns from Titles
SELECT title, from_date, to_date
FROM titles
--Create a new table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
--View table
SELECT * FROM retirement_titles 
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table
SELECT emp_no, first_name, last_name, title
FROM retirement_titles
-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	to_date,
	title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no asc, to_date DESC;
--View table
SELECT * FROM unique_titles 
--Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC;
--View table
SELECT * FROM retiring_titles 