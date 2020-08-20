-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(10) NOT NULL,
    dept_nam VARCHAR(30) NOT NULL,
    PRIMARY KEY(dept_no, dept_nam)
);

CREATE TABLE IF NOT EXISTS employees
(
    employee_no INTEGER NOT NULL,
    employee_title_id VARCHAR(30),
    birthdate DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex VARCHAR(5),
    hire_date DATE,
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS salary
(
    employee_no INTEGER NOT NULL,
    employees_employee_no INTEGER,
    salary INTEGER,
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(10) NOT NULL,
    employees_employee_no INTEGER,
    title VARCHAR(30),
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    employee_no INTEGER NOT NULL,
    departments_dept_no VARCHAR(10),
    departments_dept_nam VARCHAR(30),
    dept_no VARCHAR(10),
    departments_dept_no INTEGER,
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    employee_no INTEGER NOT NULL,
    departments_dept_no VARCHAR(10),
    departments_dept_nam VARCHAR(30),
    dept_no VARCHAR(10),
    PRIMARY KEY(employee_no)
);


-- Create FKs
ALTER TABLE titles
    ADD    FOREIGN KEY (title_id)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE salary
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (departments_dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE titles
    ADD    FOREIGN KEY (employees_employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE salary
    ADD    FOREIGN KEY (employees_employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (departments_dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (departments_dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_title_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (departments_dept_nam)
    REFERENCES departments(dept_nam)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (departments_dept_nam)
    REFERENCES departments(dept_nam)
    MATCH SIMPLE
;
    

-- Create Indexes

