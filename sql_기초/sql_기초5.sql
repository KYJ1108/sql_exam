DROP DATABASE mall;

CREATE DATABASE mall;

USE mall;

CREATE TABLE t_order(
id INT(5) PRIMARY KEY AUTO_INCREMENT, # 주문번호
userNo INT(5) NOT NULL, # 회원번호
productNo INT(5) NOT NULL # 상품번호
);

CREATE TABLE t_user(
id INT(5) PRIMARY KEY AUTO_INCREMENT, # 회원번호
userId CHAR(200) NOT NULL, # 회원아이디
userPw CHAR(200) NOT NULL, # 회원 비밀번호
userName CHAR(50) NOT NULL, # 회원 이름
addr CHAR(200) NOT NULL # 주소
);

CREATE TABLE t_product(
id INT(5) PRIMARY KEY AUTO_INCREMENT, # 상품 번호
pname CHAR(100) NOT NULL, # 상품 이름
price INT(10) NOT NULL # 상품 가격
);

INSERT INTO t_product
SET pname = '운동화',
price = 1000000;

INSERT INTO t_product
SET pname = '코트',
price = 100000;

INSERT INTO t_product
SET pname = '반바지',
price = 30000;

INSERT INTO t_product
SET pname = '스커트',
price = 15000;

INSERT INTO t_product
SET pname = '코트',
price = 100000;

INSERT INTO t_product
SET pname = '티셔츠',
price = 9000;

INSERT INTO t_product
SET pname = '운동화',
price = 200000;

INSERT INTO t_product
SET pname = '모자',
price = 30000;



INSERT INTO t_user
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
addr = '런던';

INSERT INTO t_user
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
addr = '서울';

INSERT INTO t_user
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
addr = '대전';

INSERT INTO t_user
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
addr = '대구';

INSERT INTO t_user
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
addr = '부산';

INSERT INTO t_user
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
addr = '울산';


INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 2,
productNo = 2;

INSERT INTO t_order
SET userNo = 3,
productNo = 3;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 5,
productNo = 5;

INSERT INTO t_order
SET userNo = 6,
productNo = 6;

INSERT INTO t_order
SET userNo = 6,
productNo = 7;

INSERT INTO t_order
SET userNo = 1,
productNo = 5;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 5,
productNo = 8;

SELECT * 
  from t_user;
SELECT * 
  FROM t_product;
SELECT * 
  FROM t_order;
  
#################################
## 분리된 테이블로 동일한 문제 풀기
# 1. 손흥민의 주문 개수는? ???
SELECT COUNT(t_order.id) AS '손흥민 주문 결과' 
  FROM t_order 
  join t_user ON t_order.userNo = t_user.id
 WHERE t_user.userName = '손흥민';
 
 ###
 
 select * 
   from t_order;
 select id
  from t_order
 where userNo = 1;

################################
# 2. 손흥민이 산 상품은? ???
SELECT t_product.pname AS '제품명', COUNT(t_product.pname) AS '손흥민 주문서' 
  FROM t_order 
  join t_user ON t_order.userNo = t_user.id
  join t_product on t_order.productNo = t_product.id
 WHERE userName = '손흥민';
 
 ###
 
select productNo
  from t_order
 where userNo=1;
 
select * 
  from t+produt
 where id in (1,5);
 
##################################
# 3. 스커트를 산 사람은? ???
SELECT DISTINCT t_user.userName AS'스커트 구매자' 
  FROM t_order 
  join t_user on t_order.userNo = t_user.id
  join t_product on t_order.productNo = t_product.id
 WHERE t_product.pname = '스커트';
 
###
 
select id
  from t_product
 where pname = '스커트';
 
select userNo
  from t_order
 where productNo = 4;
 
select userName
  from t_user
 where id = 4;

#########################################
# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? ???
SELECT t_user.userId as'고객ID', t_user.userName AS '고객명', COUNT(t_order.id) AS '주문개수'
  FROM t_order 
  join t_user on t_order.userNo = t_user.id
 GROUP BY t_user.id
 ORDER BY count(t_order.id) DESC 
 LIMIT 1;
 
###
 
select userNo, count(userNo) as cnt
  from t_order
 group by userNo
 order by cot desc;
 
select userName
from t_user
where id = 1;

###################################
# 5. 소지섭이 사용한 총 금액은? ???
SELECT t_user.userName AS '고객명', SUM(t_product.price) AS '총 금액' 
  FROM t_order
  join t_user on t_order.userNo = t_user.id
  join t_product on t_order.productNo = t_product.id 
 WHERE t_user.userName = '소지섭';
 
 ###
 
select id
  from t_user
 where userName = '소지섭';

select productNo
  from t_order
 where userNo = 5;

select sum(price)
  from t_product
 where id in(5,8);



### 데이터 조회를 편하게 하려면 테이블 한개가 좋음 -> 데이터 관리가 X
### 데이터를 효율적으로 관리하기 위해 테이블 쪼갬 -> 데이터 조회가 불편

### 조인 제공 -> 실제 물리적으로는 분리되어 이 있는 테이블을 논리적으로 이어 붙이는것

SELECT * 
  from t_order;

select * 
  from t_user;
  
select *
  from t_order
 inner join t_user
	on t_order.userNo = t_user.id;
	
select *
  from t_order
 inner join t_product
	on t_order.productNo = t_product.id;
	
	
## 테이블 3개 조인 (.먼저 나오는 테이블이 왼쪽, 그 다음 나오는 테이블이 오른쪽
## 조인 결과를 하나의 테이블로 볼 수 있다.
## 조인 결과 실제 테이블 X, 가상의 테이블(View) -> update, delete, insert X
select * 
  from t_order
 inner join t_user
	on t_order.userNo = t_user.id
 inner join t_product
	on t_order.productNo = t_product.id;
	
### 문제, 조인을 해서 쇼핑을 SQL 문제 풀기

INSERT INTO t_user
SET userId = 'user7',
userPw = 'pass7',
userName = '홍길동',
addr = '경기';

INSERT INTO t_product
SET pname = '가디건',
price = 39000;

select *
  from t_user;
select * 
  from t_product;
select * 
  from t_order o
 inner join t_user u
	on o.userNo = u.id;

## 회원별로 주문건수 좀 알아봐 줘.
select t_user.userId as '고객ID',t_user.userName as'고객명', count(t_order.id)as '주문건수'
  from t_user
  join t_order on t_user.id = t_order.userNo
 group by t_user.id, t_user.userID, t_user.userName;
 
 select userNo as '고객번호', userName as'고객명', u.addr as'주소', count(u.id)as'주문건수'
   from t_order o
   right outer join t_user u
	on o.userNo = u.id;
	
	## 회원별로 주문 건수 좀 알아봐줘 ->? 길동이 없엄
select userId, userName, count(u.id)
  from t_order o
 right outer join t_user u
	on o.userNo = u.id
	group by o.userNo;