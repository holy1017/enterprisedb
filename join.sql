
-- 3ro 테이블 아우터
SELECT A.y, B.y, C.y
FROM
A
FULL OUTER JOIN B ON B.x = A.x
FULL OUTER JOIN C ON C.x = A.x OR C.x = B.x







