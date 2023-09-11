-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)
SELECT
distinct ship_city,
ship_country
FROM
orders
where RIGHT(ship_city, 4) = 'burg'

-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.
SELECT
distinct order_id,
customer_id,
freight,
ship_country
FROM
orders
where LEFT(ship_country , 1) = 'P'
order by freight desc
limit 10

-- 3. фамилию, имя и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)
select
first_name,
last_name,
home_phone
from employees
where region is NULL

-- 4. количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране
select
country,
count(*)
from suppliers
group by country
order by count desc

-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)
SELECT    ship_country,
SUM(freight)
FROM    orders
WHERE    ship_region IS NOT NULL
GROUP BY    ship_country
HAVING    SUM(freight) > 2750
ORDER BY    SUM(freight) DESC

-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).
SELECT c.country
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM suppliers s WHERE s.country = c.country
)
AND EXISTS (
    SELECT 1 FROM employees e WHERE e.country = c.country
)
GROUP BY c.country;

-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).
SELECT c.country
FROM customers c
JOIN suppliers s ON c.country = s.country
WHERE NOT EXISTS (
    SELECT 1 FROM employees e WHERE e.country = c.country
)
GROUP BY c.country;