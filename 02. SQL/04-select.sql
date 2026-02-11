--04-select.sql

--컬럼 * -> 컬럼
SELECT * FROM members;

-- 컬럼 지정
SELECT name, email FROM members;

--조건 지정
SELECT * FROM members where id=3;


SELECT * FROM members where age=20;


--컬럼 + 조건 (나이가 20인 사람들의 이름과 나이만 조회)

SELECT name, age FROM members where age>=20;
