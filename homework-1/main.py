"""Скрипт для заполнения данными таблиц в БД Postgres."""


import psycopg2



conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="kerik00989A"
    )





