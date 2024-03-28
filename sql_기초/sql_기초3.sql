SELECT 1+2;
SELECT 1-2;
SELECT 1*2;





# 1 = true, 0 = false
SELECT 1>10;




#논리연산
SELECT TRUE AND FALSE;

SELECT FALSE OR TRUE;

SELECT NOT TRUE; # !와 같음

SELECT 1 < 5 AND 10 > 5;

SELECT (TRUE OR FALSE) AND FALSE AS 결과; # AS는 별명짓기

# 1과 10사이 만족하는 것
# 5
SELECT 5>1 AND 5<10;

SELECT 1 BETWEEN 1 AND 10 AS 사이;

# replace (대상, 원래문자, 바뀔문자)
SELECT REPLACE ("SQL Tutorial", "SQP", "HTML");

#substring(대상, 시작인덱스, 문자 개수)
SELECT SUBSTRING("SQL Tutorial", 5,8)AS ExtractString;

#단순 if문
SELECT IF(1<10, '참', '거짓');

#택일 구조 -> IF , ELSE IF ~
SELECT CASE 
	when 1>5 then 'a'
	when 2>5 then 'b'
	when 3>5 then 'c'
	else 'd'
end;
	



