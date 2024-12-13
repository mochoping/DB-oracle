/*
Use database; 명칭은
한 회사에서 여러 서비스를 제공하고 각 서비스에 따른 데이터베이스에 접속할때 사용하는 기능

예)
KEKO 회사가 MALON, DEUM, KEKEOTALK 데이터를 관리할 때
MYSQL 회사 SQL 을 이용해서 관리하고, 각 데이터 베이스에 유저가 접근하기 위해서는
1. 유저 아이디, 비밀번호로 접속
2. DEUM 데이터베이스에 접소해서 회원정보나 게시글 관리테이블 확인하길 원한다면
	USE DEUM;
	SELECT * FROM DEUM회원정보테이블;

	MALON 데이터베이스에 접속해서 조회를 원한다면
	USE MALON;
	SELECT * FROM MALON테이블;
*/


CREATE TABLE USER (
    cafe_id INT PRIMARY KEY auto_increment,        -- USER 가입 순서 고유 ID
    cafe_name VARCHAR(100) NOT NULL,  -- USER 이름
    location VARCHAR(255),            -- USER 위치
    contact_number VARCHAR(20)        -- USER 연락처
);

select * from user;

insert into user(cafe_name, location, contact_number)
 values('홍길동', '서울시 강남구','010-1234-5678');
 
alter table user change cafe_name user_name varchar(100) not null;
alter table user change cafe_id user_id int;
alter table user drop primary key;

-- 유저 둘을 동시에 생성.
INSERT INTO USER(user_name, location, contact_number)
	values('고말숙', '서울시 영등포구','010-2345-6789'),
          ('김철수', '서울시 송파구', '010-9876-5432');
          
          commit;
select * from user;

-- 이순신 서울시 종로구 010-4567-8901
-- 최지훈 서울시 서초구 010-5677-9811
-- 정수민 서울시 강동구 010-6781-2345
-- 김태호 경기도 수원시 010-2222-3333
-- 이광수 인천시 남동구 010-4444-5555

insert into user(user_name, location, contact_number)
values			('이순신' ,'서울시 종로구' ,'010-4567-8901'),
				('최지훈' ,'서울시 서초구' ,'010-5677-9811'),
				('정수민' ,'서울시 강동구' ,'010-6781-2345'),
				('김태호' ,'경기도 수원시' ,'010-2222-3333'),
				('이광수', '인천시 남동구', '010-4444-5555');
-- 서울에 거주하는 사람 조회
select *
from user
where location like '%서울%';
-- 중간번호 4라는 숫자가 들어간 유저 조회
select *
from user
where contact_number like '%4%';
-- 서울에 거주하지 않는 사람 조회 
select *
from user
where location not like '%서울%';

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
INSERT INTO USERPROFILE (USERNAME, EMAIL, BIRTHDATE, ACCOUNT_BALANCE, GENDER, HOBBIES)
VALUES
    ('홍길동', 'hong1@example.com', '1990-01-01', 10000.50, 'MALE', 'READING'),
    ('김영희', 'kim1@example.com', '1995-02-15', 5000.00, 'FEMALE', 'SPORTS'),
    ('이철수', 'lee1@example.com', '1987-03-10', 2000.75, 'MALE', 'RUNNING'),
    ('박민수', 'park1@example.com', '1993-05-20', 7000.25, 'MALE', 'READING,SPORTS'),
    ('최수영', 'choi1@example.com', '1998-07-30', 8000.00, 'FEMALE', 'RUNNING'),
    ('정하나', 'jung1@example.com', '1990-09-10', 3000.40, 'FEMALE', 'READING'),
    ('한상민', 'han1@example.com', '1985-04-25', 6000.30, 'MALE', 'SPORTS,RUNNING'),
    ('안세정', 'oh1@example.com', '1992-12-12', 9000.00, 'MALE', 'READING'),
    ('윤미래', 'yoon1@example.com', '1988-08-08', 4000.00, 'FEMALE', 'SPORTS'),
    ('장동건', 'jang1@example.com', '1991-11-11', 7500.50, 'MALE', 'RUNNING'),
    ('고은아', 'ko1@example.com', '1996-06-06', 3000.00, 'FEMALE', 'READING,SPORTS'),
    ('황보영', 'hwang1@example.com', '1994-03-03', 8500.75, 'FEMALE', 'RUNNING'),
    ('임채연', 'lim1@example.com', '1997-05-15', 2000.25, 'FEMALE', 'READING'),
    ('백승호', 'baek1@example.com', '1989-10-10', 6000.00, 'MALE', 'SPORTS'),
    ('송지효', 'song1@example.com', '1993-02-02', 9500.50, 'FEMALE', 'READING,RUNNING'),
    ('조세호', 'cho1@example.com', '1995-07-07', 1500.75, 'MALE', 'SPORTS'),
    ('이광수', 'lee2@example.com', '1991-09-09', 8000.00, 'MALE', 'RUNNING'),
    ('김나영', 'kim2@example.com', '1986-12-01', 7000.25, 'FEMALE', 'READING'),
    ('박지성', 'park2@example.com', '1988-01-01', 5000.75, 'MALE', 'SPORTS,RUNNING'),
    ('유재석', 'yoo1@example.com', '1987-05-05', 10000.00, 'MALE', 'READING,SPORTS');

-- 테이블 삭제 DROP TABLE
-- 주의점 함부로 하지 말것!, 반드시 상의후 삭제할 것!
-- 테이블 내 데이터 삭제 DELETE FROM 테이블명 WHERE = 
-- 1051 에러코듣 -> 테이블이 존재하지 않아 삭제 불가
SELECT * FROM USERPROFILE;


COMMIT;
