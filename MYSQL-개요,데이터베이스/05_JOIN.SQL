/*
DML(DATA MANIPULATION LANGUAGE): 데이터 조작 언어

-- 주의 : 혼자서 COMMIT, ROLLBACK 하지 말것!


join 

두개 이상의 테이블에서 데이터를 결합할 때 사용하는 sql 명령어

INNER JOIN 
        두 테이블에 공통된 값이 있는 행만 조회

LEFT JOIN (LEFT OUTER JOIN)
        왼쪽(첫 번째) 테이블의 모든 행을 가져오고,
        오른쪽 테이블의 값이 없으면 NULL로 채움

RIGHT JOIN (RIGHT OUTER JOIN)
        오른쪽 (두번째) 테이블의 모든 행을 가져오고
        왼쪽 테이블의 값이 없으면 NULL채움

