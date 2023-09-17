-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student (
    student_id serial PRIMARY KEY,
    first_name varchar,
    last_name varchar,
    birthday date,
    phone varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student
ADD COLUMN middle_name varchar;

-- 3. Удалить колонку middle_name
ALTER TABLE student
DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student
RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student
ALTER COLUMN phone TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone)
VALUES
    ('Кирилл', 'Алёшин', '2002-02-12', '123-456-789'),
    ('Абдурахман', 'Ла-Ахад', '1998-05-15', '987-654-321'),
    ('Матиас', 'Риверра', '2002-09-30', '555-555-555');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
DELETE FROM student;
ALTER SEQUENCE student_student_id_seq RESTART WITH 1;