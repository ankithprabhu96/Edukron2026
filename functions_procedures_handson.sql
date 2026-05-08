--    FUNCTIONS

-- -- 1. Addition Function
-- CREATE OR REPLACE FUNCTION fn_add(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a + b;
-- END;
-- /
-- SELECT fn_add(10, 20)
-- FROM dual;

-- -- 2. Subtraction Function
-- CREATE OR REPLACE FUNCTION fn_subtract(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a - b;
-- END;
-- /

-- SELECT fn_subtract(10, 20) FROM dual;

-- -- 3. Multiplication Function
-- CREATE OR REPLACE FUNCTION fn_multiply(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * b;
-- END;
-- /

-- SELECT fn_multiply(10, 20) FROM dual;

-- -- 4. Division Function
-- CREATE OR REPLACE FUNCTION fn_divide(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a / b;
-- END;
-- /
-- SELECT fn_divide(10, 20) FROM dual;



-- -- 5. Square Function
-- CREATE OR REPLACE FUNCTION fn_square(a NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * a;
-- END;
-- /
-- SELECT fn_square(10) FROM dual;


-- -- 6. Cube Function
-- CREATE OR REPLACE FUNCTION fn_cube(a NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * a * a;
-- END;
-- /
-- SELECT fn_cube(20) FROM dual;


-- -- 7. Even or Odd Function
-- CREATE OR REPLACE FUNCTION fn_even_odd(a NUMBER)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     IF MOD(a,2)=0 THEN
--         RETURN 'EVEN';
--     ELSE
--         RETURN 'ODD';
--     END IF;
-- END;
-- /

-- SELECT fn_even_odd(-3) FROM dual;


-- -- 8. Maximum Number Function
-- CREATE OR REPLACE FUNCTION fn_max(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     IF a > b THEN
--         RETURN a;
--     ELSE
--         RETURN b;
--     END IF;
-- END;
-- /
-- SELECT fn_max(-3, -10) FROM dual;



-- -- 9. Minimum Number Function
-- CREATE OR REPLACE FUNCTION fn_min(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     IF a < b THEN
--         RETURN a;
--     ELSE
--         RETURN b;
--     END IF;
-- END;
-- /

-- SELECT fn_min(-3, -10) FROM dual;


-- -- 10. Factorial Function
-- CREATE OR REPLACE FUNCTION fn_factorial(n NUMBER)
-- RETURN NUMBER
-- IS
--     fact NUMBER := 1;
-- BEGIN
--     FOR i IN 1..n LOOP
--         fact := fact * i;
--     END LOOP;
--     RETURN fact;
-- END;
-- /
-- SELECT fn_factorial(5) FROM dual;


-- -- 11. String Length Function
-- CREATE OR REPLACE FUNCTION fn_string_length(txt VARCHAR2)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN LENGTH(txt);
-- END;
-- /
-- SELECT fn_string_length('abcd') FROM dual;



-- -- 12. Uppercase Function
-- CREATE OR REPLACE FUNCTION fn_uppercase(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN UPPER(txt);
-- END;
-- /
-- SELECT fn_uppercase('abcd') FROM dual;


-- -- 13. Lowercase Function
-- CREATE OR REPLACE FUNCTION fn_lowercase(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN LOWER(txt);
-- END;
-- /

-- SELECT fn_lowercase('ABCD') FROM dual;


-- -- 14. Reverse String Function
-- CREATE OR REPLACE FUNCTION fn_reverse(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN REVERSE(txt);
-- END;
-- /

-- SELECT fn_reverse('abcd') FROM dual;


-- CREATE OR REPLACE FUNCTION fn_reverse(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
--     v_result VARCHAR2(100) := '';
-- BEGIN
--     FOR i IN REVERSE 1 .. LENGTH(txt) LOOP
--         v_result := v_result || SUBSTR(txt, i, 1);
--     END LOOP;

--     RETURN v_result;
-- END;
-- /

-- SELECT fn_reverse('abcd') FROM dual;


-- -- 15. Current Date Function
-- CREATE OR REPLACE FUNCTION fn_current_date
-- RETURN DATE
-- IS
-- BEGIN
--     RETURN SYSDATE;
-- END;
-- /

-- SELECT fn_current_date FROM dual;


-- -- 16. Age Calculation Function
-- CREATE OR REPLACE FUNCTION fn_age(dob DATE)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, dob)/12);
-- END;
-- /

-- SELECT fn_age(DATE '2000-01-01') FROM dual;


-- -- 17. Simple Interest Function
-- CREATE OR REPLACE FUNCTION fn_simple_interest(p NUMBER, r NUMBER, t NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN (p*r*t)/100;
-- END;
-- /

-- SELECT fn_simple_interest(999.98, 3, 50) FROM dual;


-- -- 18. Circle Area Function
-- CREATE OR REPLACE FUNCTION fn_circle_area(radius NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN 3.14 * radius * radius;
-- END;
-- /

-- SELECT fn_circle_area(3.14) FROM dual;


-- -- 19. Palindrome Function
-- CREATE OR REPLACE FUNCTION fn_palindrome(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
--     v_rev VARCHAR2(100) := '';
-- BEGIN
--     FOR i IN REVERSE 1 .. LENGTH(txt) LOOP
--         v_rev := v_rev || SUBSTR(txt, i, 1);
--     END LOOP;

--     IF txt = v_rev THEN
--         RETURN 'PALINDROME';
--     ELSE
--         RETURN 'NOT PALINDROME';
--     END IF;
-- END;
-- /

-- SELECT fn_palindrome('racecar') FROM dual;



-- -- 20. Salary Hike Function
-- CREATE OR REPLACE FUNCTION fn_salary_hike(salary NUMBER, percent NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN salary + (salary * percent/100);
-- END;
-- /

-- SELECT fn_salary_hike(999.98, 35) FROM dual;


-- /* =========================
--    PROCEDURES
--    ========================= */

-- -- 1. Hello Procedure
-- CREATE OR REPLACE PROCEDURE pr_hello
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
-- END;
-- /

-- EXEC pr_hello;


-- -- 2. Print Number
-- CREATE OR REPLACE PROCEDURE pr_print_number(n NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('NUMBER: ' || n);
-- END;
-- /

-- EXEC PR_PRINT_NUMBER(445);


-- -- 3. Addition Procedure
-- CREATE OR REPLACE PROCEDURE pr_add(a NUMBER, b NUMBER)
-- IS
--     c NUMBER;
-- BEGIN
--     c := a + b;
--     DBMS_OUTPUT.PUT_LINE('SUM: ' || c);
-- END;
-- /

-- EXEC pr_add(113, 10.0075);


-- -- 4. Subtraction Procedure
-- CREATE OR REPLACE PROCEDURE pr_subtract(a NUMBER, b NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('SUBTRACTION: ' || (a-b));
-- END;
-- /
-- EXEC pr_subtract(-112,5);



-- -- 5. Multiplication Procedure
-- CREATE OR REPLACE PROCEDURE pr_multiply(a NUMBER, b NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('MULTIPLICATION: ' || (a*b));
-- END;
-- /

-- EXEC pr_multiply(4.5, 9.7);



-- -- 6. Division Procedure
-- CREATE OR REPLACE PROCEDURE pr_divide(a NUMBER, b NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('DIVISION: ' || (a/b));
-- END;
-- /

-- EXEC pr_divide(4.5, 9.7);


-- -- 7. Employee Insert Procedure
-- CREATE OR REPLACE PROCEDURE pr_insert_emp(
--     p_id NUMBER,
--     p_name VARCHAR2,
--     p_salary NUMBER
-- )
-- IS
-- BEGIN
--     INSERT INTO EMPLOYEES(emp_id, emp_name, salary)
--     VALUES(p_id, p_name, p_salary);

--     COMMIT;
-- END;
-- /

-- SELECT *
-- FROM ANKITHPRABHU_SCHEMA_FET9Y.employees where EMP_ID = 999;

-- SELECT *
-- FROM ANKITHPRABHU_SCHEMA_FET9Y.employees where EMP_ID = 999;


-- SELECT table_name
-- FROM user_tables;

-- EXEC pr_insert_emp(999, 'mike', 20000);


-- -- 8. Employee Update Salary
-- CREATE OR REPLACE PROCEDURE pr_update_salary(
--     p_id NUMBER,
--     p_salary NUMBER
-- )
-- IS
-- BEGIN
--     UPDATE employees
--     SET salary = p_salary
--     WHERE emp_id = p_id;

--     COMMIT;
-- END;
-- /

-- EXEC pr_update_salary(999, 40000);


-- -- 9. Employee Delete Procedure
-- CREATE OR REPLACE PROCEDURE pr_delete_emp(p_id NUMBER)
-- IS
-- BEGIN
--     DELETE FROM employees
--     WHERE emp_id = p_id;

--     COMMIT;
-- END;
-- /

-- EXEC pr_delete_emp(999);


-- -- 10. Print Current Date
-- CREATE OR REPLACE PROCEDURE pr_current_date
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(SYSDATE);
-- END;
-- /

-- EXEC pr_current_date;

-- -- 11. Even or Odd Procedure
-- CREATE OR REPLACE PROCEDURE pr_even_odd(n NUMBER)
-- IS
-- BEGIN
--     IF MOD(n,2)=0 THEN
--         DBMS_OUTPUT.PUT_LINE('EVEN');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('ODD');
--     END IF;
-- END;
-- /

-- EXEC pr_even_odd(29);



-- -- 12. Factorial Procedure
-- CREATE OR REPLACE PROCEDURE pr_factorial(n NUMBER)
-- IS
--     fact NUMBER := 1;
-- BEGIN
--     FOR i IN 1..n LOOP
--         fact := fact * i;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE('FACTORIAL: ' || fact);
-- END;
-- /

-- EXEC pr_factorial(4);


-- -- 13. Loop Numbers Procedure
-- CREATE OR REPLACE PROCEDURE pr_loop_numbers
-- IS
-- BEGIN
--     FOR i IN 1..10 LOOP
--         DBMS_OUTPUT.PUT_LINE(i);
--     END LOOP;
-- END;
-- /

-- EXEC pr_loop_numbers;



-- -- 14. Print Employee Count
-- CREATE OR REPLACE PROCEDURE pr_employee_count
-- IS
--     total NUMBER;
-- BEGIN
--     SELECT COUNT(*) INTO total
--     FROM employees;

--     DBMS_OUTPUT.PUT_LINE('TOTAL EMPLOYEES: ' || total);
-- END;
-- /


-- EXEC pr_employee_count;

-- -- 15. Print Employee Salary
-- CREATE OR REPLACE PROCEDURE pr_employee_salary(p_id NUMBER)
-- IS
--     sal NUMBER;
-- BEGIN
--     SELECT salary INTO sal
--     FROM EMPLOYEES
--     WHERE emp_id = p_id;

--     DBMS_OUTPUT.PUT_LINE('SALARY: ' || sal);
-- END;
-- /

-- EXEC pr_employee_salary(101);


-- -- 16. String Reverse Procedure
-- CREATE OR REPLACE PROCEDURE pr_reverse(txt VARCHAR2)
-- IS
--     v_result VARCHAR2(100) := '';
-- BEGIN
--     FOR i IN REVERSE 1 .. LENGTH(txt) LOOP
--         v_result := v_result || SUBSTR(txt, i, 1);
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE(v_result);
-- END;
-- /

-- EXEC PR_REVERSE('blue');


-- -- 17. Uppercase Procedure
-- CREATE OR REPLACE PROCEDURE pr_upper(txt VARCHAR2)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(UPPER(txt));
-- END;
-- /

-- EXEC pr_upper('bluE');

-- -- 18. Lowercase Procedure
-- CREATE OR REPLACE PROCEDURE pr_lower(txt VARCHAR2)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(LOWER(txt));
-- END;
-- /

-- EXEC pr_lower('BLUE');


-- -- 19. Bonus Calculation Procedure
-- CREATE OR REPLACE PROCEDURE pr_bonus(
--     salary NUMBER,
--     bonus_percent NUMBER
-- )
-- IS
--     bonus NUMBER;
-- BEGIN
--     bonus := salary * bonus_percent / 100;

--     DBMS_OUTPUT.PUT_LINE('BONUS: ' || bonus);
-- END;
-- /

-- EXEC pr_bonus(1000.83, 23.4);

-- -- 20. Swap Two Numbers Procedure
-- CREATE OR REPLACE PROCEDURE pr_swap(
--     a IN OUT NUMBER,
--     b IN OUT NUMBER
-- )
-- IS
--     temp NUMBER;
-- BEGIN
--     temp := a;
--     a := b;
--     b := temp;
-- END;


-- DECLARE
--     x NUMBER := 10;
--     y NUMBER := 20;
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Initial x = ' || x);
--     DBMS_OUTPUT.PUT_LINE('Initial y = ' || y);

--     pr_swap(x, y);

--     DBMS_OUTPUT.PUT_LINE('x = ' || x);
--     DBMS_OUTPUT.PUT_LINE('y = ' || y);
-- END;
-- /