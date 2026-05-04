-- -- -- select * from sh.CHANNELS;
-- -- -- select channel_class as "channel class" from sh.CHANNELS group by "channel class";

-- -- -- -- select * from hr.EMPLOYEES;
-- -- -- select first_name, lower(first_name) from hr.EMPLOYEES

-- -- -- select first_name, lower(first_name) from hr.EMPLOYEES

-- -- -- select first_name, initcap(first_name) from hr.EMPLOYEES

-- -- -- select first_name, length(first_name) from hr.EMPLOYEES

-- -- -- select first_name as "Name", substr(first_name, 2,2) as "substring" from hr.EMPLOYEES where length (first_name)=4

-- -- -- select instr('abcdef', 'b') from dual;


-- -- -- select instr(first_name, 'b') from hr.EMPLOYEES


-- -- -- select instr('abcdef', 'g') from dual


-- -- -- select concat('abcdef', 'b') from dual


-- -- -- select concat(first_name, 'b') from hr.EMPLOYEES


-- -- -- select trim(' abcdef ') from dual


-- -- -- select trim(FIRST_NAME) from hr.EMPLOYEES


-- -- -- select ltrim(' abcdef ') from dual


-- -- -- select rtrim(' abcdef ') from dual


-- -- -- select ltrim(first_name) from hr.EMPLOYEES


-- -- -- select rtrim(first_name) from hr.EMPLOYEES

-- -- -- select 'abcdef' || 'lmnop' from dual

-- -- -- select first_name || last_name from hr.EMPLOYEES

-- -- -- select replace(first_name, 'a', 'xxxx') from hr.EMPLOYEES
-- -- -- select replace('abcdefc', 'c', 'xxxx') from dual

-- -- -- select lpad('abcdefc',10, 'x') from dual
-- -- -- select lpad(first_name, 10 ,'x') from hr.EMPLOYEES
-- -- -- 

-- -- -- select rpad('abcdefc',10, 'x') from dual
-- -- -- select rpad(first_name, 10 ,'x') from hr.EMPLOYEES

-- -- -- select ascii('a') from dual
-- -- -- select ascii(first_name) from hr.EMPLOYEES

-- -- -- select chr(100) from dual

-- -- -- select * from hr.employees

-- -- -- select chr(employee_id) from hr.EMPLOYEES

-- -- -- select abs(-1234.4) from dual

-- -- -- select ceil(155.5) from dual

-- -- -- select floor(155.7) from dual

-- -- -- select round(155.5) from dual

-- -- -- select round(155.3) from dual

-- -- -- select mod(155, 4) from dual

-- -- -- select power(5,5) from dual

-- -- -- select sqrt(15) from dual

-- -- -- select exp(2) as decimal_exp from dual

-- -- -- select power(2, 5) from dual

-- -- -- select ln(12) from dual

-- -- -- select log(10,1000) from dual

-- -- -- select log(2,64) from dual

-- -- -- select log(5, 125) from dual

-- -- -- select sign(-155.5) from dual

-- -- -- select sysdate from dual

-- -- -- select current_date from dual

-- -- -- select add_months(sysdate, 5) from dual

-- -- -- select round(months_between(sysdate,hire_date)/12) from hr.employees

-- -- -- select floor((sysdate - hire_date)/365) from hr.employees

-- -- -- select next_day(sysdate, 'wednesday') from dual

-- -- -- select hire_date,last_day(hire_date) from hr.employees

-- -- -- select sysdate, extract(year from hire_date) from hr.employees

-- -- -- select hire_date,extract(month from hire_date) from hr.employees

-- -- -- select hire_date,extract(day from hire_date) from hr.employees

-- -- -- select extract(hour from cast( hire_date as timestamp)) from hr.employees

-- -- -- select sysdate, sysdate+numtodsinterval(2, 'day') from dual

-- -- -- select sessiontimezone from dual

-- -- -- select datetime from dual

-- -- -- SELECT GREATEST(10, 20, 30) AS GREATEST_VAL FROM DUAL

-- -- -- SELECT LEAST(10, 20, 30) AS LEAST_VAL FROM DUAL

-- -- -- SELECT TAN(0) AS TAN_VAL FROM DUAL

-- -- -- SELECT aTAN(0) AS TAN_VAL FROM DUAL

-- -- -- SELECT COS(0) AS COS_VAL FROM DUAL

-- -- -- SELECT aCOS(0) AS COS_VAL FROM DUAL

-- -- -- SELECT SIN(0) AS SIN_VAL FROM DUAL

-- -- -- SELECT aSIN(0) AS SIN_VAL FROM DUAL

-- -- -- select nvl(null, 'abcd') from dual

-- -- -- select nvl(null, 123) from dual

-- -- -- select nvl(salary, 123) from hr.employees

-- -- -- select nvl2(20,'not null', 'abcd') from dual

-- -- -- select nullif('expr 1', 'expr 2') from dual


-- -- -- select nullif('expr ', 'expr ') from dual


-- -- -- select coalesce(null , null ,'expr 1', 'expr 2') from dual


-- -- -- select employee_id, salary, row_number() over(order by salary desc) as row_number  from hr.employees

-- -- -- select employee_id, salary, rank() over(order by salary desc) as rank  from hr.employees

-- -- -- select employee_id, salary, dense_rank() over(order by salary desc) as dense_rank  from hr.employees



-- -- -- select employee_id,department_id, salary, row_number() over(partition by department_id order by salary desc) as row_number  from hr.employees

-- -- -- select employee_id,department_id, salary, rank() over(partition by department_id order by salary desc) as rank_aggr  from hr.employees

-- -- -- select employee_id,department_id, salary, dense_rank() over(partition by department_id order by salary desc) as dense_rank_aggr  from hr.employees

-- -- -- CREATE TABLE emp_demo1 (
-- -- --     emp_id NUMBER,
-- -- --     emp_name VARCHAR2(20),
-- -- --     dept_id NUMBER,
-- -- --     salary NUMBER
-- -- -- )

-- -- -- INSERT INTO emp_demo1 VALUES (1, 'A', 10, 5000);
-- -- -- INSERT INTO emp_demo1 VALUES (2, 'B', 10, 6000);
-- -- -- INSERT INTO emp_demo1 VALUES (3, 'C', 10, 7000);
-- -- -- INSERT INTO emp_demo1 VALUES (4, 'D', 20, 4000);
-- -- -- INSERT INTO emp_demo1 VALUES (5, 'E', 20, 4500);
-- -- -- INSERT INTO emp_demo1 VALUES (6, 'F', 20, 5500);

-- -- -- select * from emp_demo1

-- -- -- ### lead , lag 
-- -- -- ### lead , lag with 2
-- -- -- ### partition by lead lag 
-- -- -- ### partition by lead lag 2 


-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lag(salary,1) OVER (  
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1


-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lead(salary,1) OVER (  
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1

-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lag(salary,1) OVER (partition by dept_id 
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1

-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lead(salary,1) OVER (partition by dept_id 
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1;


-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lag(salary,2) OVER (  
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1


-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lead(salary,2) OVER (  
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1

-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lag(salary,2) OVER (partition by dept_id 
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1

-- -- -- SELECT emp_name, dept_id,salary,
-- -- --        lead(salary,2) OVER (partition by dept_id 
-- -- --        ORDER BY emp_id) AS next_salary
-- -- -- FROM emp_demo1;

-- -- -- select * from emp_demo1

-- -- -- select emp_name, salary ,case when salary >= 6000 then 'high' when salary>= 5000 then 'medium' else 'low' end as sal_category from emp_demo1

-- -- -- select * from hr.employees

-- -- -- select employee_id, first_name, months_between(sysdate,hire_date)/12 as experience, case when MONTHS_BETWEEN(SYSDATE, hire_date)/12  >= 12 then 'senior' when MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 5 then 'mid' else 'jubior' end as exp_category from hr.employees

-- -- -- CREATE TABLE emp_analytics (
-- -- --     emp_id NUMBER,
-- -- --     emp_name VARCHAR2(50),
-- -- --     dept_id NUMBER,
-- -- --     salary NUMBER,
-- -- --     hire_date DATE
-- -- -- )

-- -- -- INSERT INTO emp_analytics VALUES (1, 'Amit', 10, 50000, DATE '2022-01-10');
-- -- -- INSERT INTO emp_analytics VALUES (2, 'Rahul', 10, 60000, DATE '2021-03-15');
-- -- -- INSERT INTO emp_analytics VALUES (3, 'Sita', 20, 55000, DATE '2020-07-20');
-- -- -- INSERT INTO emp_analytics VALUES (4, 'Kiran', 20, 70000, DATE '2019-05-11');
-- -- -- INSERT INTO emp_analytics VALUES (5, 'Anu', 30, 40000, DATE '2023-02-01');
-- -- -- INSERT INTO emp_analytics VALUES (6, 'John', 30, 45000, DATE '2022-08-25');
-- -- -- COMMIT;


-- -- -- SELECT *
-- -- -- FROM (
-- -- --     SELECT emp_name, dept_id, salary,
-- -- --            ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rn
-- -- --     FROM emp_analytics
-- -- -- )
-- -- -- WHERE rn = 1


-- -- -- SELECT *
-- -- -- FROM (
-- -- --     SELECT emp_name, dept_id, salary,
-- -- --            RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
-- -- --     FROM emp_analytics
-- -- -- )
-- -- -- WHERE rnk <= 2


-- -- -- SELECT emp_name, dept_id, salary,
-- -- --        DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS drnk
-- -- -- FROM emp_analytics


-- -- -- SELECT emp_name, dept_id, salary,
-- -- --        LEAD(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS next_salary
-- -- -- FROM emp_analytics

-- -- -- SELECT emp_name, dept_id, salary,
-- -- --        LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS prev_salary
-- -- -- FROM emp_analytics


-- -- -- SELECT emp_name, dept_id, salary,
-- -- --        salary - LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS salary_diff
-- -- -- FROM emp_analytics

-- -- -- SELECT emp_name, dept_id, salary,
-- -- --        LEAD(salary) OVER (PARTITION BY dept_id ORDER BY salary) - salary AS next_diff
-- -- -- FROM emp_analytics

-- -- -- SELECT *
-- -- -- FROM (
-- -- --     SELECT emp_name, dept_id, salary,
-- -- --            ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary ASC) AS rn
-- -- --     FROM emp_analytics
-- -- -- )
-- -- -- WHERE rn = 1
-- -- -- SELECT *
-- -- -- FROM (
-- -- --     SELECT emp_name, dept_id, salary,
-- -- --            DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS drnk
-- -- --     FROM emp_analytics
-- -- -- )
-- -- -- WHERE drnk = 2;

-- -- -- SELECT *
-- -- -- FROM (
-- -- --     SELECT emp_name,
-- -- --            dept_id,
-- -- --            salary,
-- -- --            LAG(salary) OVER (PARTITION BY dept_id ORDER BY salary) AS prev_salary
-- -- --     FROM emp_analytics
-- -- -- )
-- -- -- WHERE salary > prev_salary;


-- -- -- CREATE TABLE retail_sales (
-- -- --     order_id        INT,
-- -- --     customer_id     INT,
-- -- --     customer_name   VARCHAR(50),
-- -- --     product_id      INT,
-- -- --     product_name    VARCHAR(50),
-- -- --     category        VARCHAR(30),
-- -- --     quantity        INT,
-- -- --     price           DECIMAL(10,2),
-- -- --     order_date      DATE,
-- -- --     city            VARCHAR(50)
-- -- -- );

-- -- -- INSERT INTO retail_sales VALUES (101, 1, 'Rahul',   201, 'Laptop',     'Electronics', 1, 55000, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Bangalore');
-- -- -- INSERT INTO retail_sales VALUES (102, 2, 'Anita',   202, 'Mobile',     'Electronics', 2, 20000, TO_DATE('2024-01-11','YYYY-MM-DD'), 'Chennai');
-- -- -- INSERT INTO retail_sales VALUES (103, 3, 'Kiran',   203, 'Shoes',      'Fashion',     1, 3000,  TO_DATE('2024-01-12','YYYY-MM-DD'), 'Hyderabad');
-- -- -- INSERT INTO retail_sales VALUES (104, 4, 'Sneha',   204, 'Watch',      'Accessories', 1, 7000,  TO_DATE('2024-01-13','YYYY-MM-DD'), 'Mumbai');
-- -- -- INSERT INTO retail_sales VALUES (105, 5, 'Arjun',   205, 'T-shirt',    'Fashion',     3, 1500,  TO_DATE('2024-01-14','YYYY-MM-DD'), 'Delhi');
-- -- -- INSERT INTO retail_sales VALUES (106, 6, 'Meena',   206, 'Tablet',     'Electronics', 1, 25000, TO_DATE('2024-01-15','YYYY-MM-DD'), 'Pune');
-- -- -- INSERT INTO retail_sales VALUES (107, 7, 'Ravi',    207, 'Headphones', 'Electronics', 2, 3000,  TO_DATE('2024-01-16','YYYY-MM-DD'), 'Kolkata');
-- -- -- INSERT INTO retail_sales VALUES (108, 8, 'Priya',   208, 'Bag',        'Accessories', 1, 2000,  TO_DATE('2024-01-17','YYYY-MM-DD'), 'Ahmedabad');
-- -- -- INSERT INTO retail_sales VALUES (109, 9, 'Vikram',  209, 'Jeans',      'Fashion',     2, 2500,  TO_DATE('2024-01-18','YYYY-MM-DD'), 'Jaipur');
-- -- -- INSERT INTO retail_sales VALUES (110, 10,'Divya',   210, 'Camera',     'Electronics', 1, 45000, TO_DATE('2024-01-19','YYYY-MM-DD'), 'Bangalore');


-- -- -- update, delete, truncate

-- -- -- UPDATE retail_sales
-- -- -- SET price = 60000
-- -- -- WHERE product_name = 'Laptop'


-- -- -- SELECT 
-- -- --     order_id,
-- -- --     customer_name,
-- -- --     order_date,
-- -- --     ROW_NUMBER() OVER (ORDER BY order_date) AS row_num
-- -- -- FROM retail_sales

-- SELECT *
-- FROM (
--     SELECT 
--         order_id,
--         customer_id,
--         customer_name,
--         product_name,
--         order_date,
--         ROW_NUMBER() OVER (
--             PARTITION BY customer_id 
--             ORDER BY order_date DESC
--         ) AS rn
--     FROM retail_sales
-- )
-- WHERE rn = 1

-- SELECT *
-- FROM (
--     SELECT 
--         product_name,
--         category,
--         price,
--         ROW_NUMBER() OVER (
--             PARTITION BY category
--             ORDER BY price DESC
--         ) AS rn
--     FROM retail_sales
-- )
-- WHERE rn <= 2

-- SELECT 
--     order_id,
--     customer_name,
--     product_name,
--     price,
--     RANK() OVER (ORDER BY price DESC) AS price_rank
-- FROM retail_sales


-- SELECT *
-- FROM (
--     SELECT 
--         product_name,
--         category,
--         price,
--         RANK() OVER (
--             PARTITION BY category
--             ORDER BY price DESC
--         ) AS rnk
--     FROM retail_sales
-- )
-- WHERE rnk = 2


-- SELECT 
--     product_name,
--     category,
--     price,
--     DENSE_RANK() OVER (
--         PARTITION BY category
--         ORDER BY price DESC
--     ) AS price_rank
-- FROM retail_sales


-- SELECT *
-- FROM (
--     SELECT 
--         product_name,
--         category,
--         price,
--         DENSE_RANK() OVER (ORDER BY price DESC) AS price_rank
--     FROM retail_sales
-- )
-- WHERE price_rank <= 3

-- SELECT 
--     customer_id,
--     customer_name,
--     order_id,
--     order_date,
--     price,
--     LEAD(price) OVER (
--         PARTITION BY customer_id
--         ORDER BY order_date
--     ) AS next_order_price
-- FROM retail_sales


-- SELECT 
--     customer_id,
--     customer_name,
--     order_id,
--     order_date,
--     LEAD(order_date) OVER (
--         PARTITION BY customer_id
--         ORDER BY order_date
--     ) AS next_order_date
-- FROM retail_sales


-- SELECT 
--     customer_id,
--     customer_name,
--     order_id,
--     order_date,
--     price,
--     LAG(price) OVER (
--         PARTITION BY customer_id
--         ORDER BY order_date
--     ) AS previous_order_price
-- FROM retail_sales


-- UPDATE retail_sales
-- SET city = 'Delhi'
-- WHERE customer_id = 1


-- UPDATE retail_sales
-- SET price = price * 1.10
-- WHERE category = 'Electronics'

-- DELETE FROM retail_sales
-- WHERE order_id = 101

-- DELETE FROM retail_sales
-- WHERE category = 'Fashion'

-- DELETE FROM retail_sales
-- WHERE price < 3000

-- TRUNCATE TABLE retail_sales

-- DROP TABLE retail_sales

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


-- SELECT d.dept_id,
--        d.dept_name,
--        COUNT(e.emp_id) AS employee_count
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- GROUP BY d.dept_id, d.dept_name
-- ORDER BY d.dept_id;

-- SELECT e.emp_name,
--        COALESCE(TO_CHAR(e.salary), 'Salary Missing') AS salary_text,
--        d.dept_name
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id;


-- SELECT d.dept_name, e.emp_name, e.salary
-- FROM departments d
-- LEFT JOIN employees e
--     ON d.dept_id = e.dept_id
-- ORDER BY d.dept_name, e.salary DESC NULLS LAST;


-- SELECT d.dept_id, d.dept_name
-- FROM departments d
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM employees e
--     WHERE e.dept_id = d.dept_id
-- );

-- SELECT COUNT(*) AS no_dept_employees
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- WHERE d.dept_id IS NULL;

-- 1
-- SELECT e.emp_name, d.dept_name from EMPLOYEES e join DEPARTMENTS d on e.DEPT_ID = d.DEPT_ID

-- 2
-- SELECT e.emp_id, e.emp_name, d.dept_name
-- FROM employees e
-- LEFT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY e.emp_id

-- 3
-- SELECT d.dept_id, d.dept_name, e.emp_name
-- FROM employees e
-- RIGHT JOIN departments d
--     ON e.dept_id = d.dept_id
-- ORDER BY d.dept_id, e.emp_name

-- 4
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

-- 5
-- select e.*
-- from employees e
-- left join departments d
-- on e.dept_id = d.dept_id
-- where d.dept_id is null;


-- 6
-- select d.dept_id, d.dept_name
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name
-- having count(e.emp_id) = 0;

-- 7
-- select d.dept_id, d.dept_name, count(e.emp_id)
-- from departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name

-- 8
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

-- 10
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

-- 12
-- select 
--     d.dept_id,
--     d.dept_name,
--     count(e.emp_id)
-- from DEPARTMENTS d  JOIN EMPLOYEES e
-- on e.DEPT_ID = d.DEPT_ID
-- group by d.dept_id, d.dept_name
-- having count(emp_id)>1

-- 13
-- select
--     d.LOCATION,
--     sum(e.salary)
-- from DEPARTMENTS d left JOIN EMPLOYEES e
-- on e.DEPT_ID = d.DEPT_ID
-- group by d.location

-- 14
-- select
--     e.*
-- from EMPLOYEES e left JOIN DEPARTMENTS d
-- on e.DEPT_ID = d.DEPT_ID
-- where d.location = 'Bengaluru'

-- 15
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

-- 16
-- select d.dept_id, d.dept_name
-- from departments d
-- join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id, d.dept_name
-- having count(e.emp_id) > 0 and count(e.salary) = 0;

-- 17
-- select d.dept_id, d.dept_name
-- from departments d
-- where not exists (
--     select 1
--     from employees e
--     where e.dept_id = d.dept_id
-- )

-- 18
-- select count(*) as Dept_with_no_emp
-- from EMPLOYEES where dept_id is null

-- 19
-- select d.dept_name, e.emp_name
-- from departments d
-- cross join employees e

-- 20
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


----------------------------------------------------------------------------

-- cte practice
-- 1.

-- with company_avg as (
--     select avg(salary)as avg_salary
--     from hr.Employees
--     ),
--     dept_avg as (
--         select department_id,
--         avg(salary) as dept_avg_sal
--         from hr.EMPLOYEES
--         group by department_id
--     ),
--     top_earners as (
--         select e.employee_id,
--         e.first_name,
--         e.salary
--         from hr.EMPLOYEES e
--         join dept_avg d
--         on e.department_id = d.department_id
--         and d.dept_avg_sal > (select avg_salary from company_avg)
--     )
--     select * from top_earners;

-- SELECT e.emp_name
-- FROM Employees e
-- JOIN (
--     SELECT dept_id, AVG(salary) avg_sal
--     FROM Employees GROUP BY dept_id
-- ) d
-- ON e.dept_id = d.dept_id
-- WHERE e.salary > d.avg_sal;


-- SELECT emp_name
-- FROM Employees e1
-- WHERE salary > (
--     SELECT AVG(salary)
--     FROM Employees e2
--     WHERE e2.dept_id = e1.dept_id
--     group by  dept_id
-- );
-- 

-- SELECT emp_name
-- FROM Employees e1
-- WHERE NOT EXISTS (
--     SELECT 1 FROM Employees e2
--     WHERE e2.manager_id = e1.emp_id
-- );

-- 15
-- SELECT emp_name
-- FROM Employees e1
-- WHERE salary = (
--     SELECT MIN(salary)
--     FROM Employees e2
--     WHERE e2.dept_id = e1.dept_id
-- );

-- 16

-- SELECT full_name
-- FROM co.CUSTOMERS c
-- WHERE EXISTS (
--     SELECT 1 FROM co.Orders o WHERE o.customer_id = c.customer_id
-- );


-- 17
-- WITH dept_total AS (
--     SELECT dept_id, SUM(salary) total
--     FROM Employees GROUP BY dept_id
-- )
-- SELECT * FROM dept_total;

-- 19

-- WITH cte AS (
--     SELECT first_name, salary,
--            RANK() OVER (ORDER BY salary DESC) rnk
--     FROM hr.Employees
-- )
-- SELECT * FROM cte;





-------------------------------------------------------------

-- CREATE TABLE airlines (
--     airline_id INT PRIMARY KEY,
--     airline_name VARCHAR(100),
--     country VARCHAR(50)
-- );

CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    source VARCHAR(50),
    destination VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    price DECIMAL(10,2),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);