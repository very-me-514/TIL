--19-m-to-n.sql

-- 각 학생별 수강 수업 확인

SELECT
	*
FROM students s

INNER JOIN students_courses sc ON s.id=sc.student_id
INNER JOIN courses c ON sc.course_id=c.id


--교수 입장

SELECT
	*
FROM courses c

INNER JOIN students_courses sc ON c.id=sc.course_id
INNER JOIN students s ON sc.student_id=s.id
ORDER BY c.name;


-----학생 정렬/ 수업명 까지 --------

SELECT
	s.id,
	s.name,
	COUNT(c.id) AS 수업수,
	STRING_AGG(c.name,',')
FROM students s

INNER JOIN students_courses sc ON s.id=sc.student_id
INNER JOIN courses c ON sc.course_id=c.id
GROUP BY s.id, s.name;

-- 과목별 정리
-- 수업ID, 수업명, 강의실, 수강인원, 학생들 이름 한번에, 학점 평균(A+ 4.3, A=4, A- 3.7, B+=3.3, B=3.0, B-=2.7)

SELECT
	c.id,
	c.name,
	c.classroom,
	COUNT(*) AS 수강인원,
	STRING_AGG(s.name,'	'),
	ROUND(AVG(CASE
		WHEN sc.grade ='A+' Then 4.3
		WHEN sc.grade ='A' Then 4.0
		WHEN sc.grade ='A-' Then 3.7
		WHEN sc.grade ='B+' Then 3.3
		WHEN sc.grade ='B' Then 3.0
		WHEN sc.grade ='B-' Then 2.7
		ELSE 0
		END), 2) AS 평균학점
FROM courses c

INNER JOIN students_courses sc ON c.id=sc.course_id

INNER JOIN students s ON sc.student_id=s.id

GROUP BY c.id, c.name, c.classroom;


