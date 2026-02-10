--05-update.sql

--데이터 추가 (name='익명')

INSERT INTO memebers (name) VALUES('익명');
SELECT * FROM members;

--데이터 수정
UPDATE members
SET name='홍길동'
WHERE name='익명';

--마지막 사람의 mail(hong@il)과 나이(25) 수정

UPDATE members
SET email='hong@gil', age=25
WHERE ID='latest';