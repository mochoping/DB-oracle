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