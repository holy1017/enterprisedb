
-- 3ro 테이블 아우터
SELECT A.y, B.y, C.y
FROM
A
FULL OUTER JOIN B ON B.x = A.x
FULL OUTER JOIN C ON C.x = A.x OR C.x = B.x





CREATE TABLE test
(
    a bigint,
    b bigint,
    c bigint
);

TRUNCATE test;

INSERT INTO holy.test(a, b, c)
	VALUES 
	(1, 1, 1 ),
	(2, 1, 2 ),
	(3, 1, 3 ),
	(1, 2, 4 ),
	(2, 2, 5 ),
	(1, 3, 6 ),
	(3, 3, 7 ),
	(2, 4, 8 ),
	(3, 4, 9 ),
	(1, 5, 10),
	(2, 6, 11),
	(3, 7, 12);
  
SELECT A.*, B.*, C.*
FROM test a
FULL OUTER JOIN test B ON b.a=2 and B.b = A.b
FULL OUTER JOIN test C ON c.a=3 and (C.b = A.b OR C.b = B.b )
where a.a=1
;

SELECT A.*, B.*, C.*
FROM test a
LEFT OUTER JOIN test B ON b.a=2 and B.b = A.b
LEFT OUTER JOIN test C ON c.a=3 and (C.b = A.b OR C.b = B.b )
--where a.a=1
;
