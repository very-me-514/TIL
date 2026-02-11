--11-number-func.sql

SELECT
	name,
	score AS 원점수,
	ROUND(score) AS 반올림,
	CEIL(score) AS 올림,
	floor(score)AS 내림
FROM dt_demo;

-- 사칙연산
SELECT
	10 + 5 AS plus,
	10 - 5 AS minus,
	10 * 5 AS multiply,
	10 / 5 AS divide,
	10 / 3 몫,
	10 % 3 AS 나머지
	POWER(10,3) AS 거듭제곱
	SQRT(16) AS 제곱근
	ABS(-5) AS 절댓값

--IF, CASE

SELECT
	name,
	score,
	--IF(score>=80.0, '우수', '보통')
	CASE
		WHEN SCORE>=90 THEN 'A'
		WHEN SCORE>=80 THEN 'B'
		WHEN SCORE>=70 THEN 'C'
		ELSE 'D'
	END AS 학점
FROM dt_demo;



--dt_demo에서 id가 홀수인지 짝수인지 판별하는 컬럼을 추가하여 확인

SELECT
	id, name,
	CASE
		WHEN id % 2=1 then '홀'
		ELSE '짝'
	END AS 홀짝
FROM dt_demo;

