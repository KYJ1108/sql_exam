# 좋아요를 가장 많이 받은 회원의 아이디, 이름, 총 좋아요개수
SELECT m.mno AS '아이디', m.rname AS '이름', COUNT(l.ano) AS '총 좋아요 개수'
  FROM `like` l
  LEFT JOIN article a
    ON a.ano = l.ano
  LEFT JOIN `member` m
    ON  a.mno = m.mno
 GROUP BY m.rname
 ORDER BY COUNT(l.ano) DESC
 LIMIT 1;
