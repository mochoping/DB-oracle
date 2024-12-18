/*계정(사용자)

관리자 계정 : 데이터 베이스의 생성과 관리를 담당하는 계정
             모든 권한과 책임을 가지는 계정
             ex)sys(최고관리자),system(sys에서 권한 몇개 제외된 관리자)
사용자 계정 : 데이터베이스에 대해서 질의 갱신 보고서 작성 등의 
             작업을 수행할 수 있는 계정으로
             업무에 필요한 최소한의 권한만 가지는 것을 원칙으로 함
             ex) newbie(신입)계정, staff, assciate, seniorstaff
                 각 직급에 맞는 권한만 가지는 것
*/

/*
DCL (Data Contril Language)

계정에 DB, DB 객체에 대한 접근 권한을 부여하고 회수하는 언어

- grant : 권한 부여
-revoke : 권한 회수

*권한의 종류
1) 시스템 권한 : db 접속, 객체 생성 권한

CREATE SESSION : 데이터베이스 접속 권한
CREATE TABLE: 테이블 생성 권한
CREATE VIEW: 뷰 생성 권한
CREATE SEQUENCE : 시퀸스 생성 권한
CREATE PROCEDURE : 함수 생성 권한
CREATE USER : 사용자(계정) 생성 권한
DROP USER : 사용자(계정) 삭제 권한
DROP ANY TABLE : 임의 테이블 삭제 권한

2) 객체 권한 : 특정 객체를 조작할 수 있는 권한

권한종류            설정객체
SELECT              TABLE , VIEW , SEQUENCE
INSERT               TABLE , VIEW 
UPDATE                TABLE , VIEW 
DELETE               TABLE , VIEW 
ALTER                TABLE , SEQUENCE
REFERENCES           TABLE
INDEX                TABLE
EXECUTE             PROCEDURE

*/

/* 관리자 계정 접속 후 유저아이디 생성
CREATE USER 유저아이디 IDENTIFIED BY 유저비밀번호;

/* 데이터베이스 생성
CREATE DATABASE 데이터베이스명칭;

/* 데이터베이스 접속 권한
-- 직급에 따른 권한 부여
GRANT ALL PRIVILEGES ON 데이터베이스명칭.테이블명 TO '유저명'@'%';
테이블 명에는 *(모든테이블, 늑정 테이블 명칭)
호스트에는 %
LOCALHOST(DB가 존재하는 컴퓨터)
192.168.0.1 (현재 네트워크 내에 존재하는 컴퓨터

)



-- 계정  OWNER/NEWBIE


GRANT ALL PRIVILEGES ON KHCAFE.MENU TO 'NEWBIE'@'%';

GRANT SELECT PRIVILEGES ON KHUSER.USER TO 'NEWBIE'@'%';

GRANT SELECT ON KHUSER.USER TO 'NEWBIE'@'%';
-- > 신입 , 특정 권한을 부여항 때는 PRIVILEGES 사용 안함


-- > 주니어급 계정 부여
CREATE USER '유저아이디'@'%' IDENTOFIED BY '유저비번';

GRANT SELECT, INSERT, UPDATE ON KHUSER.USER TO 'JUNIR'

---회수하기 

REVOKE INSERT, UPDATE ON KHUSER.USER TO 'JUNIOR'@'%';











*/