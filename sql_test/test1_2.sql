# 모든 게시물의 개수 출력
SELECT COUNT(*) AS '게시물 개수'
  FROM article;

# 모든 게시물의 조회수의 총합 출력
SELECT SUM(hit) AS '조회수 총합'
  FROM article;
