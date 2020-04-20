--1. Get employee details from employee table and join salary table to get salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries ON
employees.emp_no=salaries.emp_no;

--2. Get employees hired in 1986
SELECT emp_no, hire_date
FROM employees
WHERE (EXTRACT(YEAR FROM hire_date) = 1986);

--3. Get all manager details for all departments from dept_manager, departments and employee tables
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
FROM dept_manager dm
LEFT JOIN departments d ON
dm.dept_no = d.dept_no
LEFT JOIN employees e ON
dm.emp_no = e.emp_no;
------------------------------------------
-- Get current manager details for all departments from dept_manager, departments and employee tables
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date 
FROM dept_manager dm
LEFT JOIN departments d ON
dm.dept_no = d.dept_no
LEFT JOIN employees e ON
dm.emp_no = e.emp_no
WHERE (EXTRACT(YEAR FROM dm.to_date) = 9999);

--4. Get the department name, employee number, last name, first name of each employee
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON
e.emp_no = de.emp_no
LEFT JOIN departments d ON
d.dept_no = de.dept_no;
---------------------------------
-- Get the current department name, employee number, last name, first name of each employee
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON
e.emp_no = de.emp_no
LEFT JOIN departments d ON
de.dept_no = d.dept_no
WHERE (EXTRACT(YEAR FROM de.to_date) = 9999);

--5. Get all employees whose first name is "Hercules" and last names begin with "B"
SELECT employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. Get all employees in the Sales department, including their employee number, last name, first name
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
LEFT JOIN departments d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
---------------------------------
-- Get all current employees in the Sales department, including their employee number, last name, first name
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
LEFT JOIN departments d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' AND (EXTRACT(YEAR FROM de.to_date) = 9999);

--7. Get all employees in the Sales and Development departments, including their employee number, last name, first name
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
LEFT JOIN departments d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';
---------------------------------
-- Get all current employees in the Sales and Development departments, including their employee number, last name, first name
SELECT e.first_name, e.last_name, de.emp_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON
e.emp_no = de.emp_no
LEFT JOIN departments d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development' AND (EXTRACT(YEAR FROM de.to_date) = 9999);

--8. In descending order, list the frequency count of employee last names
SELECT last_name, COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;

-- Turns out I'm "April Foolsday"
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no = 499942;
