# 각 회원별 게시물의 조회수 총합 내림차순, 조회수가 같으면 회원번호로 오름차순 출력 
SELECT a.mno AS '회원번호', m.nname AS '닉네임', SUM(a.hit) AS '조회수 총합'
FROM article a
JOIN MEMBER m ON a.mno = m.mno
GROUP BY a.mno, m.nname
ORDER BY SUM(a.hit) DESC, a.mno ASC;
