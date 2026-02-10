--08-where.sql

id name age

CREATE TABLE students(
 id 	INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 NAME	VARCHAR(10),
 age 	INT);

 INSERT INTO students (name, age) VALUES
 ('박혁거세', 50);
('박수민', 20);
('정 민수', 50),
('서 지훈', 30),
('윤 하늘', 20),
('최 도윤', 25),
('강 수빈', 33),
('문 태오', 18),
('백 현우', 45),
('한 유진', 10),
('임 주원', 88),
('송 민재', 67),
('민희재', 50),
('박수민', 20);
SELECT * FROM students;

-- 특정 컬럼과 
-- 같음
SELECT * FROM students WHERE name = '송 민재';

--다름
SELECT * FROM students WHERE id != 1;

-- 이상
SELECT * FROM students WHERE age>= 20;


-- 초과
SELECT * FROM students WHERE age > 20;

-- 범위(이상-이하)
SELECT * FROM students WHERE age BETWEEN 20 AND 40;

--다중선택
SELECT * FROM students WHERE id=1 or id=3 or id=5;
SELECT * FROM students WHERE id=1 or age=30 or id=5;
SELECT * FROM students WHERE id IN(1,3,5);

--문자열 패턴 찾기 LIKE (%-> 있을 수도 없을 수도 _ -> 개수만큼 있다)
SELECT * FROM students WHERE name LIKE '최%';

SELECT * FROM students WHERE name LIKE '%민%';

--'박'이후 글자 수가 2개인 경우
SELECT * FROM students WHERE name LIKE '박__';
