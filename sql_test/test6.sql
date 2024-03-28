# 각 게시판별 게시판 이름과 총 게시물 수 출력. 게시물 수 내림차순
SELECT b.bname AS '게시판 이름', COUNT(a.ano) AS '총 게시물 수'
  FROM board b
  LEFT JOIN article a
    ON b.bno = a.bno
 GROUP BY b.bno
 ORDER BY COUNT(a.ano) DESC;
