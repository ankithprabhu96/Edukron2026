-- table creation:

-- -- Table 1: Departments (parent)
-- CREATE TABLE departments (
--     dept_id      NUMBER PRIMARY KEY,
--     dept_name    VARCHAR2(50) NOT NULL,
--     location     VARCHAR2(50)
-- );

-- -- Table 2: Employees (child)
-- CREATE TABLE employees (
--     emp_id        NUMBER PRIMARY KEY,
--     emp_name      VARCHAR2(50) NOT NULL,
--     dept_id       NUMBER,
--     manager_id    NUMBER,
--     salary        NUMBER(10,2),
--     hire_date     DATE,
--     CONSTRAINT fk_emp_dept
--         FOREIGN KEY (dept_id)
--         REFERENCES departments(dept_id)
-- );

-- -- Departments (note: dept_id 50 has no employees)
-- INSERT INTO departments VALUES (10, 'Sales',      'Mumbai');
-- INSERT INTO departments VALUES (20, 'Engineering','Bengaluru');
-- INSERT INTO departments VALUES (30, 'HR',         'Delhi');
-- INSERT INTO departments VALUES (40, 'Finance',    'Pune');
-- INSERT INTO departments VALUES (50, 'Legal',      'Chennai');

-- -- Employees
-- -- One-to-many mapping example:
-- -- dept 20 has multiple employees
-- INSERT INTO employees VALUES (101, 'Asha',   10, 900, 60000, DATE '2022-01-10');
-- INSERT INTO employees VALUES (102, 'Bharat', 20, 901, 80000, DATE '2021-03-15');
-- INSERT INTO employees VALUES (103, 'Charu',  20, 901, 75000, DATE '2023-07-01');
-- INSERT INTO employees VALUES (104, 'Deep',   20, NULL, NULL, DATE '2024-02-20');
-- INSERT INTO employees VALUES (105, 'Esha',   30, 902, 50000, DATE '2020-11-05');
-- INSERT INTO employees VALUES (106, 'Farhan', NULL, 903, 45000, DATE '2024-01-12'); -- NULL dept
-- INSERT INTO employees VALUES (107, 'Gauri',  40, 904, 90000, DATE '2019-08-25');
-- INSERT INTO employees VALUES (108, 'Hari',   NULL, NULL, NULL, DATE '2025-01-01'); -- NULL dept + NULL salary

-- COMMIT;

-- PRACTICE QUESTIONS:

-- -- 1
-- SELECT e.emp_name, d.dept_name from EMPLOYEES e join DEPARTMENTS d on e.DEPT_ID = d.DEPT_ID

-- -- 2
-- SELECT e.emp_id, e.emp_name, d.dept_name
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY e.emp_id

-- -- 3
-- SELECT d.dept_id, d.dept_name, e.emp_name
-- FROM employees e
-- RIGHT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY d.dept_id, e.emp_name

-- -- 4
-- select 
--     d.dept_id,
--     d.dept_name,
--     e.emp_id,
--     e.emp_name,
--     e.salary
-- from departments d
-- full outer join employees e
-- on d.dept_id = e.dept_id
-- order by d.dept_id, e.emp_id;

-- -- 5
-- select e.*
-- from employees e
-- left join departments d
-- on e.dept_id = d.dept_id
-- where d.dept_id is null;


-- -- 6
-- select d.dept_id, d.dept_name
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name
-- having count(e.emp_id) = 0;

-- -- 7
-- select d.dept_id, d.dept_name, count(e.emp_id)
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name

-- -- 8
-- select d.dept_id, d.dept_name, avg(e.SALARY)
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name

-- -- 9
-- select d.dept_id,
--        d.dept_name,
--        max(e.salary) as max_sal
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name
-- order by d.dept_id;

-- -- 10
-- select e.emp_name, e.hire_date, d.dept_name
-- from employees e
-- left join departments d
--     on e.dept_id = d.dept_id
-- where e.hire_date >= DATE '2024-01-01'
-- order by e.hire_date;

-- -- 11
-- select
--     e.emp_id,
--     e.emp_name,
--     NVL(d.dept_name, 'No Department') AS dept_name
-- FROM employees e
-- LEFT JOIN departments d
-- ON e.dept_id = d.dept_id;

-- -- 12
-- select 
--     d.dept_id,
--     d.dept_name,
--     count(e.emp_id)
-- from DEPARTMENTS d  JOIN EMPLOYEES e
-- on e.DEPT_ID = d.DEPT_ID
-- group by d.dept_id, d.dept_name
-- having count(emp_id)>1

-- -- 13
-- select
--     d.LOCATION,
--     sum(e.salary)
-- from DEPARTMENTS d left JOIN EMPLOYEES e
-- on e.DEPT_ID = d.DEPT_ID
-- group by d.location

-- -- 14
-- select
--     e.*
-- from EMPLOYEES e left JOIN DEPARTMENTS d
-- on e.DEPT_ID = d.DEPT_ID
-- where d.location = 'Bengaluru'

-- -- 15
-- select dept_id, dept_name, emp_id, emp_name, salary
-- FROM (
--     select
--         d.dept_id,
--         d.dept_name,
--         e.emp_id,
--         e.emp_name,
--         e.salary,
--         row_number() over(partition by d.dept_id order by e.salary DESC) as row_no
--     from Departments d join Employees e on d.dept_id=e.dept_id where e.salary is not null
-- ) 
-- where row_no=1

-- -- 16
-- select d.dept_id, d.dept_name
-- from departments d
-- join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name
-- having count(e.emp_id) > 0 and count(e.salary) = 0;

-- -- 17
-- select d.dept_id, d.dept_name
-- from departments d
-- where not exists (
--     select 1
--     from employees e
--     where e.dept_id = d.dept_id
-- )

-- -- 18
-- select count(*) as Dept_with_no_emp
-- from EMPLOYEES where dept_id is null

-- -- 19
-- select d.dept_name, e.emp_name
-- from departments d
-- cross join employees e

-- -- 20
-- select d.dept_id, d.dept_name, e.emp_id, e.emp_name
-- from departments d
-- join employees e
-- on d.dept_id = e.dept_id

-- EXPLAIN:
-- Only rows where dept_id exactly matches in both tables exist in the created join table.
-- 'Legal' dept (dept_id 50) is not matched with any row in employee, so it is excluded.
-- 'Fahran' and 'hari' are excluded because dept_id is null


-- select d.dept_id, d.dept_name, e.emp_id, e.emp_name
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id;

-- Explain:
-- All rows from Department table are included in the join results as it is the left table.
-- Even 'Legal ' dept is included since it is in the left table with null values for employee fields.
-- 'Fahran' and 'Hari' are excluded because dept_id as null does not match any existing dept