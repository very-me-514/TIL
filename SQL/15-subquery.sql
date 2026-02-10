
--15-subquery.sql
-- 매출평균보다 더 높은 금액을 주무난 판매 데이터(*)ABORT
-- subquery - 쿼리 안의 쿼리

--평균을 구해서
SELECT AVG(total_amount) FROM sales;
-- 그 값으로 WHERE
SELECT * FROM sales WHERE total_amount>=612862
;


-- 특정값을 매번 계산해서 알아서 가져옴
SELECT * FROM sales 
WHERE total_amount>=(SELECT AVG(total_amount) FROM sales);


SELECT
	product_name AS 이름,
	total_amount AS 판매액,
	total_amount - (SELECT AVG(total_amount) FROM sales) AS 평균차이
FROM sales

WHERE total_amount>=(SELECT AVG(total_amount) FROM sales);

-- sales 에서 가장 비싼 total_amount를 가진 데이터

SELECT * FROM sales
WHERE total_amount=(SELECT MAX(total_amount) FROM sales;);

--[주문금액평균]과 실제 주문액수의 차이가 가장 적은 5개 데이터

SELECT 
	id
	customer_id,
	total_amount,
	ABS(total_amount-(SELECT AVG(total_amount) FROM sales)) AS 차이
FROM sales
ORDER BY 차이
LIMIT 5;

