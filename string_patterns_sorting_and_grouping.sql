-- Query 1: Retrieve all employees whose address is in Elgin,IL
select emp_id
from Employees
where address like '%Elgin%';

-- Query 2: Retrieve all employees who were born during the 1970's.
select emp_id
from Employees
where b_date between '1970-01-01' and '1979-12-31';

-- Query 3: Retrieve all employees in department 5 whose salary is between 60000 and 70000 .
select emp_id
from Employees
where salary between 60000 and 70000;

-- Query 4A: Retrieve a list of employees ordered by department ID.
select emp_id
from Employees
order by dep_id;

-- Query 4B: Retrieve a list of employees ordered in descending order by department ID
--  and within each department ordered alphabetically in descending order by last name.
select f_name, l_name, dep_id
from Employees
order by dep_id desc, l_name desc;

-- Query 5A: For each department ID retrieve the number of employees in the department.
select dep_id, count(emp_id) AS employee_count
from Employees
group by dep_id;

-- Query 5B: For each department retrieve the number of employees in the department,
-- and the average employees salary in the department.
select dep_id, count(emp_id) AS employee_count, avg(salary) AS salary_average
from Employees
group by dep_id;

-- Query 5C: Label the computed
-- columns in the result set of Query 5B as NUM_EMPLOYEES and AVG_SALARY.
select dep_id, count(emp_id) AS num_employees, avg(salary) AS avg_salary
from Employees
group by dep_id;

-- Query 5D: In Query 5C order the result set by Average Salary.
select dep_id, count(emp_id) AS num_employees, avg(salary) AS avg_salary
from Employees
group by dep_id
order by avg_salary;

-- Query 5E: In Query 5D limit the result to departments with fewer than 4 employees.
select dep_id, count(emp_id) AS num_employees, avg(salary) AS avg_salary
from Employees
group by dep_id
having count(emp_id) < 4
order by avg_salary;

-- BONUS Query 6: Similar to 4B but instead of department ID use department name. 
--   Retrieve a list of employees ordered by department name, and within each department
--   ordered alphabetically in descending order by last name.
select emp.f_name, emp.l_name, dept.dep_name
from Employees AS emp, Departments AS dept
where emp.dep_id = dept.dept_id_dep
order by dept.dep_name, l_name desc;
