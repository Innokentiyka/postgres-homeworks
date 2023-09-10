-- SQL-команды для создания таблиц
CREATE TABLE customers
(
	customer_id CHAR PRIMARY KEY,
	company_name CHARACTER VARYING,
	contact_name CHARACTER VARYING
);

CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
	first_name CHARACTER VARYING,
	last_name CHARACTER VARYING,
	title CHARACTER VARYING,
	birth_date DATE,
	notes CHARACTER VARYING
);

CREATE TABLE orders
(
	order_id INT PRIMARY KEY,
	customer_id CHAR REFERENCES customers(customer_id),
	employee_id INT REFERENCES employees(employee_id),
	order_date DATE,
	ship_city CHARACTER VARYING
);