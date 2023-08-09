"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

CUSTOMERS_PATH = 'north_data/customers_data.csv'
EMPLOYEES_PATH = 'north_data/employees_data.csv'
ORDERS_PATH = 'north_data/orders_data.csv'

conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="12345"
)

cur = conn.cursor()

with open(CUSTOMERS_PATH, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    next(reader)  # Пропуск заголовка
    for row in reader:
        # Формирование SQL-запроса на добавление данных
        sql = "INSERT INTO customers (customer_id, company_name, contact_name) VALUES (%s, %s, %s)"
        # Выполнение SQL-запроса с передачей параметров
        cur.execute(sql, (row[0], row[1], row[2]))
        
with open(EMPLOYEES_PATH, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    next(reader)  # Пропуск заголовка
    for row in reader:
        # Формирование SQL-запроса на добавление данных
        sql = "INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)"
        # Выполнение SQL-запроса с передачей параметров
        cur.execute(sql, (row[0], row[1], row[2], row[3], row[4], row[5]))

with open(ORDERS_PATH, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    next(reader)  # Пропуск заголовка
    for row in reader:
        # Формирование SQL-запроса на добавление данных
        sql = "INSERT INTO orders VALUES (%s, %s, %s, %s, %s)"
        # Выполнение SQL-запроса с передачей параметров
        cur.execute(sql, (row[0], row[1], row[2], row[3], row[4]))

conn.commit()
cur.close()
conn.close()