CREATE TABLE departments(dept_no varchar(10)  NOT NULL ,dept_name varchar(30) NOT NULL, PRIMARY KEY (dept_no));

CREATE TABLE titles(title_id varchar(50) NOT NULL,title varchar(20) NOT NULL,PRIMARY KEY(title_id));

CREATE TABLE employees(emp_no INT NOT NULL, emp_title_id VARCHAR(50) NOT NULL, birth_date varchar(10) NOT NULL, first_name VARCHAR(20) NOT NULL, last_name VARCHAR(20) NOT NULL, sex VARCHAR(2) NOT NULL, hire_date varchar(10) NOT NULL, no_of_projects INT NOT NULL, Last_performance_rating VARCHAR(50) NOT NULL, left_ BIT Not Null, Last_date varchar(10) NOT NULL, PRIMARY KEY (emp_no), FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

CREATE TABLE dept_managers(dept_no varchar(10) NOT NULL,emp_no int NOT NULL,PRIMARY KEY (dept_no),FOREIGN KEY (emp_no) REFERENCES employees(emp_no)); 

CREATE TABLE dept_emp(emp_no int NOT NULL,dept_no varchar(10) NOT NULL,PRIMARY KEY (emp_no),FOREIGN KEY (dept_no) REFERENCES departments(dept_no)); 

CREATE TABLE salaries(emp_no bigint NOT NULL, Salary bigint NOT NULL,PRIMARY KEY (emp_no));

LOAD DATA LOCAL INFILE '/home/anabig114237/departments.csv' INTO TABLE departments fields terminated by ',' ignore 1 rows;

LOAD DATA LOCAL INFILE '/home/anabig114237/titles.csv' INTO TABLE titles fields terminated by ',' ignore 1 rows;

LOAD DATA LOCAL INFILE '/home/anabig114237/employees.csv' INTO TABLE employees fields terminated by ',' ignore 1 rows;

LOAD DATA LOCAL INFILE '/home/anabig114237/dept_manager.csv' INTO TABLE dept_managers fields terminated by ',' ignore 1 rows;

LOAD DATA LOCAL INFILE '/home/anabig114237/dept_emp.csv' INTO TABLE dept_emp fields terminated by ',' ignore 1 rows;

LOAD DATA LOCAL INFILE '/home/anabig114237/salaries.csv' INTO TABLE salaries fields terminated by ',' ignore 1 rows;

