--- *** DML( DataManipulation Language)

--- 테이블에 값을 삽입하거나 수정하거나 삭제하는 구문
--- 데이터를 저장하고 수정하고 삭제한 후 반드시 commit 을 작성해야지 저장
--- 저장을 취소하는 방법 rollback 작성

-------주의 : 혼자서 commit , rollback 하지 말 것!


--* INSERT 작성용 테이블을 복제해서 생성
-- CAFE 테이블을 복재해서 EATS 테이블 생성
/*CREATE TABLE CAFE(
    CAFE_ID NUMBER PRIMARY KEY,

)



*/
---1. insert
----테이블에 새로운 행을 추가하는 구문

----1) INSERT INTO 테이블명 VALUES(데이터,데이터,...)
---- 테이블에 모든 컬럼에 대한 값을 INSERT추가할 때 사용

----2) INSERT INTO 테이블명(컬럼명 컬럼명...)
-----                    VLAUES (데이터데이터데이터)
---- 테이블에 내가 선택한 칼럼에 대한 값만 INSERT 할 때 사용
---- 선택안됨 컬럼은 값이 NULL 들어감


-----2. UPDATE
---- 테이블에 기록된 컬럼의 값을 수정하는 구문
----[작성법]
----UPDATE 테이블명 SET ...




-----3. DELETE
---- 테이블에 행을 삭제하는 구문
---- [작성법]
---- DELETE FROM 테이블명 WHERE 조건설정
---- 만약에 WHERE 조건을 설정하지 않으면, 모두 삭제
----- DELETE의 경우 진행하기 전 주위에 한번 더 점검한 후 진행
DELETE FROM 테이블명 ; --- 해당 테이블에 있는 모든 값 삭제

DELETE 
FROM 테이블명
WHERE 컬럼명 = '삭제할데이터' ;

DELETE 
FROM 테이블명
WHERE 컬럼명1 = '컬럼명1 에 해당하는 삭제할데이터' 
AND   컬럼명2 = '컬럼명2 에 해당하는 삭제할데이터';




