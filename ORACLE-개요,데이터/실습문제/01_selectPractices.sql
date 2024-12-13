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




/*
WHERE 절에서 특정 값의 기준을 설정할 때 특정 값의 범위나 조건을 설정

AND = 여서조건을 동시에 만족하는 경우로 AND로 작성한 조건이 모두 TRUE 이어야 함
OR    = 하나의 조건만 TURE여도 해당행이 선택

IN()        = 조건의 여러값을 지정할 때 사용 값의 목록 중 하나와 일치하는 행을 선택
                OR의 간결한 표현 방법
NOT IN() = IN 과 반대로 , 조건에서 지전한 목록에 포함되지 않는 값만 선택
                값의 목록과 일치하지 않는 행만 선택
*/

-- d5 부서에 속한 사원의 사원번호 사원이름 부서코드 조회

SELECT EMP_NO, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';



-- 입사일이 2000년 이후인 직원들의 정보를 조회

SELECT *
FROM employee
WHERE hire_date >= TO_DATE('2000-01-01', 'YYYY-MM-DD');

-- 퇴직 여부가 Y이고 퇴사일이 2015년 이후인 직원들의 정보를 조회

SELECT *
FROM employee
WHERE ENT_DATE >= TO_DATE('2015-01-01', 'YYYY-MM-DD')
AND ENT_YN = 'Y';

--EMPLOYEE 테이블에서 성씨가 전씨인 사원의 이름 조회

SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';

--EMPLOYEE 테이블에서 이름이 수로 끝나는 사원 이름 조회

SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%수';

--------------------------------------------------------------------------------------------실습문제

-- 1. EMPLOYEE 테이블에서 모든 데이터를 조회하세요.
SELECT *
FROM employee;
-- 2. DEPARTMENT 테이블에서 DEPT_TITLE과 LOCATION_ID를 조회하세요.
SELECT DEPT_TITLE, LOCATION_ID
FROM DEPARTMENT;
-- 3. EMPLOYEE 테이블에서 SALARY가 3,000,000 이상인 직원들의 EMP_NAME과 SALARY를 조회하세요.
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;
-- 4. DEPARTMENT 테이블에서 LOCATION_ID가 'L1'인 부서를 조회하세요.
SELECT *
FROM DEPARTMENT
WHERE LOCATION_ID ='L1';
-- 5. EMPLOYEE 테이블에서 BONUS가 NULL인 직원들의 정보를 조회하세요.
SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL;
-- 6. EMPLOYEE 테이블에서 SALARY가 2,500,000 이상이고 BONUS가 0.2 이상인 직원의 EMP_NAME을 조회하세요.
SELECT EMP_NAME
FROM employee
WHERE SALARY >= 2500000
AND BONUS >= 0.2;
-- 7. EMPLOYEE 테이블에서 JOB_CODE가 'J6'이거나 'J7'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE JOB_CODE IN ('J6', 'J7');
-- 8. DEPARTMENT 테이블에서 DEPT_TITLE에 '영업'이라는 단어가 포함된 부서를 조회하세요.
SELECT *
FROM department
WHERE dept_title LIKE '%영업%';
-- 9. EMPLOYEE 테이블에서 입사일(HIRE_DATE)이 2000년 이후인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE HIRE_DATE >= TO_DATE('2000-01-01', 'YYYY-MM-DD');
-- 10. EMPLOYEE 테이블에서 퇴직 여부가 'Y'이고 퇴사일이 2015년 이후인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE ENT_YN = 'Y' 
AND ENT_DATE = TO_DATE('2015-01-01', 'YYYY-MM-DD');
-- 11. EMPLOYEE 테이블에서 EMP_NAME의 첫 글자가 '김'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '김%';
-- 12. EMPLOYEE 테이블에서 JOB_CODE가 'J1', 'J2', 'J3'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE job_code IN ('J1', 'J2', 'J3');
-- 13. EMPLOYEE 테이블에서 특정 DEPT_CODE('D1', 'D5', 'D9')를 제외한 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE dept_code NOT IN ('D1', 'D5', 'D9');
-- 14. EMPLOYEE 테이블에서 MANAGER_ID가 NULL인 직원들의 EMP_NAME과 DEPT_CODE를 조회하세요.
SELECT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE manager_id IS NULL;
-- 15. EMPLOYEE 테이블에서 EMP_NAME에 '김'이 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '%김%';
-- 16. EMPLOYEE 테이블에서 EMAIL 주소에 'gmail'이 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMAIL LIKE '%gmail%';
-- 17. EMPLOYEE 테이블에서 PHONE 번호가 '010'으로 시작하는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE PHONE LIKE '010%';
-- 18. EMPLOYEE 테이블에서 PHONE 번호가 '1234'로 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE PHONE LIKE '%1234';
-- 19. DEPARTMENT 테이블에서 DEPT_TITLE이 '영업'으로 끝나는 부서를 조회하세요.
SELECT *
FROM department
WHERE dept_title LIKE '%영업';
-- 20. DEPARTMENT 테이블에서 DEPT_TITLE에 '관리'라는 단어가 포함된 부서를 조회하세요.
SELECT *
FROM department
WHERE dept_title LIKE '%관리%';
-- 21. EMPLOYEE 테이블에서 EMP_NAME이 '이'로 시작하는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '이%';
-- 22. EMPLOYEE 테이블에서 JOB_CODE가 'J'로 시작하고 두 번째 문자가 '1'인 직원을 조회하세요.
SELECT *
FROM employee
WHERE JOB_CODE LIKE 'J%'
AND JOB_CODE LIKE '%1%';
-- 23. EMPLOYEE 테이블에서 EMAIL이 'com'으로 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMAIL LIKE '%com';
-- 24. EMPLOYEE 테이블에서 HIRE_DATE의 연도가 2021년인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE HIRE_DATE >= TO_DATE('2021-01-01','YYYY-MM-DD')
AND HIRE_DATE < TO_DATE('2022-01-01', 'YYYY-MM-DD');
-- 25. EMPLOYEE 테이블에서 EMP_NAME의 마지막 글자가 '호'인 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '%호';
-- 26. EMPLOYEE 테이블에서 EMAIL에 'company'라는 단어가 포함된 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMAIL LIKE '%COMPANY%';
-- 27. EMPLOYEE 테이블에서 EMP_NAME에 '수'로 시작하거나 끝나는 직원들의 정보를 조회하세요.
SELECT *
FROM employee
WHERE EMP_NAME LIKE '수%'
OR EMP_NAME LIKE '%수';
