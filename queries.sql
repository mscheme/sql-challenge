-- List the following details of each employee: 
--      employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees as e
left join salaries as s
	on e.emp_no = s.salary;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: 
--      department number, department name, the manager's employee number, last name, first name.
select man.dept_no, d.dept_name, man.emp_no, e.last_name, e.first_name
from dept_manager as man
inner join departments as d
	on man.dept_no = d.dept_no
inner join employees as e
	on man.emp_no = e.emp_no;

-- List the department of each employee with the following information: 
--      employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as demp
	on e.emp_no = demp.emp_no
inner join departments as d
	on demp.dept_no = d.dept_no;

-- List first name, last name, and sex for employees 
--      whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List all employees in the Sales department, including their:
--      employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as demp
	on e.emp_no = demp.emp_no
inner join departments as d
	on demp.dept_no = d.dept_no
where d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their:
--      employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as demp
	on e.emp_no = demp.emp_no
inner join departments as d
	on demp.dept_no = d.dept_no
where d.dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;