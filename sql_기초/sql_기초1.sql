## board 데이터베이스가 존재한다면 삭제
DROP DATABASE IF EXISTS board;

##board 데이터 베이스 생성
CREATE DATABASE board;

## board 데이터베이스 사용
USE board;

## 테이블 목록 확인
SHOW TABLES;

## article 테이블 생성, title 과 comtent로 이루어져있다.
CREATE TABLE article(
title VARCHAR(200),
content TEXT);

## 테이블 잘 생성 되었는지 목록 확인 
SHOW TABLES;

## article 테이블에 게시물 데이터 추가(제목1, 내용1)
INSERT INTO article SET title = '제목', content = '내용1';

## 위에서 추가된 게시물 조회
SELECT * FROM article;







## 테이블의 모든 데이터 지우기
delete  from article;

select * from article;

# 제목1, 내용1 데이터 추가
insert into article set title = '제목1', content = '내용1';

# 제목2, 내용2 데이터 추가
INSERT INTO article SET title = '제목2', content = '내용2';

# 데이터 조회
select * from article;
select title from article;
select content from article;
select content, title from article;

# 제목 데이터 aaa로 수정(모두 수정됨)
update article set title = 'aaa';
select * from article;

#'body'가 내용2인 것만 조회
select * from article where content = '내용2';

# 내용2만 새로운 내용2로 수정
update article set content = '새로운내용2' where content = '내용2';
SELECT * FROM article;

# 데이터 삭제(모든 데이터가 삭제)
delete from article;
SELECT * FROM article;

# 제목1, 내용1 데이터 추가
INSERT INTO article SET title = '제목1', content = '내용1'; 

# 제목2, 내용2 데이터 추가
INSERT INTO article SET title = '제목2', content = '내용2';

SELECT * FROM article;

# 제목이 제목1인 것만 삭제
delete from article where title = '제목1';

SELECT * FROM article;












## 테이블의 모든 데이터 지우기
delete from article;

select * from article;

# 제목1, 내용1 데이터 추가
insert into article set title = '제목1', content='내용1';

# 제목2, 내용2 데이터 추가
insert into article set title = '제목2', content = '내용2';

# 데이터 조회
select * from article;
select title from article;
select content from article;

# 제목 데이터 aaa로 수정
update article set title = 'aaa';

SELECT * FROM article;

#'body'가 내용2인 것만 조회
SELECT * FROM article WHERE content = '내용2';

# 내용2만 새로운 내용2로 수정
update article set content = '새로운내용2' where content = '내용2';
SELECT * FROM article;

# 데이터 삭제(모든 데이터가 삭제)
delete from article;

SELECT * FROM article;

# 제목1, 내용1 데이터 추가
insert into article set title = '제목1', content ='내용1';

# 제목2, 내용2 데이터 추가
insert into article set title = '제목2', content = '내용2';

SELECT * FROM article;

# 제목이 제목1인 것만 삭제
delete from article where title ='제목1';

SELECT * FROM article;
