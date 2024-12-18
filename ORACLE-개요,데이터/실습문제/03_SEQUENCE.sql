SELECT * FROM CAFE;

-- 1. 시퀸스 생성 = 자동으로 증가하는 고유하는 값을 제공할 수 있도록 함
-- 테이블에서 데이터를 사용할 때 기본키에 회원가입한 순서를 작성
-- 사용법 CREATE SEQUENCE 시퀸스이름       START WITH 1 INCREMENT BY 1;
--        생성하다  시퀸스를               몇번부터 시작할 것인가 증가숫자


CREATE SEQUENCE SEQ_USER; -- START WITH 1 INCREMENT BY 1 이 기본설정

CREATE TABLE STUDENT( -- ORACLE "" , MYSQL '' USER 가 예약어라서 굳이 해당언어로 만들고 싶다면 추가해주어야함
	STDENT_ID NUMBER PRIMARY KEY,
	NAME    VARCHAR2(100),
	AGE		NUMBER
);

-- 2.트리거 생성 = 데이터 삽입 시 시퀸스를 자동으로 사용할 수 있도록 설정
-- 트리거를 이용해서 테이블에 새로운 숫자값이 삽입될 때 시퀸스에 저장된 번호를 호출해서 ID 값을 자동 설정

CREATE OR REPLACE TRIGGER TRG_USER
BEFORE INSERT ON STUDENT
FOR EACH ROW
BEGIN
	-- 시퀸스를 사용해서 STUDENT 테이블 내에 STDENT_ID번호를 자동으로 생성
	:NEW.STDENT_ID = SEQ_USER.NEXTVAL;
END;

-- student 테이블에 학생 정보를 저장하려한다.
-- studentid를 명시하지 않고, 자동으로 증가하는 값으로 학생을 저장하기
-- INSERT INTO 테이블명칭 (studentname, studentage) VALUES ('홍길동', 11);
-- 강철수 12, 박길자 13 오말숙 14 안정미 15 1,2,3,4 번호 순으로 저장

-- SELECT 문 활용해서 저장이 잘 되었는지 확인

SELECT * FROM STUDENT;
INSERT INTO STUDENT (NAME, AGE) VALUES ('홍길동', 11);
INSERT INTO STUDENT (NAME, AGE) VALUES ('강철수', 12);
INSERT INTO STUDENT (NAME, AGE) VALUES ('박길자', 13);
INSERT INTO STUDENT (NAME, AGE) VALUES ('오말숙', 14);
INSERT INTO STUDENT (NAME, AGE) VALUES ('안정미', 15);

SELECT TRIGGER_NAME, STATUS
FROM USER_TRIGGERS
WHERE TRIGGER_NAME = 'TRG_USER';

