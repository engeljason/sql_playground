SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM 
employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no;

SELECT e.first_name, e.last_name, e.hire_date
FROM 
employees AS e
WHERE date_part('year', e.hire_date) = '1986';

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM 
departments AS d
JOIN dept_manager AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no;

SELECT e.first_name, e.last_name, e.sex 
FROM employees AS e 
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM 
departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM 
departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


SELECT e.last_name, COUNT(*)
FROM employees AS e
GROUP BY e.last_name
ORDER BY "count" DESC;