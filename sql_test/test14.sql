# 각 회원별 댓글 수 내림차순, 댓글 수가 같으면 회원번호로 오름차순(없으면 0개라고 표시)으로 출력
SELECT m.mno AS '회원번호', m.rname AS '회원이름', m.nname AS '닉네임', IFNULL(COUNT(ar.ano), 0) AS '회원별 댓글 수'
  FROM `member`m
  LEFT JOIN articleReply ar
  ON m.mno = ar.mno
 GROUP BY m.mno
 ORDER BY COUNT(ar.ano) DESC, m.mno ASC;
