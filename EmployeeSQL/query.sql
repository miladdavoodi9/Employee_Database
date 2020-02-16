-- 1.) List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e, salaries AS s
WHERE e.emp_no=s.emp_no;

-- 2.) List employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE (hire_date >= '1986-01-01' AND hire_date <= '1986-12-31');

-- 3.) List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name, dept_manager.from_date, dept_manager.to_date
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no;

-- 4.) list the department of each employee with the following information: employee number, last name, first name, and department name
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no;

-- 5.) List all employees whos first name is "Hercules" and last names begin with "B"
SELECT * FROM employees
WHERE last_name LIKE 'B%'
AND first_name = 'Hercules';

-- 6.) List all employees in the Sales department, including their employee number, last name, first name, and department name
CREATE VIEW total_employees AS
SELECT d.dept_no, dept_name, dept_emp.emp_no
FROM departments AS d
JOIN dept_emp ON d.dept_no = dept_emp.dept_no

CREATE VIEW total_managers AS 
SELECT d.dept_no, dept_name, dept_manager.emp_no
FROM departments AS d
JOIN dept_manager ON d.dept_no = dept_manager.dept_no

CREATE VIEW all_employees AS
SELECT * FROM total_employees
UNION ALL
SELECT * FROM total_managers;

SELECT e.emp_no, last_name, first_name, all_employees.dept_name
FROM employees as e
JOIN all_employees ON e.emp_no = all_employees.emp_no
WHERE all_employees.dept_name = 'Sales'

-- 7.) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, last_name, first_name, all_employees.dept_name
FROM employees as e
JOIN all_employees ON e.emp_no = all_employees.emp_no
WHERE all_employees.dept_name in ('Sales', 'Development')

-- 8.) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name 
ORDER BY count(last_name) desc;


