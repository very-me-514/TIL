--16-subquery2

/*

scala -> 데이터 1개 | 14.56
vector -> 데이터 1줄 | (1, 2, 3, 4)
Matrix/Tensor -> 행*열
*/

-- SCALAR
SELECT AVG(total_amount) FROM sales;

-- Vector
SELECT DISTINCT region FROM sales;

--식품 결제 내역 고르기
SELECT * id FROM sales
WHERE category='식품';

--VIP들의 주문내역만 확인
SELECT * FROM customers WHERE customer_type='VIP';

SELECT * 
FROM sales 
WHERE customer_id 
IN (SELECT customer_id FROM customers WHERE customer_type='VIP');

-- [전자제품을 구매한 고객들의 customer_id]의 모든 주문
SELECT DISTINCT Icustomer_id
SELECT * 
FROM sales
WHERE customer_id IN (SELECT DISTINCT customer_id FROM sales where category='전자제품');

