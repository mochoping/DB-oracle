/*
SELECT 컬럼명 AR 별칭, 컬럼명 ,컬럼명
FROM 테이블명
WHERE 조건식
GROUP BY 그룹을 묶을 컬럼명
HAVING 그룹함수식 비교연산자 비교값
ORDER BY 컬럼명 | 별칭 | 컬럼숨서 [오름/ 내림차순][NULLS FIRST | LAST]

GROUP BY : 같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을 하나의 그룹으로 묶는것

GROUP BY 컬럼명 | 함수식, .....;

-- 여러개의 값을 묶어서 하나로 처리할 목적으로 사용
-- 그룹으로 묶은 값에 대해서 SELECT 절에서 그룹함수를 사용함

-- 그룹 함수는 단 하나의 결과값만 산출하기 때문에 그룹이 여러개일 경우 오류 발생
-- 여러개의 결과 값을 산출하기 위해 그룹 함수가 적용된 그룸의 기준을 ORDER BY 절에서 기술하여 사용

HAVING 절 그룹함수로 구해올 그룹에 대한 조건을 설정할 때 사용
--- 그룹에 대한 조건, 어떤 그룹만 조회하겠다.

HAVING 컬럼명 | 함수


*/