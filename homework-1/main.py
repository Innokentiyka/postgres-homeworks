"""Скрипт для заполнения данными таблиц в БД Postgres."""
from multiprocessing import connection

import psycopg2
import pandas as pd

if __name__ == 'main':
    conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="kerik00989A"
    )





