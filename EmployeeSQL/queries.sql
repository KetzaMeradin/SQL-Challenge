-- Inspiration for task 8 derived from https://github.com/alplky/sql-challenge
select * from employees;
select * from dept_managers;

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on
s.emp_no=e.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where hire_date between '1986-1-1' and '1986-12-31'

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from employees as e
inner join dept_managers as dm on
dm.emp_no=e.emp_no
inner join departments as d
on dm.dept_no = d.dept_no
order by d.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de on
de.emp_no=e.emp_no
inner join departments as d
on de.dept_no = d.dept_no
order by d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name='Hercules' and e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de on
de.emp_no=e.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_no='d007'
order by e.emp_no;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de on
de.emp_no=e.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_no='d007' or d.dept_no='d005'
order by e.emp_no;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, count(e.emp_no) as num_employees_sharing_a_last_name
FROM employees as e
GROUP BY e.last_name
ORDER BY num_employees_sharing_a_last_name DESC;
