-- CREATE TABLE airlines (
--     airline_id INT PRIMARY KEY,
--     airline_name VARCHAR(100),
--     country VARCHAR(50)
-- );


-- CREATE TABLE flights (
--     flight_id INT PRIMARY KEY,
--     airline_id INT,
--     source VARCHAR2(50),
--     destination VARCHAR2(50),
--     departure_time TIMESTAMP,
--     arrival_time TIMESTAMP,
--     price NUMBER(10,2),
--     FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
-- );

-- INSERT INTO airlines VALUES
-- (1, 'Air India', 'India'),
-- (2, 'IndiGo', 'India'),
-- (3, 'Emirates', 'UAE'),
-- (4, 'Qatar Airways', 'Qatar');


-- INSERT ALL

-- INTO flights VALUES (101, 1, 'Delhi', 'Mumbai',
--   TO_TIMESTAMP('2026-04-01 08:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-01 10:00:00','YYYY-MM-DD HH24:MI:SS'),
--   600)

-- INTO flights VALUES (102, 1, 'Mumbai', 'Bangalore',
--   TO_TIMESTAMP('2026-04-02 09:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-02 11:30:00','YYYY-MM-DD HH24:MI:SS'),
--   750)

-- INTO flights VALUES (103, 2, 'Delhi', 'Bangalore',
--   TO_TIMESTAMP('2026-04-01 07:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-01 10:00:00','YYYY-MM-DD HH24:MI:SS'),
--   500)

-- INTO flights VALUES (104, 2, 'Bangalore', 'Chennai',
--   TO_TIMESTAMP('2026-04-03 06:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-03 07:00:00','YYYY-MM-DD HH24:MI:SS'),
--   300)

-- INTO flights VALUES (105, 3, 'Dubai', 'Delhi',
--   TO_TIMESTAMP('2026-04-01 02:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-01 07:00:00','YYYY-MM-DD HH24:MI:SS'),
--   1200)

-- INTO flights VALUES (106, 3, 'Delhi', 'Dubai',
--   TO_TIMESTAMP('2026-04-02 03:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-02 08:00:00','YYYY-MM-DD HH24:MI:SS'),
--   1100)

-- INTO flights VALUES (107, 4, 'Doha', 'Mumbai',
--   TO_TIMESTAMP('2026-04-01 04:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-01 09:00:00','YYYY-MM-DD HH24:MI:SS'),
--   1300)

-- INTO flights VALUES (108, 4, 'Mumbai', 'Doha',
--   TO_TIMESTAMP('2026-04-02 05:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-02 10:00:00','YYYY-MM-DD HH24:MI:SS'),
--   1250)

-- INTO flights VALUES (109, 1, 'Delhi', 'Mumbai',
--   TO_TIMESTAMP('2026-04-01 08:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-01 10:00:00','YYYY-MM-DD HH24:MI:SS'),
--   600)

-- INTO flights VALUES (110, 2, 'Delhi', 'Bangalore',
--   TO_TIMESTAMP('2026-04-04 07:00:00','YYYY-MM-DD HH24:MI:SS'),
--   TO_TIMESTAMP('2026-04-04 10:00:00','YYYY-MM-DD HH24:MI:SS'),
--   550)

-- SELECT * FROM dual;

-- select * from flights;

-- 1
-- WITH flight_cte AS (
--     SELECT *
--     FROM flights
-- )
-- SELECT *
-- FROM flight_cte
-- WHERE price > 500;

-- 2
-- WITH flight_details AS (
--     SELECT 
--         a.airline_name,
--         f.source,
--         f.destination,
--         f.price
--     FROM flights f
--     JOIN airlines a
--         ON f.airline_id = a.airline_id
-- )
-- SELECT *
-- FROM flight_details;

-- 3
-- WITH avg_price_cte AS (
--     SELECT 
--         airline_id,
--         AVG(price) AS avg_price
--     FROM flights
--     GROUP BY airline_id
-- )
-- SELECT 
--     a.airline_name,
--     c.avg_price
-- FROM avg_price_cte c
-- JOIN airlines a
--     ON c.airline_id = a.airline_id;

-- 4
-- WITH avg_price_cte AS (
--     SELECT 
--         airline_id,
--         AVG(price) AS avg_price
--     FROM flights
--     GROUP BY airline_id
-- )
-- SELECT 
--     a.airline_name,
--     c.avg_price
-- FROM avg_price_cte c
-- JOIN airlines a
--     ON c.airline_id = a.airline_id
-- WHERE c.avg_price > 700;

-- 5

-- WITH ranked_flights AS (
--     SELECT 
--         flight_id,
--         airline_id,
--         source,
--         destination,
--         price,
--         RANK() OVER (
--             PARTITION BY airline_id
--             ORDER BY price DESC
--         ) AS price_rank
--     FROM flights
-- )
-- SELECT *
-- FROM ranked_flights;


-- 6
-- WITH ranked_flights AS (
--     SELECT 
--         f.flight_id,
--         a.airline_name,
--         f.source,
--         f.destination,
--         f.price,
--         RANK() OVER (
--             PARTITION BY f.airline_id
--             ORDER BY f.price DESC
--         ) AS rnk
--     FROM flights f
--     JOIN airlines a
--         ON f.airline_id = a.airline_id
-- )
-- SELECT *
-- FROM ranked_flights
-- WHERE rnk = 1;

-- 8
-- WITH duplicate_flights AS (
--     SELECT 
--         source,
--         destination,
--         departure_time,
--         COUNT(*) AS cnt
--     FROM flights
--     GROUP BY source, destination, departure_time
--     HAVING COUNT(*) > 1
-- )
-- SELECT *
-- FROM duplicate_flights;

-- 9
-- WITH running_total_cte AS (
--     SELECT 
--         f.flight_id,
--         f.airline_id,
--         f.departure_time,
--         f.price,
--         SUM(f.price) OVER (
--             PARTITION BY f.airline_id
--             ORDER BY f.departure_time
--         ) AS total_price
--     FROM flights f
-- )
-- SELECT *
-- FROM running_total_cte
-- ORDER BY airline_id, departure_time;

-- 10
-- WITH flight_count_cte AS (
--     SELECT 
--         airline_id,
--         COUNT(*) AS total_flights
--     FROM flights
--     GROUP BY airline_id
-- ),
-- avg_price_cte AS (
--     SELECT 
--         airline_id,
--         AVG(price) AS avg_price
--     FROM flights
--     GROUP BY airline_id
-- )
-- SELECT 
--     a.airline_name,
--     fc.total_flights,
--     ap.avg_price
-- FROM flight_count_cte fc
-- JOIN avg_price_cte ap
--     ON fc.airline_id = ap.airline_id
-- JOIN airlines a
--     ON fc.airline_id = a.airline_id;


-- Subquery
-- 1

-- SELECT *
-- FROM (
--     SELECT *
--     FROM flights
-- ) 
-- WHERE price > 500;

-- 2

-- SELECT 
--     a.airline_name,
--     f.source,
--     f.destination,
--     f.price
-- FROM (
--     SELECT *
--     FROM flights
-- ) f
-- JOIN airlines a
--     ON f.airline_id = a.airline_id;

-- 3
-- SELECT 
--     a.airline_name,
--     f.avg_price
-- FROM (
--     SELECT 
--         airline_id,
--         AVG(price) AS avg_price
--     FROM flights
--     GROUP BY airline_id
-- ) f
-- JOIN airlines a
--     ON f.airline_id = a.airline_id;

-- 4
-- SELECT 
--     a.airline_name,
--     f.avg_price
-- FROM (
--     SELECT 
--         airline_id,
--         AVG(price) AS avg_price
--     FROM flights
--     GROUP BY airline_id
-- ) f
-- JOIN airlines a
--     ON f.airline_id = a.airline_id
-- WHERE f.avg_price > 700;

-- 5

-- SELECT *
-- FROM (
--     SELECT 
--         f.flight_id,
--         f.airline_id,
--         f.source,
--         f.destination,
--         f.price,
--         RANK() OVER (
--             PARTITION BY f.airline_id
--             ORDER BY f.price DESC
--         ) AS price_rank
--     FROM flights f
-- ) ranked_flights;


-- 6
-- SELECT *
-- FROM flights f
-- WHERE f.price = (
--     SELECT MAX(f2.price)
--     FROM flights f2
--     WHERE f2.airline_id = f.airline_id
-- );

-- 8
-- SELECT *
-- FROM flights f
-- WHERE (f.source, f.destination, f.departure_time) IN (
--     SELECT 
--         source, 
--         destination, 
--         departure_time
--     FROM flights
--     GROUP BY source, destination, departure_time
--     HAVING COUNT(*) > 1
-- );

-- 9
-- SELECT 
--     f1.flight_id,
--     f1.airline_id,
--     f1.departure_time,
--     f1.price,
--     (
--         SELECT SUM(f2.price)
--         FROM flights f2
--         WHERE f2.airline_id = f1.airline_id
--           AND f2.departure_time <= f1.departure_time
--     ) AS running_total
-- FROM flights f1
-- ORDER BY f1.airline_id, f1.departure_time;

-- 10

-- SELECT 
--     a.airline_name,

--     (
--         SELECT COUNT(*)
--         FROM flights f
--         WHERE f.airline_id = a.airline_id
--     ) AS total_flights,

--     (
--         SELECT AVG(f.price)
--         FROM flights f
--         WHERE f.airline_id = a.airline_id
--     ) AS avg_price

-- FROM airlines a;