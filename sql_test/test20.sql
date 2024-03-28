# 모든 게시물 중 가장 댓글이 많은 게시물 top 3의 게시물번호, 게시물제목, 작성자닉네임, 게시물작성일, 댓글 수 출력. 댓글 수 내림차순
SELECT a.ano AS '게시물번호', a.title AS '게시물제목', m.nname AS '닉네임', a.regDate AS '게시물작성일', COUNT(ar.arno) AS '댓글 수'
  FROM article a
  JOIN MEMBER m ON a.mno = m.mno
  LEFT JOIN articleReply ar ON a.ano = ar.ano
 GROUP BY a.ano, a.title, m.nname, a.regDate
 ORDER BY COUNT(ar.arno) DESC
 LIMIT 3;
