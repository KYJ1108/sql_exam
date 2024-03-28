DROP DATABASE mall;

CREATE DATABASE mall;

USE mall;

CREATE TABLE t_shopping(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(30) NOT NULL,
userPw CHAR(30) NOT NULL,
userName CHAR(30) NOT NULL,
address CHAR(50) NOT NULL,
pname CHAR(50) NOT NULL,
price INT(5) NOT NULL
);

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '운동화',
price = 1000000;

INSERT INTO t_shopping 
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
address = '서울',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
address = '대전',
pname = '반바지',
price = 30000;

INSERT INTO t_shopping 
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
address = '대구',
pname = '스커트',
price = 15000;

INSERT INTO t_shopping 
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
address = '부산',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
address = '울산',
pname = '티셔츠',
price = 9000;

INSERT INTO t_shopping 
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
address = '울산',
pname = '운동화',
price = 200000;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
address = '울산',
pname = '스커트',
price = 15000;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '운동화',
price = 1000000;

INSERT INTO t_shopping 
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
address = '부산',
pname = '모자',
price = 30000;


select * from t_shopping;


# 1. 손흥민의 주문 개수는? ???
SELECT COUNT(id) AS '손흥민 주문 결과' 
  FROM t_shopping 
 WHERE userName = '손흥민';

# 2. 손흥민이 산 상품은? ???
SELECT pname as '제품명', count(pname) as '손흥민 주문서' 
  FROM t_shopping 
 WHERE userName = '손흥민'
 group by pname;

# 3. 스커트를 산 사람은? ???
SELECT distinct userName as'스커트 구매자' 
  fROM t_shopping 
 WHERE pname = '스커트';

# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? ??? --> 회원별 주문건수 :  손흥민
SELECT userId AS '고객ID', userName AS '고객명', COUNT(userID) AS '주문개수'
  FROM t_shopping 
 GROUP BY userId 
 ORDER BY COUNT(userID) DESC 
 LIMIT 1;

# 5. 소지섭이 사용한 총 금액은? ???
SELECT userName as '고객명', SUM(price) AS '총 금액' 
  FROM t_shopping 
 WHERE userName = '소지섭';
 
 ## 테이블 구조를 잘 만들었는가? 썩 잘 만든건 아니다.
 SELECT * FROM t_shopping;
 
## 데이터가 중복되고 있음.
## 주문을 추가할 떄마다 손흥민 이름 데이터가 중복
## 1. 중복되면 저장 용량 많아짐 -> 비율
## 2. 중복 데이터 처리하면 연산량이 곱절 -> 비용문제
## 3. 데이터 삽입, 생긴, 삭제등을 할 때 이상현상 발생

## 삽입 이상
### 회원 가입은 하되, 주문은 아직 하지 않은 회원?

## user7 가입
insert into t_shopping
set userId = 'user7',
	userPw = '1234',
	userName = '홍길동',
	address = '대전';
 
SELECT * FROM t_shopping;

## 개선 이상
## 개명
update t_shopping
set userName = '손흥만'
where id in (1,8);

## 삭제 이상
## 설현 주문 -> 취소 == 주문 삭제하니까 회원정보 같이 날아감.
delete from t_shopping
where userName = '설현';

### 프로그래밍 세계, DB 세계 -> 쪼개라