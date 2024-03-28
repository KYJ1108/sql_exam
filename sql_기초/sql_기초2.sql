# ==== DB 초기화 ====
DROP DATABASE IF EXISTS board;

CREATE DATABASE board;

USE board;

CREATE TABLE article(
  title VARCHAR(200),
  content TEXT
);

SELECT * FROM article;
# ==================

# board DB 선택
USER board;

# 게시물 조회
SELECT * FROM article;

# article 테이블 데이터 삭제

# 제목3, 내용3 데이터 두개 추가 (f9 2번 누르면 됨)
INSERT INTO article SET title  = '제목3', content = '내용3';

SELECT * FROM article;

# 제목3인 게시물 중 두번째 것만 제목을 새제목3으로 수정 (게시물 구분 안됨)
SELECT * FROM article WHERE title = '새제목3';

# 테이블 구조 확인
DESC article;

## key -> 중복X, 반드시 데이터가 있어야함.(비어있음X)
## 후보키 -> 여러 속성 중에서 키가 도리수 있는 속성
## 주민번호, 일련번호, 사번, 학번 등...
### 전화번호 -> 후보키X, 주민번호 -> 후보키?(호적, 등본 안된 사람)
### 쉬운 방법 -> 키를 집접 만들면 된다. (문자 조함, 숫자) 숫자가 편함. 1씩 증가시키면 중복X

# 테이블 구조 수정 - 칼럼 추가(ADD), 기존 칼럼 삭제(DROP), 기존 칼럼 내용 변경(MODIFY)
# 식별용 데이터를 저장할 id 컬럼 추가
alter table article add id int;

# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
select * from article;

# 기존 데이터 중 1개만 id를 2로 변경 -> 방법X

# 가장 위에 있는 데이터만 조회(가장 위에있는거 1개, 2는 가장 위에 있는거 2개...)
select * from article limit 1;

# 가장 위에 있는 데이터의 id를 2로 수정
update article set id = 2 limit 1;
 
# 데이터 조회
SELECT * FROM article;

# 2번 게시물만 조회
select * from article where id = 2;

# 2번 게시물이 아닌 게시물 조회 (안나옴.. 값이 null인 것은 필터 대상이 안됨)
select * from article where id = null;
select * from article where id != 2;

# NULL인 데이터를 필터 검색
select * from article where id is null; # null인 것 찾을 때
select * from article where id is not null; # null이 아는 것 찾은 때

# id가 null인 행 찾아서 id값을 1로 수정.
update article set id = 1 where id is null;

# 데이터 조회
select * from article;

#################################################################################################

# id가 2, 제목은 제목4, 내용은 내용4인  게시물데이터 추가 (id 2인 값이 존재하지만 중복등록 됨.)
insert into article set title = '제목4', content = '내용4', id =2;

# 데이터 조회
select * from article;

DESC article;

# id 컬럼에 unique, not null 제약 걸기(이미 중복되는 데이터가 있기 때문에 제약이 걸리지 않음)
## not null -> null 허용X
## unique -> 중복 허용X
## auto_increment -> 자동증가
## default -> 기본값 설정

alter table article modify id int not null unique;

# 2번 게시물, 데이터 삭제 => DELETE
SELECT * FROM article where id=2 and title='제목4';
DELETE FROM article WHERE id=2 AND title='제목4';

SELECT * FROM article;

# 다시 id 컬럼에 unique, not null 제약 걸기
ALTER TABLE article MODIFY id INT NOT NULL UNIQUE;

# 구조 확인
desc article;

# id 없이 게시물 하나 추가. 제목1, 내용1 (id가 not null이라 0으로 바뀌어서 들어감)
INSERT INTO article SET title = '제목1', content = '내용1';

SELECT * FROM article;

# id 없이 게시물 하나 추가. 제목2, 내용2 (0이 이미 존재하므로 등록이 안됨)
INSERT INTO article SET title = '제목2', content = '내용2', id =3;

SELECT * FROM article;

# id 컬럼에 자동증가제약(INT AUTO_INCREMENT) 추가
alter table article modify id int auto_increment;

SELECT * FROM article;

# 구조 확인
desc article;

#데이터 삭제
delete from article;

# id 컬럼에 자동증가제약 다시 시도
ALTER TABLE article MODIFY id INT AUTO_INCREMENT;


# 구조 확인
DESC article;

# id 없이 게시물 하나 추가. 제목1, 내용1
insert into article set title = '제목1', content = '내용1';

# id 없이 게시물 하나 추가. 제목2, 내용2
INSERT INTO article SET title = '제목2', content = '내용2';

# 데이터 확인
SELECT * FROM article; # id를 넣지 않아도 들어감

###################################################################
## 제약은 테이블 생성할 때 미리 설계해놓고 반영하는 것이 일반적.


## 기존의 article 테이블 삭제
drop table article;

## 보통 제약을 다 걸어놓고 테이블 생성
## article 테이블 생성 -> id(pk), title, content. id는 자동증가
create table article(
	id int primary key auto_increment, # primary key로하면 not null과 
	title char(200),
	content text not null
);

desc article;






























# board DB 선택
use board;

# 게시물 조회
select * from article;

# article 테이블 데이터 삭제
drop table article;

# article 테이블 생성
CREATE TABLE article(
  title VARCHAR(200),
  content TEXT
);

# 제목3, 내용3 데이터 두개 추가
INSERT INTO article SET title  = '제목3', content = '내용3';

SELECT * FROM article;

# 제목3인 게시물 중 두번째 것만 제목을 새제목3으로 수정 (게시물 구분 안됨)
update article set title='새제목3' where title='제목3';

# 테이블 구조 확인
DESC article;

# 테이블 구조 수정 - 칼럼 추가(ADD), 기존 칼럼 삭제(DROP), 기존 칼럼 내용 변경(MODIFY)
# 식별용 데이터를 저장할 id 컬럼 추가
alter table article add id int;

# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
select * from article;

# 기존 데이터 중 1개만 id를 2로 변경 -> 방법 X, 사실 limit를 사용하면 가능은 하다
# 가장 위에 있는 데이터만 조회
select *from article limit 1;

# 가장 위에 있는 데이터의 id를 2로 수정
update article set id = 2 limit 1;

# 데이터 조회
select * from article;

# 2번 게시물만 조회
select * from article where id = 2;

# 2번 게시물이 아닌 게시물 조회 (안나옴.. 값이 null인 것은 필터 대상이 안됨)
select * from article where id = null;

# NULL인 데이터를 필터 검색
select * from article where id is null; 
select * from article where id is not null;

# id가 null인 행 찾아서 id값을 1로 수정.
update article set id = 1 where id is null;

# 데이터 조회
select * from article;

####################
# id가 2, 제목은 제목4, 내용은 내용4인 게시물데이터 추가 (id 2인 값이 존재하지만 중복등록 됨.)
insert into article set title = '제목4', content='내용4', id = 2;

# 데이터 조회
select * from article;

# 구조 확인
desc article;

# id 컬럼에 unique, not null 제약 걸기(이미 중복되는 데이터가 있기 때문에 제약이 걸리지 않음) -> 안됨

# 2번 게시물, 데이터 삭제 => DELETE
delete from article where id =2 and title = '제목4';

# 다시 id 컬럼에 unique, not null 제약 걸기
alter table article modify id int not null unique;

# 구조 확인
desc article;

# id 없이 게시물 하나 추가. 제목1, 내용1 (id가 not null이라 0으로 바뀌어서 들어감)
insert into article set title = '제목1', content = '내용1';

SELECT * FROM article;

# id 없이 게시물 하나 추가. 제목2, 내용2 (0이 이미 존재하므로 등록이 안됨) -> 등록 안됨
insert into article set title = '제목2', content = '내용2 ';

# id 컬럼에 자동증가제약 추가 -> 데이터 중복으로 제약 추가 안됨.

# 데이터 삭제

# 구조 확인

# id 컬럼에 자동증가제약 다시 시도 -> 됨

# id 없이 게시물 하나 추가. 제목1, 내용1

# id 없이 게시물 하나 추가. 제목2, 내용2

# 데이터 확인

###############################################################################

## 제약은 테이블 생성할 때 미리 설계해놓고 반영하는 것이 일반적.

## 기존의 article 테이블 삭제

## article 테이블 생성 -> id(pk), title, content. id는 자동증가, title, content는 not null 제약 추가.

## 구조 확인


