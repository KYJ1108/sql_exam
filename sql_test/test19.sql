# 모든 게시물 중 가장 조회수가 높은 게시물 top 3의 게시물 제목, 내용, 작성자닉네임, 조회수 출력. 조회수 내림차순
SELECT ranked.title AS '제목', ranked.body AS '내용', m.nname AS '닉네임', ranked.hit AS '조회수'
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY hit DESC) AS row_num
    FROM article
) AS ranked
JOIN MEMBER m ON ranked.mno = m.mno
WHERE ranked.row_num <= 3;
