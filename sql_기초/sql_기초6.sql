DROP DATABASE IF EXISTS scott;

CREATE DATABASE scott;

USE scott;

CREATE TABLE DEPT (
    DEPTNO DECIMAL(2), # 부서번호
    DNAME VARCHAR(14), # 부서이름
    LOC VARCHAR(13), # 부서 위치
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4), # 사원번호
    ENAME VARCHAR(10), # 사원이름
    JOB VARCHAR(9), # 직책(직무)
    MGR DECIMAL(4), # 상사
    HIREDATE DATE, # 입사일
    SAL DECIMAL(7,2), # 급여
    COMM DECIMAL(7,2), # 커미션
    DEPTNO DECIMAL(2), # 부서번호
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE TINYINT, # 급여 등급
    LOSAL SMALLINT, # 등급 최저 급여
    HISAL SMALLINT  # 등급 최고 급여
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;


#1. 사원 테이블의 모든 레코드를 조회하시오.
SELECT * 
  FROM EMP;

#2. 사원명과 입사일을 조회하시오.
SELECT ENAME AS'사원명', HIREDATE AS'입사일'
  FROM EMP;

#3. 사원번호와 이름을 조회하시오.
SELECT EMPNO AS'사원번호', ENAME AS '사원명'
  FROM EMP;

#4. 사원테이블에 있는 직책의 목록을 조회하시오. (hint : distinct, group by)
SELECT DISTINCT JOB'지책'
  FROM EMP;

#5. 총 사원수를 구하시오. (hint : count)
SELECT COUNT(*) AS'총 사원수'
  FROM  ;

#6. 부서번호가 10인 사원을 조회하시오.
SELECT *, DEPTNO AS '부서번호'
  FROM EMP
 WHERE DEPTNO = 10;

#7. 월급여가 2500이상 되는 사원을 조회하시오.
SELECT *, SAL AS'월급여'
  FROM EMP
 WHERE SAL >= 2500;

#8. 이름이 'KING'인 사원을 조회하시오.
SELECT *, ENAME AS '사원명'
  FROM EMP
 WHERE ENAME ='KING';

#9. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오. (hint : like)
SELECT EMPNO AS '사원번호', ENAME AS '사원명'
  FROM EMP
 WHERE ENAME LIKE 'S%';

#10. 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오. (hint : like)
SELECT EMPNO AS '사원번호', ENAME AS '사원명'
  FROM EMP
 WHERE ENAME LIKE '%T%';


#11. 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오. (hint : OR, in )
SELECT EMPNO AS '사원번호', ENAME AS '사원명', COMM AS '커미션'
  FROM EMP
 WHERE COMM IN (300, 500, 1400);

#12. 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오. (hint : AND, between)
SELECT EMPNO AS '사원번호', ENAME AS '사원명', SAL AS '월급여'
  FROM EMP
 WHERE SAL BETWEEN 1200 AND 3500;

#13. 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오. 
SELECT ENAME AS '사원명', EMPNO AS '사원번호', JOB AS'지책', DEPTNO AS '부서번호'
  FROM EMP
 WHERE JOB = 'MANAGER'AND DEPTNO = 30;

#14. 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오. (not)
SELECT  EMPNO AS '사원번호',ENAME AS '사원명', DEPTNO AS '부서번호'
  FROM EMP
 WHERE NOT DEPTNO = 30;

#15. 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오. (hint : not in)
SELECT EMPNO AS '사원번호', ENAME AS '사원명', COMM AS '커미션'
  FROM EMP
 WHERE COMM NOT IN (300, 500, 1400);

#16. 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오. (hint : not like)
SELECT EMPNO AS '사원번호', ENAME AS '사원명'
  FROM EMP
 WHERE ENAME NOT LIKE '%S%';

#17. 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오. (hint : not, between)
SELECT EMPNO AS '사원번호', ENAME AS '사원명', SAL AS '월급여'
  FROM EMP
 WHERE SAL NOT BETWEEN 1200 AND 3500;

#18. 직속상사가 NULL 인 사원의 이름과 직급을 조회하시오. (hint : is null, is not null)
SELECT ENAME AS '사원명',JOB AS'지책'
  FROM EMP
 WHERE MGR IS NULL;

#19. 부서별 평균월급여를 구하는 쿼리 (hint : group by, avg())
SELECT DEPTNO AS '부서ID', AVG(sal) AS '평균월급여'
  FROM EMP
 WHERE SAL
 GROUP BY DEPTNO;

#20. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리 (hint : group by, count())
SELECT DEPTNO AS'부서ID', COUNT(*) AS '사원수', COUNT(COMM) AS'커미션을 받는 사원수'
 FROM EMP
GROUP BY DEPTNO;

##############
SELECT deptno, COUNT(empno) AS'사원수'
  FROM emp
 GROUP BY deptno;
 # 커미션을 받지 않은 사람들 -> 받지 않은 사람도 null로 표시
SELECT IF(comm = 0, NULL, comm)
FROM emp;

#21. 부서별 최대 급여와 최소 급여를 구하는 쿼리 (hint : group by, min(), max())
SELECT DEPTNO AS'부서ID', MAX(SAL) AS'최대 급여', MIN(SAL) AS'최소 급여'
  FROM  EMP
 GROUP BY DEPTNO;

#22. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만) (hint : group by, having)
SELECT DEPTNO AS'부서ID', AVG(SAL) AS'급여 평균'
  FROM EMP
 GROUP BY DEPTNO
 HAVING AVG(SAL)>= 2000;

#23. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라. (hint : group by, having)
SELECT DEPTNO AS'부서ID', AVG(SAL) AS'급여 평균'
  FROM EMP
 WHERE SAL >= 1000
 GROUP BY DEPTNO
 HAVING AVG(SAL) >= 2000;
 
 #서브쿼리   
 SELECT * 
   FROM emp
  WHERE SAL >= 1000
  GROUP BY DEPTNO
 
 ######################
 ## 서브쿼리
 ## 급여가 최대인사람
 ## 서브쿼리는 먼저 실행되서 그 결과를 메인 쿼리에 사용할 수 있다.
SELECT * 
  FROM emp
 WHERE sal = (SELECT MAX(sal) FROM emp);  

## 서브쿼리의 결과 -> 테이블
## 사원 - 부서 조인
SELECT e.name, d.dname
  FROM emp e
 INNER hoin dept d
	ON e.deptno = d.deptno;
	
## 서브쿼리 사용
SELECT *
  FROM emp e
 INNER JOIN (
SELECT deptno, dname
  FROM dept) d
	ON e.deptno = d.deptno;
	
## 서브쿼리 -> 쉽다, 조인보다.(자유도가 있는 편). 너무 많이 사용하는건 자제(느림, 조인보다).

#24. 사원명과 부서명을 조회하시오. (hint : inner join)
SELECT e.ENAME AS'사원명', d.DNAME AS'부서명'
  FROM EMP e
 INNER JOIN DEPT d 
	ON e.DEPTNO = d.DEPTNO;

#25. 이름,월급여,월급여등급을 조회하시오. (hint : inner join, between)
SELECT e.ENAME AS'사원명', e.SAL AS'월급여', s.GRADE AS '월급여등급'
  FROM EMP e
 INNER JOIN SALGRADE s 
	ON e.SAL BETWEEN s.LOSAL AND s.HISAL;

#26. 이름,부서명,월급여등급을 조회하시오. 
SELECT e.ENAME AS'사원명', d.DNAME AS'부서명', s.GRADE AS '월급여등급'
  FROM EMP e
 INNER JOIN DEPT d 
	ON e.DEPTNO = d.DEPTNO
 INNER JOIN SALGRADE s 
	ON e.SAL BETWEEN s.LOSAL AND s.HISAL;

#27. 이름,직속상사이름을 조회하시오. (hint : self join)
SELECT e.ENAME AS'사원명', e2.ENAME AS'상사명'
  FROM EMP e
  JOIN EMP e2 
	ON e.MGR = e2.EMPNO;
	
#28. 이름,직속상사이름을 조회하시오.(단 직속 상사가 없는 사람도 직속상사 결과가 null값으로 나와야 함) (hint : outer join)
SELECT e.ENAME AS'사원명', e2.ENAME AS'상사명'
  FROM EMP e
  LEFT JOIN EMP e2 
	ON e.MGR= e2.EMPNO;
