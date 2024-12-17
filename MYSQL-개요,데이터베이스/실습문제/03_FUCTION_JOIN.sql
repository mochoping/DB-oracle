-- 함수 이용한 select 작성

-- 붙여서 출력
-- 'Mysql' '' 'is' 'Awesome!'
select concat('Mysql', ' ', 'is', 'Awesome!');

-- hello.world.program 에서 hello.world 만 출력
select substring_index('hello.world.program', '.program',  1);

-- 전화번호에 5678 들어가는 user 수 확인
select count(*) from user where phone like '%5678%';
-- product
-- concat 제품명 : 울트라 게이밍 키보드, 가격 89000원 으로 출력
use khtshopping;
select * from product;
select concat('제품명 : ',name,  ' 가격 : ' ,price ,'원')
from product
where product_id = 3; 

-- review 테이블에서 제품아이디 3번 댓글 길이
select * from review;
select length(comment)
from review
where product_id = 3; 

select replace(comment , '좋고','훌륭하고')
from review
where product_id = 4; 

-- replace 사용방식은 많은 언어에서 거의 동일

SELECT O.ORDER_ID, O.USER_ID, O.STATUS, O.TOTAL_AMOUNT, OI.PRODUCT_ID, OI.QUANTITY, OI.PRICE , P.NAME
FROM `ORDER` O
JOIN ORDER_ITEM OI
ON O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCT P
ON P.PRODUCT_ID = OI.PRODUCT_ID;

-- LEFT JOIN 사용 ORDER REVIER 테이블 연결해서 모든 주문이 포함되도록 하괴,
-- REVIEW 가 없는 주문은 NULL로 표시되게 처리

SELECT O.ORDER_ID, O.USER_ID, O.STATUS, R.PRODUCT_ID, R.RATING, R.COMMENT
FROM `ORDER` O
LEFT JOIN REVIEW R
ON O.USER_ID = R.USER_ID; -- 모든 제품에 리뷰가 존재하기 때문에 NULL값이 생길일이 없음

-- REVIEW 테이블과 ORDER 테이블을 RIGHTJOIN 으로 연결해서 모든 리뷰가 포함되도록 하고, 
-- 주문 정보가 없는 경우는 NULL 표기되게 하기
select R.PRODUCT_ID, R.USER_ID , R.RATING, R.COMMENT, O.ORDER_ID, O.STATUS
FROM REVIEW R
RIGHT JOIN `ORDER` O
ON R.USER_ID = O.USER_ID;

USE KHTCAFE;

CREATE TABLE SNACK (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2),
    STOCK INT
);

INSERT INTO SNACK (ID, NAME, CATEGORY, PRICE, STOCK) VALUES
(1, '초코칩 쿠키', '과자', 1500.00, 50),
(2, '양파링', '스낵', 2000.00, 30),
(3, '포테이토칩', '스낵', 2500.00, NULL),
(4, '치즈볼', '과자', 1800.00, 40),
(5, NULL, '스낵', 3000.00, 20);

CREATE TABLE SNACK_ORDER (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    SNACK_ID INT,
    QUANTITY INT,
    ORDER_DATE DATETIME,
    STATUS VARCHAR(20)
);

INSERT INTO SNACK_ORDER (ID, SNACK_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1, 1, 3, '2024-12-16 10:35:00', '배송 중'),
(2, 2, 2, '2024-12-16 11:00:00', '대기'),
(3, NULL, 1, '2024-12-16 12:00:00', '취소'),
(4, 3, NULL, '2024-12-16 13:00:00', '배송 완료'),
(5, 5, 5, '2024-12-16 14:00:00', NULL);


select * FROM SNACK_ORDER;

-- INNER JOIN
SELECT S.SNACK_ID, S.NAME, S.CATEGORY, S.PRICE, S.STOCK
FROM SNACK S
INNER JOIN SNACK_ORDER O
ON S.ID = O.SNACK_ID; -- ID 값이 일치하는 데이터만 가져오기

-- LEFT JOIN

SELECT 