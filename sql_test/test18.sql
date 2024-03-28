# 게시판 별 가장 조회수가 높은 게시물 top 3의 게시물 제목, 내용, 작성자닉네임, 조회수 출력. 조회수 내림차순
SELECT ranked.title AS '제목', ranked.body AS '내용', m.nname AS '작성자 닉네임', ranked.hit AS '조회수'
  FROM (
	  SELECT  *,
			  ROW_NUMBER() OVER(PARTITION BY a.bno 
					  			    ORDER BY a.hit DESC) AS row_num
	    FROM article a
  )	AS ranked
  JOIN board b 
    ON ranked.bno = b.bno
  JOIN `member` m 
    ON ranked.mno = m.mno
 WHERE ranked.row_num <=3;
 
 (SELECT title, BODY, nname, hit 
    FROM article JOIN MEMBER ON article.mno = member.mno
    WHERE bno = 1
    ORDER BY hit DESC
    LIMIT 3)
UNION
    ((SELECT title, BODY, nname, hit 
        FROM article JOIN MEMBER ON article.mno = member.mno
        WHERE bno = 2
        ORDER BY hit DESC
        LIMIT 3
    )
    UNION(
        SELECT title, BODY, nname, hit 
            FROM article JOIN MEMBER ON article.mno = member.mno
            WHERE bno = 3
            ORDER BY hit DESC
            LIMIT 3))
ORDER BY hit DESC;
