--Checking to see if data imported correctly
SELECT * 
FROM employees
;

SELECT * 
FROM departments
;

SELECT * 
FROM dept_emp
;

SELECT * 
FROM dept_manager
;

SELECT * 
FROM salaries
;

SELECT * 
FROM titles
;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
--joining the employees table with salaries table to get the relevant data

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no ASC
;


-- List first name, last name, and hire date for employees who were hired in 1986
--use of to_date to turn hire_date into Date format and then searching for year 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM to_date(hire_date, 'MM/DD/YYYY')) = 1986
;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--joining dept_manager, departments and employees to get the manager of each department

SELECT 
	dept_manager.dept_no,
	departments.dept_name,
	employees.emp_no, 
	employees.last_name, 
	employees.first_name
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
--joining employees with dept_emp and departments to get relevant data. dept_emp is a junction table which links the other two

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no ASC
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--use of % to search for last_name that begins with B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
--join employees, dept_emp and departments to find the departments each employee works in order to query for employees that work in Sales
--dept_emp is a junction table which links employees and departments

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--join employees, dept_emp and departments to find the departments each employee works in order to query employees that work in Sales or Development
--dept_emp is a junction table which links employees and departments

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--use aggregate function Count and a groupby of last_name to find frequency of last names and order by descending to sort from highest to lowest

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name)  DESC
;

--Epilogue

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no = 499942
;
