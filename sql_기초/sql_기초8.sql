`t2``test`## 텍스트 게시판용 DB 생성
DROP DATABASE t2;
CREATE DATABASE t2;

USE t2;

## 게시물 데이터 저장용 테이블 생성

CREATE TABLE article (
id INT PRIMARY KEY AUTO_INCREMENT,
title CHAR(200) NOT NULL,
`body` TEXT NOT NULL,
hit INT NOT NULL,
regDate DATETIME NOT NULL
);

## 테이블 생성 확인
DESC article;
