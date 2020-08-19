-- 1. List the following details of each employee: employee number, 
--    last name, first name, sex, and salary.

SELECT Emp.emp_no, Emp.last_name, Emp.first_name, Emp.sex, Sal.salary
FROM Employees AS Emp INNER JOIN
Salaries AS Sal ON
Emp.emp_no = Sal.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT * FROM Employees;
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's employee number, last name, first name.

SELECT D.dept_no, Departments.dept_name, E.emp_no, E.last_name, E.first_name FROM 
Employees AS E INNER JOIN Dept_Managers AS D ON E.emp_no = D.emp_no
INNER JOIN Departments on D.dept_no = Departments.dept_no;

-- 4. List the department of each employee with the following information: employee number,
--    last name, first name, and department name.

CREATE VIEW my_view AS
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E
JOIN Dept_EMP_Junction AS J ON (E.emp_no = J.emp_no)
JOIN Departments AS D ON (J.dept_no = D.dept_no);

-- By default it seems that PostGRES is limited to 1000 lines returned from a query
SELECT emp_no, last_name, first_name, dept_name FROM my_view LIMIT 50;
SELECT * FROM Employees;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and
--    last names begin with "B."

SELECT first_name, last_name, sex FROM Employees
WHERE first_name LIKE 'Hercules' AND substring(last_name, 1, 1) LIKE 'B';

-- 6. List all employees in the Sales department, including their employee number, last name,
--    first name, and department name.

SELECT first_name, last_name, emp_no, dept_name
FROM my_view
WHERE dept_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee
--    number, last name, first name, and department name.

SELECT emp_no, last_name, first_name, dept_name
FROM my_view
WHERE dept_name LIKE 'Sales' OR dept_name LIKE 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many
--    employees share each last name.

SELECT last_name, COUNT(last_name) AS Frequency
FROM Employees
Group By last_name
Order By Frequency DESC;


SELECT * FROM Employees
WHERE Employees.emp_no = 499942;
