# 가장 댓글이 많은 게시판의 게시판 이름과 댓글 수 출력.
SELECT b.bname'게시판', COUNT(ar.arno) AS '댓글 수'
  FROM board b
  LEFT JOIN article a 
    ON b.bno = a.bno
  LEFT JOIN articleReply ar 
    ON a.ano = ar.ano
 GROUP BY b.bno
 ORDER BY COUNT(ar.arno) DESC
 LIMIT 1;
