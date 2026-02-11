--20-cross-join.sql

SELECT * FROM students;
SELECT * FROM courses;

--카르테시안 곱 (모든 가능한 조합. 거기서 존재하지 않는 걸 빼면 남는 것....넷플릭스 안 본 것 추천 가능)- 

SELECT
    s.name,
    c.name
FROM students s
CROSS JOIN courses c
WHERE NOT EXISTS (
    SELECT 1
    FROM students_courses sc
    WHERE sc.student_id=s.id
    AND sc.course_id=c.id
);



SELECT a.animal_id, a.name
from animal_ins a
join animal_outs b on a.animal_id=b.animal_id
where timediff(a.datetime,b.datetime)>0
order by a.datetime asc;