/*
CREATE TABLE Staff (staff_id INT,
                    name VARCHAR(30),
                    salary INT,
                    email VARCHAR(30),
                    birthday DATE,
                    jobtitle_id INT);

INSERT INTO Staff (staff_id, name, salary, email, birthday, jobtitle_id)
VALUES
(1, 'Иванов Сергей', 100000, 'test@test.ru', '1990.03.03', 1),
(2, 'Петров Пётр', 60000, 'petr@test.ru', '2000.12.01', 7),
(3, 'Сидоров Василий', 80000, 'test@test.ru', '1999.02.04', 6),
(4, 'Максимов Иван', 70000, 'ivan.m@test.ru', '1997.10.02', 4),
(5, 'Попов Иван', 120000, 'popov@test.ru', '2001.04.25', 5);

CREATE TABLE Jobtitles (jobtitle_id INT PRIMARY KEY AUTO_INCREMENT,
                        name VARCHAR(30));

INSERT INTO Jobtitles(name)
VALUES
('Разработчик'),
('Системный аналитик'),
('Менеджер проектов'),
('Системный администратор'),
('Руководитель группы'),
('Инженер тестирования'),
('Сотрудник группы поддержки');
*/ 

-- Запрос №1

SELECT * FROM Staff
WHERE email IN
(
    SELECT email FROM Staff
    GROUP BY email
    HAVING COUNT(email) > 1
);

-- Запрос №2

SELECT name, TIMESTAMPDIFF(YEAR, birthday , CURDATE()) AS age FROM Staff;

-- Запрос №3

SELECT Jobtitles.name FROM Staff
INNER JOIN Jobtitles 
ON Staff.jobtitle_id=Jobtitles.jobtitle_id
ORDER BY salary DESC
    LIMIT 1,1;