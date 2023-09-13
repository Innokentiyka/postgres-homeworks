"""Скрипт для заполнения данными таблиц в БД Postgres."""


import pandas as pd
import psycopg2
from pandas.core.interchange import dataframe
from psycopg2 import sql





def insert_data_to_db(dataframe, table_name, columns):
    """Функция для добавления данных в таблицу базы данных."""

    # Создайте соединение с вашей базой данных
    connection = psycopg2.connect(
        host="localhost",
        database="north",
        user="postgres",
        password="kerik00989A"
    )

    cursor = connection.cursor()

    for index, row in dataframe.iterrows():
        placeholders = ", ".join(["%s"] * len(columns))
        insert_query = sql.SQL(
            f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({placeholders});"
        )
        cursor.execute(insert_query, tuple(row[col] for col in columns))

    # Фиксируем транзакцию
    connection.commit()

    # Закрываем курсор и соединение
    cursor.close()
    connection.close()


if __name__ == "main":
    # Загрузка и вставка данных о сотрудниках
    df_employees = pd.read_csv('employees_data.csv')
    insert_data_to_db(df_employees, 'employees', ['employee_id', 'first_name', 'last_name', 'title', 'birth_date', 'notes'])

    # Загрузка и вставка данных о заказах
    df_orders = pd.read_csv('orders_data.csv')
    insert_data_to_db(df_orders, 'orders', ['order_id', 'customer_id', 'employee_id', 'order_date', 'ship_city'])

    # Загрузка и вставка данных о клиентах
    df_customers = pd.read_csv('customers_data.csv')
    insert_data_to_db(df_customers, 'customers', ['customer_id', 'company_name', 'contact_name'])





