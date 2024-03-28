# 총 조회수가 가장 많은 게시판의 이름
SELECT b.bname AS '게시판 이름', SUM(a.hit) AS '총 조회수'
FROM board b
JOIN article a ON b.bno = a.bno
GROUP BY b.bno
ORDER BY SUM(a.hit) DESC
LIMIT 1;
