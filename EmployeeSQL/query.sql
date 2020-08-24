--emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
--List the following details of each employee: employee number, last name, first name, sex, and salary

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1989-01-01' AND hire_date < '1990-01-01';


--List the manager of each department with the following information: 
    --department number, department name, the manager's employee number, last name, first name.

SELECT 
	m.dept_no, 
	d.dept_nam, 
	e.emp_no, 
	e.last_name, 
	e.first_name
FROM dept_managers m
JOIN employees e
	ON m.emp_no = e.emp_no
JOIN departments d
	ON m.dept_no = d.dept_no;
	
--List the department of each employee with the following information: 
	--employee number, last name, first name, and department name

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_nam
FROM dept_emps x
JOIN employees e
	ON x.emp_no = e.emp_no
JOIN departments d
	ON x.dept_no = d.dept_no;


  --List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';


--List all employees in the Sales department, including their 
 --employee number, last name, first name, and department name.

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_nam
FROM dept_emps x
JOIN employees e
	ON x.emp_no = e.emp_no
JOIN departments d
	ON x.dept_no = d.dept_no
WHERE d.dept_nam = 'Sales';	

  
 --List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_nam
FROM dept_emps x
JOIN employees e
	ON x.emp_no = e.emp_no
JOIN departments d
	ON x.dept_no = d.dept_no
WHERE d.dept_nam IN ('Sales', 'Development');	
 

 --In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT
	last_name,
	COUNT(*) AS total
FROM employees
GROUP BY last_name
ORDER BY total DESC;


--It looks like Foolsday might be me

SELECT *
FROM employees
WHERE last_name = 'Foolsday';
