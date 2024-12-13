-- userprofile 테이블 생성 user_id 기본키 자동증가
-- username 문자열 빈값 못들어가게 50 바이트
-- email 문자열 빈값 못들어가게 100 바이트 
-- birthdate date
-- account_balance decimal(10,2) 정수 10자 , 소수 2자.
-- gender enum('male', 'female')
-- hobbies set ('reading', 'sports', 'running')

create TABLE USERPROFILE (
USER_ID INT primary KEY auto_increment,-- user_id 기본키 자동증가
USERNAME CHAR(50) NOT NULL, -- username 문자열 빈값 못들어가게 50 바이트
EMAIL CHAR(100) NOT NULL, -- email 문자열 빈값 못들어가게 100 바이트 
BIRTHDATE DATE,
ACCOUNT_BALANCE DECIMAL(10,2),
GENDER ENUM('MALE','FEMALE'),
HOBBIES SET('READING', 'SPORTS','RUNNING')
);