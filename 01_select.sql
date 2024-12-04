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


SELECT * FROM department;

select*from location;
select*from sal_grade;

/*ctrl + space 나머지 컬럼명, 테이블명등 자동완성기능*/

/*2. SELECT 컬럼명 , 컬럼명, ... FROM 테이블 이름;
조회하고 싶은 컬럼명만 선택해서 조회

SQL 구문은 대문자 작성이 권장. 대소문자 구별은 안함. 
개발자가 조회를 원하는 단어나 기능은 소문자 권장

*/
    
SELECT emp_name FROM employee;

SELECT dept_id, dept_title FROM department;

SELECT * From department;

/*컬럼 값 산술 연산
--컬럼값 : 행과 열이 교차되는 테이블의 한 칸에 작성된 값.
--select 문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과에 연산결과가 반영되어 조회된다.

-- EMPLOYEE 테이블에서 모든 사원의 이름, 급여 , 급여 *12 를 해서 연봉 조회

*/

SELECT emp_id, emp_name, salary *12 FROM employee;

-- 별칭붙이기
-- AS 별명 을 작성해주면 된다.
-- AS : Alias = 별명, 별칭

SELECT emp_id, emp_name, salary *12 as 연봉 FROM employee;



SELECT emp_id as 직원아이디, emp_name as 직원이름, salary as 월급 FROM employee;

/* SYSDATE     SYSTIMESTAMP*/
-- (시스템이 나타내고 있는) 현재 시간

-- SYSDATE           : 현재 시간 (년, 월, 일, 시, 분, 초) 조회
-- SYSTIMESTAMP : 현재 시간 (년, 월, 일, 시, 분, 초) 조회

/*DUAL (DUmmy tAbLe) 가짜 테이블*/

-- 기능이나 단순 데이터 조회를 위해 SQL에서 제공하는 존재하지 않는 가짜 테이블

-- 가짜 테이블을 이용해서 시간 기능 조회하기
SELECT SYSDATE FROM DUAL;             --24/12/04 
SELECT SYSTIMESTAMP FROM DUAL;  -- 24/12/04 14:29:14.109000000 +09:00


SELECT SYSDATE -1, SYSDATE , SYSDATE +1, SYSDATE+2 FROM dual;

-- 문자열을 패턴 형태로 해석해서 DATA 타입으료 변경하는 함수

 SELECT emp_name as 이름, hire_date as 입사일, SYSDATE - hire_date FROM employee;
 
  
/*3. SELECT 특정 기준에 부합한 컬럼을 조회

SELECT 조회할 컬럼명
FROM 테이블명



*******************************
************where**************

-- 테이블에서 조건을 충족하는 행을 조회할 때 사용
-- where 절에는 조건식 (true/false)만 사용

비교연산자 >,<,>=,<=,=,!=,<>(같지않다)
논리연산자 : and, or not

컬럼 존재 여부 : 컬럼명 is Null / 컬럼명 is not null
컬럼값이 존재하지 않는 경우             컬럼값이 존재하는 경우.

-- 컬럼명 in (값 1 , 값 2, 값 3, ....) = 컬럼의 값이 () 안에 작성된 값과 일치하면 true

-- 컬럼명 not in (값 1 , 값 2, 값 3, ....) = 컬럼의 값이 () 안에 작성된 값과 일치하면 false


******LIKE******

비교하려는 값이 특정한 조건을 만족시키면 (TRUE) 조회하는 연산자

[작성법]
WHERE 컬럼면 LIKE '패턴';

'%' (포함하다)

 - %A : A라는 문자로 끝나는 문자열 찾기
 - A% : A라는 문자로 시작하는 문자열 찾기
 - %A% : A라는 문자가 어디에서든지 포함된 문자열 찾기




WHERE 에서 존재 유무 확인 
IS NOT NULL 빈값이 아닌 칸
예시 이름이 비어있는 사원 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME IS NULL

*/

-- 퇴사여부가 Y 인 사원의 이름과 퇴사일 조회
SELECT EMP_NAME, ENT_DATE       -- 무었을 조회
FROM employee                             -- 어디서 조회
WHERE ENT_YN = 'Y';                     -- 어떤조건을 걸것인가

-- 보너스가 있는 사원의 이름과 보너스 금액 조회 WHERE BONUS IS NOT NULL;;
SELECT EMP_NAME, BONUS
FROM employee
WHERE BONUS IS NOT NULL;

-- 급여가 300이상인 사원의 이름과 급여를 조회
-- 급여 >= 3000000

SELECT EMP_NAME, SALARY
FROM employee
WHERE salary >= 3000000 ;

--DEPARTMENT 테이블에서 LOCATION_ID 가 'L1' 지역에 위치한 부서의 모든 정보 조회
SELECT *
FROM department
WHERE LOCATION_ID = 'L1' ;

--EMPLOYEE 테이블에서 이메일 주소가 없는 사원의 이름 조회
SELECT EMP_NAME
FROM employee
WHERE EMAIL IS NULL;

--EMPLOYEE 테이블에서 관리자가 없는 사원의 정보 조회
SELECT *
FROM employee
WHERE MANAGER_ID IS NULL

-- EMPLOYEE 테이블에서 모든사원의 이름, 입사일, 근무일수(현재시간 - 입사일) 조회
SELECT EMP_NAME, HIRE_DATE, (SYSDATE - HIRE_DATE)
FROM EMPLOYEE;

--포멧팅을 활용해서 보기좋게 정리
-- FLOOR 이용해서 정리

-- 로또 번호 생성하기 MATH.FLOOR(MATH.RANDOM());
-- 소숫점 아래 모두 버리기.


SELECT EMP_NAME, HIRE_DATE,
FLOOR (SYSDATE - HIRE_DATE) as 근무일수
FROM EMPLOYEE;
-- FLOOR 는 버림.  반올림의 경우 입사일이 하루 추가되므로, 현재 입사해서 근무한 일자와 어긋날 수 있음.

-- 부서코드가 d6이 아닌 사원의 이름 부서코드 전화번호 조회

SELECT EMP_NAME, dept_code, phone
FROM EMPLOYEE
where dept_code !='d6';

SELECT EMP_NAME, dept_code
FROM EMPLOYEE
where dept_code !='d3'
or      dept_code != 'd1'


/*
WHERE 절에서 특정 값의 기준을 설정할 때 특정 값의 범위나 조건을 설정

AND = 여서조건을 동시에 만족하는 경우로 AND로 작성한 조건이 모두 TRUE 이어야 함
OR    = 하나의 조건만 TURE여도 해당행이 선택

IN()        = 조건의 여러값을 지정할 때 사용 값의 목록 중 하나와 일치하는 행을 선택
                OR의 간결한 표현 방법
NOT IN() = IN 과 반대로 , 조건에서 지전한 목록에 포함되지 않는 값만 선택
                값의 목록과 일치하지 않는 행만 선택
*/

SELECT EMP_NAME, dept_code
FROM EMPLOYEE
where dept_code NOT IN ( 'd1' , 'd3' );

 