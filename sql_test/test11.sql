# 모든 게시물의 게시판이름, 제목, 작성자닉네임, 게시물작성일, 조회수, 좋아요수, 댓글수 출력. 
SELECT b.bname AS '게시판', a.title AS '제목', m.nname AS '닉네임', a.regDate AS '게시물작성일', a.hit AS '조회수', COUNT(DISTINCT l.mno) AS '좋아요', COUNT(DISTINCT ar.arno) AS '댓글수'
  FROM article a
  JOIN board b
    ON a.bno = b.bno
  JOIN `member` m
    ON a.mno = m.mno
  LEFT JOIN `like` l
    ON a.ano = l.ano
  LEFT JOIN articleReply ar
    ON a.ano = ar.ano
 GROUP BY a.title;
