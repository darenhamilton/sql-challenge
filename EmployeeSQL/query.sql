--emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
--List the following details of each employee: employee number, last name, first name, sex, and salary

SELECT employees.employee_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salarys.salary
FROM employees
INNER JOIN salarys ON
employees.employee_no = salarys.employee_no;