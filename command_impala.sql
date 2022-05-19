CREATE DATABASE cap1g;
USE cap1g;


drop table if exists departments;
CREATE EXTERNAL TABLE departments
		STORED AS AVRO LOCATION 
	    '/user/anabig114237/hive/warehouse/departments' 
	    TBLPROPERTIES 
	    ('avro.schema.url'='/user/anabig114237/new/departments.avsc');
	    
drop table if exists titles;
CREATE EXTERNAL TABLE titles
		STORED AS AVRO LOCATION 
	    '/user/anabig114237/hive/warehouse/titles' 
	    TBLPROPERTIES 
	    ('avro.schema.url'='/user/anabig114237/new/titles.avsc');
	
drop table if exists employees;
CREATE EXTERNAL TABLE employees
		STORED AS AVRO LOCATION 
	    '/user/anabig114237/hive/warehouse/employees' 
	    TBLPROPERTIES 
	    ('avro.schema.url'='/user/anabig114237/new/employees.avsc');
	
drop table if exists dept_managers;
CREATE EXTERNAL TABLE dept_managers
		STORED AS AVRO LOCATION 
	    '/user/anabig114237/hive/warehouse/dept_managers' 
	    TBLPROPERTIES 
	    ('avro.schema.url'='/user/anabig114237/new/dept_managers.avsc');
	
	
drop table dept_emp;
CREATE EXTERNAL TABLE dept_emp
		STORED AS AVRO LOCATION 
	    '/user/anabig114237/hive/warehouse/dept_emp' 
	    TBLPROPERTIES 
	    ('avro.schema.url'='/user/anabig114237/new/dept_emp.avsc');
	
	 
drop table if exists salaries;
CREATE EXTERNAL TABLE salaries
		STORED AS AVRO LOCATION 
	    '/user/anabig114237/hive/warehouse/salaries' 
	    TBLPROPERTIES 
    ('avro.schema.url'='/user/anabig114237/new/salaries.avsc');

SELECT emp.emp_no, last_name, first_name, sex, salary 
	    from employees emp
	    INNER JOIN salaries sal
	    ON emp.emp_no = sal.emp_no;
	
SELECT  first_name, last_name, hire_date 
	    from employees 
	    where substr(hire_date,7,4)= '1986';
	    
	
	
select a.dept_no, dept_name, b.emp_no, last_name, first_name
	    from departments a
	    inner join dept_managers b
	    on a.dept_no = b.dept_no
	    inner join employees c 
	    on b.emp_no = c.emp_no; 
	
	
SELECT a.emp_no, last_name, first_name, dept_name
	    from employees a 
	    INNER JOIN dept_emp b 
	    on a.emp_no = b.emp_no
	    INNER JOIN departments c 
	    on b.dept_no = c.dept_no;
	
	
	
SELECT first_name, last_name, sex 
	    FROM employees 
	    WHERE first_name = "Hercules" and last_name LIKE "B%";
	
	
	
select a.emp_no, last_name, first_name, dept_name 
	from employees a
	join dept_emp b
	on a.emp_no = b.emp_no
	join departments c on b.dept_no = c.dept_no
	where c.dept_no like '%d007%';
	
	
select a.emp_no, last_name, first_name, dept_name 
from employees a
join dept_emp b
on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where c.dept_no like '%d007%' or c.dept_no like '%d005%';


	
SELECT last_name, count(*) no_of_employees
	    from employees
	    GROUP BY last_name
	    ORDER BY count(*) DESC;
	
	
SELECT salary, count(*) no_of_employees  
	    from salaries
	    GROUP BY salary;
	
	
	     

	
SELECT title, avg(salary) avg_salary 
	    from titles a 
	    INNER JOIN employees b 
	    on a.title_id = b.emp_title_id
	    INNER JOIN salaries c
	    on b.emp_no =  c.emp_no
	    GROUP BY title;
	

Select left_, count(*)
		From employees 
	    Group by left_;
	
select dept_name, count(*) employees_left from 
	    employees a 
	    inner join dept_emp b 
	    on a.emp_no = b.emp_no
	    inner join departments c 
	    on b.dept_no = c.dept_no
	    where left_ 
	    group by dept_name

select sex, count(*) no_of_employees
	    from employees
	    group by sex;

select last_performance_rating, count(*) 
	    from employees
	    group by last_performance_rating;
	
select a.emp_no, dept_name, last_performance_rating
	    from employees a 
	    inner join dept_managers b 
	    on a.emp_no = b.emp_no
	    inner join departments c 
	    on b.dept_no = c.dept_no
	






