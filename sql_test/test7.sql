# 최근 1년 사이의 게시물 제목, 내용, 작성자 닉네임, 작성일 출력 . 작성일로 내림차순
SELECT a.title AS '제목', a.`body` AS '제목', m.nname AS '닉네임', a.regDate AS '작성일'
  FROM article a
  JOIN `member` m
    ON a.mno = m.mno
 WHERE a.regDate >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
 ORDER BY a.regDate DESC;
