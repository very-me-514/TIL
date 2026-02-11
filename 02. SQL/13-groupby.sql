--13-groupby.sql

SELECT * FROM sales;

SELECT
	region,
	category,
	COUNT(id)
FROM sales
GROUP BY region, category
ORDER BY region, category;

--Groupby

SELECT
	region,
	category, sales_rep,
	COUNT(id) AS 매출건수,
	ROUND(AVG(total_amount), 2) AS 평균매출
FROM sales
GROUP BY region, category, sales_rep
ORDER BY region, category, sales_rep;


--매출 상위 3개

SELECT
	region,
	category,
	COUNT(id) AS 매출건수,
	ROUND(AVG(total_amount), 2) AS 평균매출
FROM sales
GROUP BY region, category
ORDER BY 평균매출 DESC 
LIMIT 3;


-- 카테고리별 분석
-- 카테고리, 주문건수, 총 매출, 평균 매출 -> 총매출 내림차순

SELECT
	category AS 카테고리,
	COUNT(id) AS 주문건수,
	SUM(total_amount) AS 총매출,
	ROUND(AVG(total_amount), 2) AS 평균매출
FROM sales
GROUP BY 카테고리
ORDER BY 총매출 DESC;

--지역별 매출 분석
-- 지역, 주문건수, 총매출, [고객수, 고객당평균주문수, 고객당평균매출]

SELECT
	region AS 지역,
	COUNT(id) AS 주문건수,
	SUM(total_amount) AS 총매출,
	COUNT(DISTINCT customer_id) AS 고객수,
	----실수 나누기 실수....소수점을 확인하려면 하나만 실수로 바꿔도 됨. 그게 FOLOAT
	ROUND(COUNT(*)::DECIMAL /COUNT(DISTINCT customer_id),2) AS 고객당평균주문수,
	SUM(total_amount)::DECIMAL /COUNT(DISTINCT customer_id) AS 고객당평균매출
FROM sales
GROUP BY region;
ORDER BY 고객당평균매출 DESC;


--영업사원-지역별 성과-
--영업사원, 지역, 주문건수, 총매출액, [월별]

SELECT
	sales_rep AS 영업사원,
	region AS 지역,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 총매출,
	
FROM sales

GROUP BY 영업사원, 지역;


-- 영업사원별, 월별 매출
-- 월, 사원, 주문건수, 월매출액, 평균매출액
-- 월, 월매출액 순으로 정렬

SELECT
	TO_CHAR(order_date, 'YYYY-MM')AS 월,
	SUM(total_amount) AS 월매출액,
	sales_rep,
	COUNT(*) AS 주문건수,
	AVG(total_amount) AS 평균매출액
FROM sales
GROUP BY 
	sales_rep,
	TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 
	월, 월매출액 DESC;
	
	
-- MAU(monthly Active user) -> 월간 활성고객
-- 월, 주문건수, 월매출액, MAU

SELECT
	TO_CHAR(order_date, 'YYYY-MM')AS 월,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 월매출액,
	COUNT(DISTINCT customer_id) AS MAU
FROM
	sales
	
GROUP BY
	TO_CHAR(order_date, 'YYYY-MM');

ORDER BY
	월;
	
	-- 요일별 매출패턴 (날자-> 요일 함수?)
	-- 요일, 주문건수, 총매출, 평균매출

SELECT
	TO_CHAR(order_date, 'DAY') AS 요일,
	--EXTRCAT(DOW FROM order_date) AS 요일번호,
	COUNT(*) AS 주문건수,
	SUM(total_amount) AS 총매출,
	round(AVG(total_amount), 2)
FROM
	sales
GROUP BY
	요일
ORDER BY 총매출 DESC;