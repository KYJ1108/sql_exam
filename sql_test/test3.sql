# 이순신이 작성한 댓글의 내용, 작성자 닉네임, 작성일 출력. 작성일로 내림차순
SELECT a.rbody AS '댓글 내용', m.nname AS '닉네임', a.regDate AS '작성일'
  FROM articleReply a
  JOIN `member` m 
	ON a.mno = m.mno
 WHERE m.rname = '이순신'
 ORDER BY a.regDate DESC;
