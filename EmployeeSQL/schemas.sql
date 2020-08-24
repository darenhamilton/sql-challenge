CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(10) NOT NULL UNIQUE,
    dept_nam VARCHAR(50) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL UNIQUE,
    title_id VARCHAR(10),
    birthdate DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex VARCHAR(5),
    hire_date DATE,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER NOT NULL UNIQUE,
    salary VARCHAR(10) NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(10) NOT NULL UNIQUE,
    title VARCHAR(30),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS dept_managers
(
    dept_no VARCHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no, emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emps
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    PRIMARY KEY(emp_no, dept_no)
);

-- At this point I was able to add all the csv's. Starting with departments, employees, salaries, titles, dept_managers, dept_emps
-- Create FKs
      
ALTER TABLE salaries
    ADD    FOREIGN KEY (salary)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emps
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emps
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
  