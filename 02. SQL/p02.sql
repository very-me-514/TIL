--p02.sql [테이블 수정]

SELECT * FROM userinfo;

--userinfo에 e-mail 컬럼 추가 40글자 제한, 기본값은 ex@gmail.com

SELECT * FROM userinfo;

ALTER TABLE userinfo
ADD COLUMN email VARCHAR(40) NOT NULL DEFAULT 'ex@gmail.com';


--nickmane 길이제한 100자로 늘리기
ALTER TABLE userinfo
ALTER COLUMN nickname TYPE VARCHAR(100);


--reg_date 컬럼 삭제
ALTER TABLE userinfo
DROP COLUMN reg_date ;


-- 실제 아무나 한명의 email을 수정하기

UPDATE userinfo
SET email='abc@abc'
WHERE nickname='alice';

UPDATE userinfo
SET email='abc@abc'
WHERE nickname='abc@abc';