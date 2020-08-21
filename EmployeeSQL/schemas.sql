CREATE TABLE Titles (
	title_no VARCHAR(127) NOT NULL PRIMARY KEY, 
	title VARCHAR(127)
);

CREATE TABLE Departments (
	dept_no VARCHAR(127) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(127)
);

CREATE TABLE Employees (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title VARCHAR(127),
	birth_date DATE,
	first_name VARCHAR(127),
	last_name VARCHAR(127),
	sex VARCHAR(127),
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES Titles(title_no)
);

CREATE TABLE Dept_EMP_Junction (
	emp_no INTEGER,
	dept_no VARCHAR(127),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);


CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_Managers (
	dept_no VARCHAR(127),
	emp_no INTEGER,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) References Employees(emp_no),
	FOREIGN KEY (dept_no) References Departments(dept_no)
);

-- COPY titles FROM 'C:\Users\sadlo\Desktop\ClassRepo\Homework\09-SQL\sql-challenge\data\titles.csv' DELIMITERS ',' CSV;

BULK INSERT Titles
	FROM 'C:\Users\sadlo\Desktop\ClassRepo\Homework\09-SQL\sql-challenge\data\titles.csv'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',  --CSV field delimiter
		ROWTERMINATOR = '\n',   --Use to shift the control to next row
		TABLOCK
	)

COPY Titles FROM 'C:\Users\sadlo\Desktop\ClassRepo\Homework\09-SQL\sql-challenge\data\titles.csv'
WITH (format CSV, header);
 

SELECT * FROM Dept_Managers;
SELECT * FROM Dept_EMP_Junction;
SELECT * FROM Departments;
SELECT * FROM Salaries;
SELECT * FROM Employees;
SELECT * FROM Titles;


DROP TABLE Dept_Managers;
DROP TABLE Dept_EMP_Junction;
DROP TABLE Departments;
DROP TABLE Salaries;
DROP TABLE Employees;
DROP TABLE Titles;


