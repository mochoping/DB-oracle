/*
함수


CONCAT = 여러 문자열을 하나의 문자열로 결합하는 함수
[작성법]
CONCAT(STRING1, STRING2, STRING2,..., STRINGN)
SELECT CONCAT('HELLO',' ','WORLD','!');

SUBSTRING_INDEX = 문자열에서 특정 구분자를 기분으로 일부만 잘라서 가져오는 함수
[작성법]
SubString_index(String, 구분기준, count);
                                 count: + 양수일 때 구분기준으로   왼쪽부터 count 만큼 가져오기
                                 count: - 음수일 때 구분기준으로 오른쪽부터 count 만큼 가져오기

ex) SELECT SUBSTRING_INDEX('USER@EXAMPLE.COM', '@', 1);
                            @ 기준으로 왼쪽 첫번쨰만 가져오기
                            USER 출력
ex) SELECT SUBSTRING_INDEX('USER@EXAMPLE.COM', '@',- 1);
                            @ 기준으로 오른쪽 첫번째만 가져오기
                            EXAMPLE.COM출력

<NULL 연산> : IS NULL / IS NOT NULL;

EXTRACT() : 지정된 년, 월, 일을 택해서 추출

SYSTIMESTAMP : 현재시간

REPLACE
LENGHT

INSTR
SUBSTR

TRIM

TRUNC()   버림
FLOOR()   내림
CEIL()    올림
ROUND()   반올림



AVG(): 평균
MAX()
MIN()
SUM()

        SELECT SUM(*) FROM USER;- 회원 총 인원수
        SELECT SUM(*) FROM PRODUCT WHERE PRODUCT_NAME LIKE (%?%);

COUNT() : 총 합 -> 추후 로그인시 사용될 예정
SELECT COUNT(*) FROM USER WHERE ID =? AND PW =?;
-> ID 와 PW 가 일치하는 회원이 존재하면 COUNT1 존재하지 않으면 COUNT 0

ㅠ