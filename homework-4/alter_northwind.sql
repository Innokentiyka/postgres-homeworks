-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
DELETE FROM products WHERE unit_price <= 0;
ALTER TABLE products
ADD CONSTRAINT CK_UnitPrice_Positive CHECK (unit_price > 0);


-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
SELECT * FROM products WHERE discontinued NOT IN (0, 1);
DELETE FROM products WHERE discontinued NOT IN (0, 1);


ALTER TABLE products
ADD CONSTRAINT CK_Discontinued_Values CHECK (discontinued IN (0, 1));

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
CREATE TABLE DiscontinuedProducts AS
SELECT *
FROM products
WHERE discontinued = 1;

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
CREATE TEMP TABLE Temp_DiscontinuedProducts AS
SELECT *
FROM products
WHERE discontinued = 1;

DELETE FROM products WHERE discontinued = 1;

UPDATE order_details
SET product_id = p.product_id
FROM Temp_DiscontinuedProducts p
WHERE order_details.product_id = p.product_id;

DROP TABLE Temp_DiscontinuedProducts;