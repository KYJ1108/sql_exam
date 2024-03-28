# 각 게시물 별 댓글 수 내림차순, 댓글수가 같으면 게시물번호로 오름차순 (없으면 0개라고 표시)으로 출력
SELECT a.ano AS '게시물번호', COUNT(ar.arno) AS '댓글 수'
  FROM article a
  LEFT JOIN articleReply ar
    ON a.ano = ar.ano
 GROUP BY a.ano
 ORDER BY COUNT(ar.arno) DESC, a.ano ASC;
