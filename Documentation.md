-- **Business Objective**

Employee retention data analysis assists businesses in improving the quality of new employees, establishing high-performing sales teams, forecasting future staffing needs, and implementing more effective training. Employee data is crucial because it informs your firm about employee viewpoints, which can lead to better decisions, increased employee productivity, and decreased attrition rates.

-- **Why is it a Big Data Engineering problem?**

We're creating, building, testing, and maintaining complicated data processing systems for a big data set in this project. As a result, it's a large data engineering problem.

-- **Data**

Six csv files comprise the dataset. It contains information about employees of a large firm from the 1980s through the 1990s.
Data Description: Please find the details of all the tables
	a.  Titles (titles.csv):
title_id – Unique id of type of employee (designation id) – Character – Not Null
Title – Designation – Character – Not Null
	b.  Employees (employees.csv):
emp_no – Employee Id – Integer – Not Null
emp_titles_id – designation id – Not Null
birth_date – Date of Birth – Date Time – Not Null
first_name – First Name – Character – Not Null
last_name – Last Name – Character – Not Null
sex – Gender – Character – Not Null
hire_date – Employee Hire date –Date Time -Not Null
no_of_projects – Number of projects worked on – Integer – Not Null
Last_performance_rating – Last year performance rating – Character – Not Null
left – Employee left the organization – Boolean – Not Null
Last_date - Last date of employment (Exit Date) – Date Time
	c. Salaries (salaries.csv):
emp_no – Employee id – Integer – Not Null
Salary – Employee’s Salary – Integer – Not Null
	d. Departments (departments.csv):
dept_no - Unique id for each department – character – Not Null
dept_name – Department Name – Character – Not Null
	e. Department Managers (dept_manager.csv):
dept_no - Unique id for each department – character – Not Null
emp_no – Employee number (head of the department ) – Integer – Not Null
	f.  Department Employees (dept_emp.csv):
emp_no – Employee id – Integer – Not Null
dept_no - Unique id for each department – character – Not Null

-- **Technology Stack**

SQL, Sqoop, Hive, Impala, PySpark (Spark SQL and Spark ML), Jupyter notebook.

-- Steps followed

	a. Prerequisite: upload the data and all other files required to the "https://npbdh.cloudloka.com/ftp/" page.
	
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
	
	The Output of the Above Command will be Save in the output.txt
	
	b. Uploaded data to PySpark and carried out data analysis using Spark SQL.

	c. ML pipeline is built using Spark ML.

-- **Final Outcome**

A pipeline of analysis done using impala and ML pipeline built using Jupyter notebook(random forest and logistic regression models were built).

-- **Challenges faced**

	a. HUE platform being extremely slow at times.
	b. Problems created due to incorrect format of dates. 
	


