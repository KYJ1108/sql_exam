# 각 회원별 게시물 수 내림차순, 게시물 수가 같으면 회원번호로 오름차순(없으면 0개라고 표시)으로 출력
SELECT m.mno AS '회원번호', m.rname AS '회원이름', m.nname AS '닉네임', IFNULL(COUNT(a.ano), 0) AS '회원별 게시물 수'
  FROM `member`m
  LEFT JOIN article a 
    ON m.mno = a.mno
 GROUP BY m.mno, m.nname
 ORDER BY COUNT(a.ano) DESC, m.mno ASC;
