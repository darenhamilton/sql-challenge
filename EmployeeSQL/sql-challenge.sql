-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(10) NOT NULL UNIQUE,
    dept_nam VARCHAR(50) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    employee_no INTEGER NOT NULL UNIQUE,
    employee_title_id VARCHAR(10) NOT NULL,
    birthdate DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex VARCHAR(5),
    hire_date DATE,
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS salarys
(
    employee_no INTEGER NOT NULL UNIQUE,
    salary VARCHAR(10) NOT NULL,
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(10) NOT NULL UNIQUE,
    title VARCHAR(30),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS dept_managers
(
    dept_no VARCHAR(50) NOT NULL UNIQUE,
    emp_no VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emps
(
    emp_no VARCHAR(10) NOT NULL UNIQUE,
    dept_no VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY(emp_no, dept_no)
);


-- Create FKs
ALTER TABLE titles
    ADD    FOREIGN KEY (title_id)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE salarys
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (employee_no)
    REFERENCES salarys(salary)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (employee_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE salarys
    ADD    FOREIGN KEY (employee_no)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emps
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emps
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE salarys
    ADD    FOREIGN KEY (employee_no)
    REFERENCES titles(title)
    MATCH SIMPLE
;
    
ALTER TABLE salarys
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_title_id)
    MATCH SIMPLE
;
    
ALTER TABLE salarys
    ADD    FOREIGN KEY (salary)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_nam)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emps
    ADD    FOREIGN KEY (emp_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(employee_title_id)
    MATCH SIMPLE
;
    
ALTER TABLE departments
    ADD    FOREIGN KEY (dept_no)
    REFERENCES employees(employee_title_id)
    MATCH SIMPLE
;
    

-- Create Indexes

