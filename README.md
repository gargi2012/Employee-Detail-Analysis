# Employee-Detail-Analysis
Data Engineering Project - Capstone project 1 
---------------------------------------------
Prerequisite: upload the data and all other files required to the "https://npbdh.cloudloka.com/ftp/" page.

1. Log in to mysql using : mysql -u anabig114237 -pBigdata123

2. Change the database: 

mysql> Use anabig114237;

3. Create 'cap1.sql' file. It should contain all the queries needed for creation and loading of data.
In sql, run the command: 

mysql> source cap1.sql

4. Use sqoop to import data from sql to hdfs. Suppose we want to import file to a directory, make sure to remove files with the same name as source from the target directory.
if /anabig114237/hive/warehouse is the target dir and table1 is the source table, run the command: 

[anabig114237@ip-10-1-1-204 ~ ]$ hdfs dfs -rm -r /anabig114237/hive/warehouse/table1

5. for importing, run command: 

[anabig114237@ip-10-1-1-204 ~ ]$ sh cap1g.sh

6. transfer schema from local system to hdfs
hdfs dfs -put /home/anabig114237/table1.avsc /user/anabig114237/new/table1.avsc

7. Run the following command.

hive -f command_impala.sql > output.txt

The Output of the Above Command will be Saved in the output.txt

	1. A list showing employee number, last name, first name, sex, and salary for each employee.
	
	SELECT emp.emp_no, last_name, first_name, sex, salary 
	    from employees emp
	    INNER JOIN salaries sal
	    ON emp.emp_no = sal.emp_no;
	
	
	2.  A list showing first name, last name, and hire date for employees who were hired in 1986.
	SELECT  first_name, last_name, hire_date 
	    from employees 
	    where substr(hire_date,7,4)= '1986';
	    
	
	
	3. A list showing the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
	
	select a.dept_no, dept_name, b.emp_no, last_name, first_name
	    from departments a
	    inner join dept_managers b
	    on a.dept_no = b.dept_no
	    inner join employees c 
	    on b.emp_no = c.emp_no; 
	
	
	4. A list showing the department of each employee with the following information: employee number, last name, first name, and department name.
	
	SELECT a.emp_no, last_name, first_name, dept_name
	    from employees a 
	    INNER JOIN dept_emp b 
	    on a.emp_no = b.emp_no
	    INNER JOIN departments c 
	    on b.dept_no = c.dept_no;
	
	
	
	5. A list showing first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B.“
	
	SELECT first_name, last_name, sex 
	    FROM employees 
	    WHERE first_name = "Hercules" and last_name LIKE "B%";
	
	
	
	6. A list showing all employees in the Sales department, including their employee number, last name, first name, and department name.
	select a.emp_no, last_name, first_name, dept_name 
	from employees a
	join dept_emp b
	on a.emp_no = b.emp_no
	join departments c on b.dept_no = c.dept_no
	where c.dept_no like '%d007%';
	
	
	
	7. A list showing all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
	
	select a.emp_no, last_name, first_name, dept_name 
		from employees a
		join dept_emp b
		on a.emp_no = b.emp_no
		join departments c on b.dept_no = c.dept_no
		where c.dept_no like '%d007%' or c.dept_no like '%d005%';


	
	8. A list showing the frequency count of employee last names, in descending order. ( i.e., how many employees share each last name.)
	
	SELECT last_name, count(*) no_of_employees
	    from employees
	    GROUP BY last_name
	    ORDER BY count(*) DESC;
	
	
	9. Histogram to show the salary distribution among the employees.
	
	SELECT salary, count(*) no_of_employees  
	    from salaries
	    GROUP BY salary;
	
	
	     

	
	10. Bar graph to show the Average salary per title (designation).
	
	SELECT title, avg(salary) avg_salary 
	    from titles a 
	    INNER JOIN employees b 
	    on a.title_id = b.emp_title_id
	    INNER JOIN salaries c
	    on b.emp_no =  c.emp_no
	    GROUP BY title;
	
	11. Calculate employee tenure & show the tenure distribution among the employees.
	
	
	
	12.  Perform your own Analysis (based on the data understanding).
	a. Number of employees who left.
	Select left_, count(*)
		From employees 
	    Group by left_;
	
	b. Number of employees who left in each dept.
	select dept_name, count(*) employees_left from 
	    employees a 
	    inner join dept_emp b 
	    on a.emp_no = b.emp_no
	    inner join departments c 
	    on b.dept_no = c.dept_no
	    where left_ 
	    group by dept_name
	
	c. Employees by gender
	select sex, count(*) no_of_employees
	    from employees
	    group by sex;
	
	
	d. Perf_rating distribution
	
	select last_performance_rating, count(*) 
	    from employees
	    group by last_performance_rating;
	
	e. Perf rating of dept managers.
	
	select a.emp_no, dept_name, last_performance_rating
	    from employees a 
	    inner join dept_managers b 
	    on a.emp_no = b.emp_no
	    inner join departments c 
	    on b.dept_no = c.dept_no
	






![image](https://user-images.githubusercontent.com/75109360/169336691-f479cb6b-a76a-480d-9024-c6ba14797257.png)
