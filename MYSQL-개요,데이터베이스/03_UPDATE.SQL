/*
DML(DATA MANIPULATION LANGUAGE): 데이터 조작 언어

-- 주의 : 혼자서 COMMIT, ROLLBACK 하지 말것!

UPDATE

테이블에 기록된 컬럼의 값을 수정하는 구문

[작성법]
UPDATE 테이블명 SET 컬럼명 = 바꿀값 [WHERE 컬럼명 비교연산자 비교값];

-- 주의할 점
ERROR CODE : 1265. DATA TRUNCATED FOR COLUMN '컬럼명' AT ROW

1.VARCHAR(25) 최대  25자 작성 가능한 컬럼에 25자를 초과하여 대이터를 작성하려 했을 경우

2. 자료형 ENUM 이나 자료형 SET 과 같이 컬럼에 들어갈 수 있는 데이터가 정해져있고, 정해진 데이터의 범위를 벗어났을 때 발생하는 에러

해결방법 ) ALTER를 이용해서 컬럼명에 들어갈 수 있는 데이터로 변경
ERROR CODE 1175 . YOU ARE USING SAFE DUPATE MODE AND TRIED TO UPDATE TABLE WITHOUT A WHERE THAT USES A KEY COLUMN

TO DISABLE SAFE MODE, TOGGLE THE OPTION IN PREFERENCES -> SQL EDITOR AND RECONNECT


SET SQL_SAFE_UPDATES = 0; OFF
SET SQL_SAFE_UPDATES = 1; ON



*/
