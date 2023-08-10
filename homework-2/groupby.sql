-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, отправленные в города, заканчивающиеся на 'burg'. Вывести без повторений две колонки (город, страна) (см. таблица orders, колонки ship_city, ship_country)
SELECT DISTINCT ship_city, ship_country
from orders
WHERE ship_city LIKE '%burg';

-- 2. из таблицы orders идентификатор заказа, идентификатор заказчика, вес и страну отгрузки. Заказ отгружен в страны, начинающиеся на 'P'. Результат отсортирован по весу (по убыванию). Вывести первые 10 записей.
SELECT order_id, customer_id, freight, ship_country
from orders
WHERE ship_country LIKE 'P%'
ORDER BY freight;

-- 3. фамилию, имя и телефон сотрудников, у которых в данных отсутствует регион (см таблицу employees)
SELECT last_name, first_name, home_phone
from employees
WHERE region is NULL;

-- 4. количество поставщиков (suppliers) в каждой из стран. Результат отсортировать по убыванию количества поставщиков в стране
SELECT country, COUNT(country) as suppliers
from suppliers
GROUP BY country
ORDER BY suppliers DESC;

-- 5. суммарный вес заказов (в которых известен регион) по странам, но вывести только те результаты, где суммарный вес на страну больше 2750. Отсортировать по убыванию суммарного веса (см таблицу orders, колонки ship_region, ship_country, freight)
SELECT ship_country,
SUM(freight) as total
from orders
WHERE ship_region is NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY total DESC;

-- 6. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers) и работники (employees).
SELECT DISTINCT Country
FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers)
AND Country IN (SELECT Country FROM Employees);

-- 7. страны, в которых зарегистрированы и заказчики (customers) и поставщики (suppliers), но не зарегистрированы работники (employees).
SELECT DISTINCT country
from customers
WHERE country IN (SELECT country from suppliers)
AND country NOT IN (SELECT country from employees)