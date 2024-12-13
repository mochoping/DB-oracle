/*
숫자자료형
TININT          : 아주 작은 정수
SMALLINT        : 작은 정수
MEDIUNINT       : 중간 정수
INT = INTEGER   : 정수
BIGINT          : 큰 정수

실수자료형
FLOAT
DOUBLE
DECIMAL OR NUMBERIC : 고정 소수점 표현
문자자료형

고정길이
CHAR(N)         : 길이를 고정적으로 설정
                  초기에 작성한 길이만큼 공간 설정

가변길이
VARCHAR         : 변수 공간의 길이를 변경가능한 문자열
                  실제 데이터의 길이만큼 저장
                  최대 255자(숫자,영어 기준) 저장가능
TEXT            : 긴 글자를 저장할 때 사용 65,534 자 까지 저장 가능
MEDIUMTEXT      : 최대 16MB
LONGTEXT        : 최대 4GB

기타 자료형
BLOB            : 이미지, 동영상 등과 같은 이진 데이터 저장
ENUM            : 미리 정의된 값을 선택하는데 사용
                  HTML에서 SELECT - OPPTION  RADIO 처럼 지정된 범위에서만 선택 가능
                  EX) ENUM('SMALL', 'MEDIUM', 'LARGE') = 선택한 하나의 값이 DB에 저장
SET             : 어러 값을 가질 수 있는 집합을 정의하는 자료형 (다수 선택 가능)
                  CHECKBOX 처럼 다수 선택하여 DB 저장
                  EX) SET('독서','낚시','쇼핑') = 한번에 저장 가능

CREATE TABLE 테이블명칭(
    USER_ID INT PRIMARY KEY AUTO_INCREMNET,
    GENDER ENUM('female','male')
    HOBBIES SET('reading', 'sports','traveling')
);

날짜자료형
DATE            : 날짜만 저장 (YYYY-MM-DD)
DATETIME        : 날짜와 시간을 함께 저장 (YYYY-MM-DD HH:mm:ss)
TIMESTAMP       : 날짜와 시간을 함께 저장, 값 변경시 자동으로 현재시간으로 갱신
                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP 기본으로 현재시간 저장
TIME            : 시간만 저장 (HH:mm:ss)
YEAR            : 연도만 저장 (YYYY)
*/