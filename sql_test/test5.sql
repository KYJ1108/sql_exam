# 자유게시판에서 제목에 '제'라는 문자가 포함된 모든 게시물 조회(게시물번호, 제목, 내용, 조회수, 작성자 닉네임, 작성일). 작성일로 내림차순
SELECT a.ano AS '게시물번호', a.title AS '제목', a.`body` AS '내용', a.hit AS '조회수', m.nname AS'닉네임', a.regDate AS'작성일'
  FROM article a
  JOIN `member` m 
	ON a.mno = m.mno
  JOIN board b
    ON a.bno = b.bno
 WHERE b.bname = '자유게시판' AND a.title LIKE '%제%'
 ORDER BY a.regDate DESC;
