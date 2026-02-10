--18-join.sql
select * from customers;
select * from sales;


SELECT customer_name FROM customers WHERE customer_id='C001';

SELECT
	(
	SELECT customer_name FROM customers c
	WHERE c.customers_id=c.coustomer_id
	) AS 고객명,
	*
	-- (SELECT customer_type FROM customers WHERE customer_id='C001')
FROM sales s;

--customer type

SELECT
	(
	SELECT customer_name FROM customers c
	WHERE c.customer_id=c.customer_id
	) AS 고객명,
	(
	SELECT customer_type FROM customers c
	WHERE c.customer_id=c.customer_id
	) AS 고객등급,
	*
	-- (SELECT customer_type FROM customers WHERE customer_id='C001')
FROM sales s;


---왼쪽(C)와 오른쪽(s)를 모두 만족하는 교집합 데이터

SELECT
	*
FROM customers c
INNER JOIN sales s ON c.customer_id=s.customer_id


---LEFT JOIN  왼쪽(c)의 모든 데이터 + (있을 경우) 매칭되는 오른쪽(s) 데이터  

SELECT
	COUNT(*)

	FROM customers c
	LEFT JOIN sales s ON c.customer_id=s.customer_id
	-- WHERE s.id is null; -> 구매한적 없는 사람만 확인


--UNION----------
SELECT
	'1.INNER JOIN' AS 구분,
	COUNT(*) AS 줄수,
COUNT(DISTINCT c.customer_id) AS 고객수
FROM customers c
	INNER JOIN SALES S ON c.customer_id=s.customer_id
	
UNION

SELECT
	'2.LEFT JOIN' AS 구분,
	COUNT(*) AS 줄수,
	COUNT(DISTINCT c.customer_id) AS 고객수
FROM customers c
	LEFT JOIN SALES S ON c.customer_id=s.customer_id
	
