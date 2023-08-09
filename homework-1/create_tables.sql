-- SQL-команды для создания таблиц

CREATE TABLE customers
(
	customer_id varchar(100) NOT NULL,
	company_name varchar(100) NOT NULL,
	contact_name varchar(100) NOT NULL
);

CREATE TABLE employees
(
	employee_id SERIAL PRIMARY KEY,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	title varchar(100) NOT NULL,
	birth_date DATE,
	notes TEXT
);

CREATE TABLE orders
(
	order_id SERIAL PRIMARY KEY,
	customer_id varchar(100),
	employee_id int,
	order_date DATE,
	ship_city varchar(100),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);