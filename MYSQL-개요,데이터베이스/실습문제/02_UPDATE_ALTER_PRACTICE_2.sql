use khtshopping;


select * from product;

select * from `order`;

select * from review;



set SQL_SAFE_UPDATES = 0;
alter table `order` modify status enum('PENDING','SHIPPED','DELIVERED','CANCELLED','대기','배송중','배송 완료','취소');

update `order` set status = '대기' where user_id = 5;
alter table `order` modify status enum('PENDING','SHIPPED','DELIVERED','CANCELLED');
UPDATE `ORDER`

SET STATUS = CASE
    WHEN STATUS = 'PENDING' THEN '대기'
    WHEN STATUS = 'SHIPPED' THEN '배송 중'
    WHEN STATUS = 'DELIVERED' THEN '배송 완료'
    WHEN STATUS = 'CANCELLED' THEN '취소'
END;

SELECT CONCAT('HELLO',' ','WORLD','!');

SELECT SUBSTRING_INDEX('USER@EXAMPLE.COM', '@',- 1);

SELECT CONCAT(  SUBSTRING_INDEX('USER@EXAMPLE.COM', '@', 1) , '@kht.com');
use khtuser;
select * from user;
set sql_safe_updates = 0;
update user
set email = CONCAT(  SUBSTRING_INDEX(email, '@', 1) , '@kht.com');
commit;
DELETE FROM user WHERE user_id = 10;

update user
set phone = concat( '+82)', phone);

alter table user modify phone varchar(20);


SELECT SUBSTRING_INDEX('+82)010-1234-5678', ')',- 1);


update user
set phone = SUBSTRING_INDEX(phone, ')',- 1);

savepoint "1234";

update user
set phone = concat( 'kor)', phone);

rollback to savepoint "1234";
rollback;
INSERT INTO USER (USERNAME, EMAIL, PASSWORD_HASH, PHONE, STATUS) VALUES
('홍길동', 'hong@example.com', 'hashed_password_1', '010-1234-5678', 'ACTIVE'),
('김영희', 'kim@example.com', 'hashed_password_2', '010-2345-6789', 'ACTIVE'),
('이철수', 'lee@example.com', 'hashed_password_3', '010-3456-7890', 'INACTIVE'),
('박민수', 'park@example.com', 'hashed_password_4', '010-4567-8901', 'ACTIVE'),
('최수지', 'choi@example.com', 'hashed_password_5', '010-5678-9012', 'ACTIVE');