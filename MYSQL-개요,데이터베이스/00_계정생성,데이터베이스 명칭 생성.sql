/*
초기에 mysql 설치할 때 비밀번호 작성

-- 회사 내에서 table 과 query 저장을 위한 데이터 베이스 명칭 설정
create database 데이터베이스명칭;

-- 데이터베이스에 접속할 수 있는 유저 생성
create user '유저아이디'@'%' identified by '비밀번호';
'%'     = 자바에서의 public 같은 개념. 외부에서 자유롭게 접근 가능
'localhost' = 자바에서 private 같은 개념으로 현재 사용하는 컴퓨터에서만 접근 하근ㅇ

grant all privileges on KHTDB.* to 'kht'@'%'; 
flush privileges; // 특권 적용시키기.


데이터베이스.* = db 내에 있는 모든 테이블 접근 허용.
*/
-- 주의할점 : 데이터베이스 명칭, 유저명, 유져 비밀번호는 대소문자특수문자띄어쓰기 모두 구분!
 CREATE DATABASE KHTDB;
 CREATE USER 'KHT'@'%' IDENTIFIED BY 'KHT1234';
 GRANT ALL PRIVILEGES ON KHTDB.* TO 'KHT'@'%';
 FLUSH PRIVILEGES;
