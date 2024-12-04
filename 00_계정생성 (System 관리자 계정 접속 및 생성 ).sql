/*범위 주석 ctrl+shift+/ */
-- 한줄 주석 ctrl + /
/*SQL 1개 실행 ctrl + enter
        2개 이상 실행 (블럭 드래그 후 ) alt x
*/


/*select (조회) 
    - 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 sql
    - 작성된 구문에 맞는 행, 열 데이터가 조회됨
    -> 조회된 결과 행의 집합 == result set(결과집합)
    
    -> 결과는 0 행이상이 포함될 수 있다.
    -> 조건에 맞는 행이 없을 수 있기 때문
    
    asterisk(*) 모든, 포함하다를 나타내는 기호(ALL)
*/

/* select 작성하는 방법
1. select           *             from                테이블 이름;
조회하다 모든내용을 어디서 조회할 것인가?  조회할테이블 이름



*/
/* 범위 주석 ctrl + shift + / */
-- 한 줄 주석 ctrl + /
/* 
SQL 1개 실행 : CTRL + ENTER 
SQL 2개 이상 실행 : (블럭 드래그 후) ALT + X
CTRL + SPACE 나머지(컬럼명, 테이블명 등) 자동완성

SELECT FROM과 같은 SQL 구문은 대문자로 작성하는 것이 개발자들간의 구분 규칙
컬럼명이나 테이블명 과 같이 개발자가 조회를 원하는 단어나 기능은 소문자로 작성해주는 것이 좋음!!
*/

/* SELECT (조회) 
    - 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL
    - 작성된 구문에 맞는 행, 열 데이터가 조회됨
     -> 조회된 결과 행의 집합 == RESULt SET(결과 집합)
    
    - 결과는 0 행 이상이 포함될 수 있다
     -> 왜냐하면 조건에 맞는 행이 없을 수 있기 때문
*/

/* SELECT 작성하는 방법
1. SELECT       *            FROM              테이블이름;
   조회하다  모든내용을   어디서조회할 것인가?   조회할테이블이름;
*/
SELECT * FROM department; --department 라는 테이블에 있는 모든 내용 조회하기

--QUIZ 1   LOCATION 테이블 모두 조회하기
select * FoRm location;

--QUIZ 2   JOB 테이블 모두 조회하기
select * from job;

--QUIZ 3   NATIONAL 테이블 모두 조회하기
select * from national;

--QUIZ 4   SAL_GRADE 테이블 모두 조회하기
select * from sal_grade;

/*
2. SELECT 컬럼명, 컬럼명, ... FROM 테이블이름;
테이블 내부에 있는 모든 컬럼을 조회하는 것이 아니라 조회하고 싶은 컬럼명만 선택해서 조회

*/

-- EMPLOYEE 테이블에서 사번(EMP_ID) 이름(EMP_NAME) 급여(SALARY) 조회
SELECT emp_id, emp_name, salary from employee;

-- EMPLOYEE 테이블에서 이름(emp_name) 조회