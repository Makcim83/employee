CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'male', 29);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Anna', 'Sidorova', 'female', 25);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Victoria', 'Petrova', 'female', 52);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Vladislav', 'Semenov', 'male', 55);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Igor', 'Popov', 'male', 42);


-- Получите информацию об именах и фамилиях по всем сотрудникам.
-- Колонки должны называться «Имя» и «Фамилия».
SELECT first_name AS Имя,
       last_name  AS Фамилия
FROM employee;

-- Получите всю информацию о сотрудниках, которые младше 30 или старше 50 лет.
SELECT *
FROM employee
WHERE age NOT BETWEEN 30 AND 50;

-- Получите всю информацию о сотрудниках, которым от 30 до 50 лет.
SELECT *
FROM employee
WHERE age BETWEEN 30 AND 50;

-- Выведите полный список сотрудников, которые отсортированы
-- по фамилиям в обратном порядке.
SELECT *
FROM employee
ORDER BY last_name DESC;

-- Выведите сотрудников, имена которых длиннее 4 символов.
SELECT *
FROM employee
WHERE first_name LIKE '_____%';

-- Измените имена у двух сотрудников так, чтобы на 5 сотрудников было
-- только 3 разных имени, то есть чтобы получились две пары тезок и
-- один сотрудник с уникальным именем.
UPDATE employee
SET first_name='Anna'
WHERE id = 3;

UPDATE employee
SET first_name='Vladislav'
WHERE id = 5;

-- Посчитайте суммарный возраст для каждого имени.
-- Выведите в двух столбцах «имя» и «суммарный возраст».
SELECT first_name AS имя,
       SUM(age)   AS суммарный_возраст
FROM employee
GROUP BY first_name;

-- Выведите имя и самый юный возраст, соответствующий имени.
SELECT first_name AS имя,
       min(age)   AS минимальный_возраст
FROM employee
GROUP BY first_name;

UPDATE employee
SET age=55
WHERE id = 4;

-- Выведите имя и максимальный возраст только для неуникальных имен.
-- Результат отсортируйте по возрасту в порядке возрастания.
SELECT first_name AS имя,
       MAX(age)   AS максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT (first_name) > 1
ORDER BY максимальный_возраст;