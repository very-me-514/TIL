--03-insert.sql

INSERT INTO members (name, email, age)
VALUES ('김김김', 'my@email', '30');
VALUES ( '김광주', 'marble514@naver.com', '2026-01-12');


INSERT INTO members (email) VALUES ('a@a.com');
INSERT INTO members (name) VALUES ('박박박');

INSERT INTO members (name, email)
VALUES
('이이', 'b@bmail'), 
('최최', 'c@cmail'), 
('서서', 'd@dmail');
SELECT * FROM members;

INSERT INTO members (id,name, join_date)
VALUES ( '김광주',  '2026-01-12');

INSERT INTO members (id,name)
VALUES ( '김수영'),( '고은선');

INSERT INTO members (name, email, age, join_date)
VALUES
( '이이이', 'my@dmail', '30', '2026-01-12'),
( '김주주', 'my@email.om', '30', '2026-01-12');
