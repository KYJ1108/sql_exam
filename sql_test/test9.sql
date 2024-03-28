# 연도별 게시물 등록 개수 현황 출력. 연도 오름차순
SELECT YEAR(regDate) AS '연도', COUNT(ano) AS '게시물 등록 개수'
  FROM article
 GROUP BY YEAR(regDate)
 ORDER BY YEAR(regDate);
