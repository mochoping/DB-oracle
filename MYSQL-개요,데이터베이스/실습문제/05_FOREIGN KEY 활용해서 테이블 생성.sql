USE KHTUSER;

SELECT * FROM USER;
SELECT * FROM ADDRESS;
SELECT * FROM USER_ACTIVITY;


-- TABLE USER ADDRESS USER_ACTIVITY 삭제

DROP TABLE USER_ACTIVITY;
DROP TABLE USER;
DROP TABLE ADDRESS;
-- USER 와 ADDRESS 는 서로 부모 자식관계로 아이디로 연결되어 있어, USER 삭제를 위해서는 ADDRESS 삭제가 필요
-- FOREIGN KEY 로 ON DELETE CASCADE를 걸어주지 않았기 때문에, 먼져 삭제가 불가함.
-- USER 와 ADDRESS 는 서로 부모 자식 관계로 ID로 연결되어 있어
-- USER를 삭제하기 위해서 ADDRESS 먼저 삭제를 진행해야함
-- FOREIGN KEY 로 ON DELETE CASCADE를 걸어주지 않기 때문에
-- 현재 시점에서 USER를 사용하면 ADDRESS만 남아있으므로 USER먼저 삭제 불가
-- DROP TABLE user    Error Code: 3730. 
-- Cannot drop table 'user' referenced by a foreign key constraint 
-- 'address_ibfk_1' on table 'address'.    0.000 sec

-- 사용자 테이블
CREATE TABLE USER (
	USER_ID   INT 		  auto_increment primary KEY, -- 기본키 가입시 순차적으로 숫자 증가
    USERNAME  varchar(50)  NOT NULL,
    EMAIL     VARCHAR(100) NOT NULL UNIQUE,
    AGE 	  INT 		   CHECK( AGE >= 18 ), -- CHECK 조건에 따라 NOT NULL 이 이미 포함
    CREATE_AT DATETIME 	   NOT NULL DEFAULT current_timestamp 
    );
    -- DATE 자료형은 연 - 월 -일 만 저장되므로  DEFAULT current_timestamp  사용이 어려움
    -- DATETIME 만 사용가능.

CREATE TABLE ORDER_ITEM (
	ORDER_ID INT auto_increment primary KEY,
    USER_ID  INT NOT NULL,
    PRODUCT_NAME varchar(100) NOT NULL,
    QUANTITY INT CHECK ( QUANTITY > 0 ),
    ORDER_DATE DATETIME NOT NULL default current_timestamp,
    
    foreign key(USER_ID) references USER(USER_ID)
    ON UPDATE cascade
    ON delete cascade
    
    );
    
    SELECT * FROM USER;
    SELECT * FROM ORDER_ITEM;
    
    INSERT INTO USER (username, email, age)
VALUES
('김민수', 'minsu.kim@example.com', 28),
('이영희', 'younghee.lee@example.com', 34),
('박철수', 'chulsoo.park@example.com', 21),
('최지연', 'jiyeon.choi@example.com', 29),
('정다은', 'daeun.jung@example.com', 25),
('한승우', 'seungwoo.han@example.com', 32),
('김서연', 'seoyeon.kim@example.com', 22),
('이준호', 'junho.lee@example.com', 27),
('장민지', 'minji.jang@example.com', 30),
('윤성호', 'seongho.yoon@example.com', 24),
('강유진', 'yujin.kang@example.com', 26),
('조은비', 'eunbi.cho@example.com', 23),
('배현우', 'hyunwoo.bae@example.com', 31),
('신재은', 'jaeeun.shin@example.com', 28),
('홍길동', 'gildong.hong@example.com', 35),
('오지훈', 'jihoon.oh@example.com', 29),
('서미경', 'mikyoung.seo@example.com', 22),
('노수민', 'sumin.no@example.com', 20),
('하윤아', 'yuna.ha@example.com', 26),
('황도영', 'doyoung.hwang@example.com', 33);
COMMIT;
SELECT * FROM USER;

INSERT INTO order_item (USER_ID, PRODUCT_NAME, QUANTITY)
VALUES
(1, '노트북', 1),
(2, '무선 이어폰', 2),
(3, '휴대폰 케이스', 3),
(4, '커피 머신', 1),
(5, '스마트 워치', 1),
(6, '책상', 1),
(7, '게이밍 마우스', 1),
(8, '키보드', 2),
(9, '스탠드 조명', 1),
(10, '운동화', 1),
(11, '휴대폰', 1),
(12, '캠핑 의자', 2),
(13, '캠핑 텐트', 1),
(14, '블루투스 스피커', 1),
(15, '전자책 리더기', 1),
(16, 'HDMI 케이블', 3),
(17, '모니터', 1),
(18, '가습기', 1),
(19, '공기청정기', 1),
(20, '프라이팬 세트', 1);
SELECT * FROM order_item;
COMMIT;

-- USER 테이블에서 CONCAT SUBSTRING_INDEX 함수 이용해서 이메일 모두 @KHT.CO.KR 변경
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
UPDATE USER
SET EMAIL = CONCAT(SUBSTRING_INDEX(EMAIL, '@' , 1), '@KHT.CO.KR');


-- commit 해서 변경사항 저장

-- INNER JOIN 이용해서 
-- USER_ID, USERNAME, EMAIL, AGE, ORDER_ID, PRODUCT_NAME, QUANTITY,ORDER_DATE 출력

SELECT U.USER_ID, U.USERNAME, U.EMAIL, U.AGE, O.ORDER_ID, O.PRODUCT_NAME, O.QUANTITY, O.ORDER_DATE
FROM USER U
JOIN order_item O
ON U.USER_ID = O.USER_ID;

SELECT
U.USERNAME,
O.PRODUCT_NAME,
O.ORDER_DATE
FROM 
	USER U
JOIN 
	order_item O
ON
	U.USER_ID = O.USER_ID;