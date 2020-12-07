--20201012
/* CREATE TABLE TIGER01(
  age NUMBER
); --반드시 ; 필요 */

--SELECT * FROM TAB;

--DROP TABLE TAB01;
--DROP TABLE TAB02;
--DROP TABLE TIGER01;
--SELECT * FROM TAB;

--SHOW RECYCLEBIN;

--PURGE RECYCLEBIN;
--SHOW RECYCLEBIN;

/* CREATE TABLE TAB01{
  age NUMBER
}; */

--SHOW RECYCLEBIN;

/*
CREATE TABLE TIGER03(
  age NUMBER
);

DROP TABLE TIGER02;
DROP TABLE  TIGER03;
SHOW RECYCLEBIN;

PURGE RECYCLEBIN;
*/

/*
DROP TABLE TAB01;
CREATE TABLE TAB01(
  NAME VARCHAR2(40), --문자열
  AGE NUMBER
);


-- DESC TAB01;   --description 약자

INSERT INTO TAB01(NAME, AGE) VALUES('호랑이', 10); 
INSERT INTO TAB01(NAME, AGE) VALUES('코끼리', 20);
INSERT INTO TAB01(NAME, AGE) VALUES('독수리', 21);
INSERT INTO TAB01(NAME, AGE) VALUES('코알라', 26);

-- 나이가 20살인 것을 찾아서 이름을 홍길동으로 바꾸기

UPDATE TAB01
SET NAME = '홍길동'
WHERE AGE = 20;


-- 이름이 호랑이인 것을 찾아서 나이를 53으로 바꾸기

UPDATE TAB01
SET AGE = 53
WHERE NAME = '호랑이';


-- 이름이 코끼리인 것을 찾아서 원숭이로 바꾸기
UPDATE TAB01
SET NAME = '원숭이'
WHERE NAME = '코끼리';

DELETE FROM TAB01 WHERE AGE = 21;

SELECT * FROM TAB01;

COMMIT;  --하드웨어에 저장하시오



/*
DROP TABLE TAB02;
CREATE TABLE TAB02(
  NAME VARCHAR2(40),
  AGE NUMBER
);

INSERT INTO TAB02 VALUES('강아지', 3);
INSERT INTO TAB02 VALUES('고양이', 7);
INSERT INTO TAB02 VALUES('뱀', 5);
INSERT INTO TAB02 VALUES('타조', 13);
INSERT INTO TAB02 VALUES('치타', 8);

SELECT * FROM TAB02;
*/








/*
DROP TABLE EMP01;

CREATE TABLE EMP01(
  ENO NUMBER(4), --사번
  ENAME VARCHAR2(20), --이름
  SALARY NUMBER --급여
);

INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(101, '호랑이', 3000000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(102, '강아지', 4500000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(103, '코알라', 5500000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(104, '고양이', 4000000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(105, '임팔라', 3800000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(106, '거북이', 4300000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(107, '개구리', 3500000);
INSERT INTO EMP01(ENO, ENAME, SALARY) VALUES(108, '원숭이', 5000000);

--묵시적인 방법
INSERT INTO EMP01 VALUES(109, '다람쥐', 5000000);

INSERT INTO EMP01 VALUES(100+10, '침팬지', 3000000*1.2);

--빈값 입력할 땐  null
INSERT INTO EMP01 VALUES(111, null, 3500000);

--신기하지만 잘 사용하지 않는 방법 (단, JAVA에서는 이용함)
--INSERT INTO EMP01 VALUES(&A,&B,&C);
--INSERT INTO EMP01 VALUES(&A,'&B',&C);

SELECT * FROM EMP01;
SELECT COUNT(*) FROM EMP01; --안에 들어있는 ROW 갯수
SELECT ENO FROM EMP01;
SELECT ENO, SALARY FROM EMP01;
SELECT SALARY, ENO, ENAME FROM EMP01; --순서 마음대로 정할 수 있음
-- *을 사용해서 보면 정확히 뭐가 들어있는지 알기 어려움(코드의 가독성때문이니 다 적어줘라)

SELECT ENO, ENAME, SALARY, ENO, SALARY*1.2 AS 총급여, SALARY*1.2-SALARY AS 보너스, SALARY*12 AS 연봉 FROM EMP01;
--SELECT ENO AS 사번, ENAME AS 이름,SALARY AS 급여 FROM EMP01;

SELECT ENO AS "사  번" FROM EMP01; -- 띄어쓰기 하고 싶으면 "" 사용

SELECT (ENO||ENAME)AS 사번이름 FROM EMP01; -- 두개를 뭉쳐서 하나의 필드로

COMMIT;
*/







--20201013
/*
DROP TABLE EMP01;

CREATE TABLE EMP01(
  ENO NUMBER(4), --사번
  ENAME VARCHAR2(20), --이름
  SALARY NUMBER --급여
);

INSERT INTO EMP01 VALUES(111, '호랑이', 1000000);
INSERT INTO EMP01 VALUES(711, '호강이', 2000000);
INSERT INTO EMP01 VALUES(311, '고양이', 3000000);
INSERT INTO EMP01 VALUES(411, '고양이', 4000000);
INSERT INTO EMP01 VALUES(611, '강아지', 5000000);
INSERT INTO EMP01 VALUES(511, '호숙이', 6000000);
INSERT INTO EMP01 VALUES(811, '고양이', 7000000);
INSERT INTO EMP01 VALUES(211, '강아지', 8000000);
INSERT INTO EMP01 VALUES(211, '고강이', 9000000);
INSERT INTO EMP01 VALUES(811, '강강이', 10000000);


SELECT * FROM EMP01;

SELECT DISTINCT(ENAME) FROM EMP01;  --중복되는거 빼고 보여줌

SELECT COUNT(DISTINCT(ENAME)) FROM EMP01;
--SELECT COUNT(DISTINCT ENAME) FROM EMP01;  --DISTINCT에서 괄호 빼도 됨

SELECT ALL ENAME FROM EMP01;  --ALL은 보통 생략

SELECT DISTINCT(ENAME), ENO FROM EMP01;  --ROW갯수가 다른 경우 같이 나타낼수 없음(원하는 결과X)

SELECT SALARY*12 FROM EMP01;  --NULL과 0은 다름

SELECT 8*3 FROM DUAL;  -- 단순한 수식/결과값 얻고 싶을 때 테이블명 대신 DUAL 사용
SELECT 7*3, 7+3, 7-3, 7/3, MOD(7,3) FROM DUAL;  -- 8%3은 오류남 (대신 MOD() 사용)



SELECT * FROM EMP01 ORDER BY ENO ASC;  --사번 오름차순으로 정렬하기
SELECT * FROM EMP01 ORDER BY ENO;  --ASC 생략 가능
SELECT * FROM EMP01 ORDER BY ENAME;
SELECT * FROM EMP01 ORDER BY ENO DESC;  --내림차순

SELECT * FROM EMP01;  --정리해서 보여주는 것일 뿐 테이블 자체를 바꾸는 것은 아님

SELECT * FROM EMP01 ORDER BY ENAME DESC, ENO ASC;  --2차 정렬

SELECT * FROM EMP01 WHERE ROWNUM <= 4 ORDER BY ENO ASC;

SELECT * 
  FROM EMP01 
  WHERE ROWNUM <= 4 
  ORDER BY ENO ASC;  --이런식으로 많이 씀

SELECT (ENO+SALARY) FROM EMP01 ORDER BY (ENO+SALARY);  
--ORDER BY 뒤에는 정렬기준. SELECT 뒤에는 내가 눈으로 보고싶은거
SELECT ENO, ENAME, SALARY, ENO+SALARY FROM EMP01 ORDER BY (ENO+SALARY);

SELECT * FROM EMP01 WHERE SALARY = 4000000;
SELECT * FROM EMP01 WHERE SALARY <= 4000000;
SELECT * FROM EMP01 WHERE SALARY >= 4000000;
SELECT * FROM EMP01 WHERE SALARY < 4000000;
SELECT * FROM EMP01 WHERE SALARY > 4000000;
SELECT * FROM EMP01 WHERE SALARY != 4000000;  --같지 않다1
SELECT * FROM EMP01 WHERE SALARY ^= 4000000;  --같지 않다2
SELECT * FROM EMP01 WHERE SALARY <> 4000000;  --같지 않다3

--SELECT SALARY AS SS FROM EMP01 WHERE SS > 3000000;  --(오류)

/*
SELECT 테이블명
FROM 필드명
WHERE 조건
GROUP BY HAVING ORDER BY 정렬기준
 */ 
 
/* 
SELECT SALARY AS SS
FROM 
WHERE SS 사용할 수 없다
GROUP BY SS 사용할 수 있다 HAVING ORDER BY ss 사용할 수 있다
*/
/*
--급여가 300만원 이상인 사람은 총 몇명?
SELECT COUNT (*) FROM (SELECT * FROM EMP01 WHERE SALARY > 3000000);  --인라인뷰 INLINEVIEW, 이게 활용빈도 더 높음
SELECT COUNT (*) FROM EMP01 WHERE SALARY > 3000000;

SELECT * FROM EMP01 WHERE (ENAME = '강아지' AND SALARY >= 3000000);
SELECT * FROM EMP01 WHERE (ENAME = '강아지' OR SALARY >= 3000000);
SELECT * FROM EMP01 WHERE (ENAME = '강아지' OR SALARY >= 3000000 OR ENO <= 511);
SELECT * FROM EMP01 WHERE NOT (SALARY > 3000000);  --SALARY가 300보다 적거나 같은 사람 / 급여가 300만원이 넘지 않는 사람

SELECT * FROM EMP01 WHERE ENO = 311 OR ENO = 711 OR ENO = 811;
SELECT * FROM EMP01 WHERE ENO IN (311, 711, 811);


----------------------------------------------------------------------------------------
DROP TABLE EMP02;

CREATE TABLE EMP02(
  ID NUMBER
);

INSERT INTO EMP02 VALUES(711);
INSERT INTO EMP02 VALUES(311);
INSERT INTO EMP02 VALUES(511);

SELECT * FROM EMP01 WHERE ENO IN (SELECT * FROM EMP02);  --IN은 보통 이런 용도로 사용됨
--우리나라 산 10개 중 '북한산'에 갔다온 등산객을 알고싶을때
----------------------------------------------------------------------------------------







SELECT * FROM EMP01 WHERE (SALARY >= 2000000 AND SALARY <= 4000000);
SELECT * FROM EMP01 WHERE SALARY BETWEEN 2000000 AND 4000000;
SELECT * FROM EMP01 WHERE SALARY NOT BETWEEN 2000000 AND 4000000;

SELECT * FROM EMP01 WHERE ENAME LIKE '호%';  --'호'로 시작하는 이름 뽑기
--ex) 성별 필드 존재하지 않는 테이블에서 '여자' 찾기: 주민등록번호에 '-2' 포함된거 찾기
/* select *
  from student
  where resident_id like '%-2%'
*/

/*
SELECT * FROM EMP01 WHERE SALARY = null;  --(오류) 비교연산 이용해서 찾는건 안됨
SELECT * FROM EMP01 WHERE SALARY IS null;
SELECT * FROM EMP01 WHERE SALARY IS NOT null;

SELECT * FROM EMP01 WHERE ENAME IS null;  -- '' 사이에 아무것도 없으면 자동으로 NULL 처리함

/*
NOT을 붙일 수 있는 경우
  NOT IN
  NOT BETWEEN
  NOT LLIKE
  IS NOT NULL
*/

/*
NULL이 들어갈 수 밖에 없는 경우
  미혼인 고객의 결혼기념일
  비밀번호 찾기를 설정하지 않은 경우
  미성년자의 출신 대학
  통장 개설을 하지 않은 고객
*/




/*
DROP TABLE EMP03;

CREATE TABLE EMP03(
  ENAME VARCHAR2(20),
  ADDRESS VARCHAR2(20)
);

INSERT INTO EMP03 VALUES('홍길동', '서울');
INSERT INTO EMP03 VALUES('이순신', '서울');
INSERT INTO EMP03 VALUES('안중근', '대구');
INSERT INTO EMP03 VALUES('유관순', '서울');
INSERT INTO EMP03 VALUES('윤봉길', '대전');



DROP TABLE EMP04;

CREATE TABLE EMP04(
  SALARY NUMBER
);

INSERT INTO EMP04 VALUES(100);
INSERT INTO EMP04 VALUES(200);
INSERT INTO EMP04 VALUES(300);
INSERT INTO EMP04 VALUES(400);


--교차조인(CROSS JOIN)
SELECT * FROM EMP03, EMP04;

SELECT * FROM EMP03 s1, EMP03 s2
WHERE s1.address = s2.address and s1.ename = '이순신';


SELECT ADDRESS FROM EMP03 WHERE ENAME = '이순신';

SELECT ENAME FROM EMP03 WHERE ADDRESS = '서울';
SELECT ENAME FROM EMP03 WHERE ADDRESS = (SELECT ADDRESS FROM EMP03 WHERE ENAME = '이순신');
SELECT ENAME FROM EMP03 S1,(SELECT ADDRESS FROM EMP03 WHERE ENAME = '이순신') S2 WHERE S1.ADDRESS = S2.ADDRESS;

COMMIT;
*/








--20201014
/*
DROP TABLE EMP01;
CREATE TABLE EMP01(
  ENO NUMBER(4), --사번
  ENAME VARCHAR2(20), --이름
  SALARY NUMBER --급여
);

INSERT INTO EMP01 VALUES(111, '호랑이', 1000000);
INSERT INTO EMP01 VALUES(711, '호강이', 2000000);
INSERT INTO EMP01 VALUES(311, '고양이', 3000000);
INSERT INTO EMP01 VALUES(411, '고양이', 4000000);
INSERT INTO EMP01 VALUES(611, '강아지', 5000000);
INSERT INTO EMP01 VALUES(511, '호숙이', 6000000);
INSERT INTO EMP01 VALUES(811, '고양이', 7000000);
INSERT INTO EMP01 VALUES(211, '강아지', 8000000);
INSERT INTO EMP01 VALUES(211, '고강이', 9000000);
INSERT INTO EMP01 VALUES(811, '강강이', 10000000);

SELECT * FROM EMP01 WHERE SALARY > 2000000 OR SALARY > 3000000 OR SALARY > 4000000;
SELECT * FROM EMP01 WHERE SALARY > ANY(2000000,3000000,4000000);  -- 2000000만원보다 큰 사람 찾기
SELECT * FROM EMP01 WHERE SALARY < ANY(2000000,3000000,4000000);  -- 4000000만원보다 작은 사람 찾기
SELECT * FROM EMP01 WHERE SALARY > ALL(2000000,3000000,4000000);
SELECT * FROM EMP01 WHERE SALARY < ALL(2000000,3000000,4000000);
--  >ANY(MIN): 최소값보다 큰거 찾기
--  <ANY(MAX): 최대값보다 작은거 찾기
--  >ALL(MAX): 최대값보다 큰거 찾기
--  <ALL(MIN): 최소값보다 작은거 찾기





DROP TABLE EMP05;
CREATE TABLE EMP05(
  DNO NUMBER,
  ENAME VARCHAR2(20),
  SALARY NUMBER
);

INSERT INTO EMP05 VALUES(10, '일길동', 100);
INSERT INTO EMP05 VALUES(20, '이길동', 200);
INSERT INTO EMP05 VALUES(30, '삼길동', 300);
INSERT INTO EMP05 VALUES(40, '사길동', 400);
INSERT INTO EMP05 VALUES(10, '오길동', 500);
INSERT INTO EMP05 VALUES(20, '육길동', 600);
INSERT INTO EMP05 VALUES(30, '칠길동', 700);
INSERT INTO EMP05 VALUES(10, '팔길동', 800);
INSERT INTO EMP05 VALUES(20, '구길동', 900);
INSERT INTO EMP05 VALUES(30, '십길동', 1000);

SELECT * FROM EMP05;

--20번 부서에서 급여를 제일 많이 받는 사람보다 적게 받는 사람을 출력하시오
SELECT ENAME FROM EMP05 WHERE SALARY < ANY(SELECT SALARY FROM EMP05 WHERE DNO=20);
--20번 부서에서 급여를 가장 적게 받는 사람보다도 적게 받는 사람을 출력하시오
SELECT ENAME FROM EMP05 WHERE SALARY < ALL(SELECT SALARY FROM EMP05 WHERE DNO=20);






DROP TABLE EMP06;
CREATE TABLE EMP06(
  ENAME VARCHAR2(20)
);

INSERT INTO EMP06 VALUES('일길동');
INSERT INTO EMP06 VALUES('이길동');
INSERT INTO EMP06 VALUES('삼길동');


DROP TABLE EMP07;
CREATE TABLE EMP07(
  ENAME VARCHAR2(20)
);

INSERT INTO EMP07 VALUES('삼길동');
INSERT INTO EMP07 VALUES('사길동');
INSERT INTO EMP07 VALUES('오길동');


SELECT ENAME FROM EMP06
UNION ALL
SELECT ENAME FROM EMP07;  --UNION: 중복된 데이터는 제거됨 // UNION ALL: 중복 상관없이 모두 보여줌

SELECT ENAME FROM EMP06
INTERSECT
SELECT ENAME FROM EMP07;  --INTERSECT: 교집합(중복된 데이터) 보여줌

SELECT ENAME FROM EMP06
MINUS
SELECT ENAME FROM EMP07;  --MINUS: 차집합 보여줌

/*
UNION은 한번 이상 사용할 수 있다

SELECT ENAME FROM EMP06
UNION
SELECT ENAME FROM EMP07
UNION
SELECT 테이블;
*/


/*
DROP TABLE EMP08;
CREATE TABLE EMP08(
  ENO NUMBER(4), --사번
  ENAME VARCHAR2(20), --이름
  SALARY NUMBER --급여
);

INSERT INTO EMP08 VALUES(111, 'TigER', 1000000);
INSERT INTO EMP08 VALUES(711, 'TIGER', 2000000);
INSERT INTO EMP08 VALUES(311, 'CAT', 3000000);
INSERT INTO EMP08 VALUES(411, 'cat', 4000000);
INSERT INTO EMP08 VALUES(611, 'DOG', 5000000);
INSERT INTO EMP08 VALUES(511, 'Tiger', 6000000);
INSERT INTO EMP08 VALUES(811, 'CAt', 7000000);
INSERT INTO EMP08 VALUES(211, 'dog', 8000000);
INSERT INTO EMP08 VALUES(211, '오랑우탄', 9000000);
INSERT INTO EMP08 VALUES(811, 'dOG', 10000000);


SELECT UPPER(ENAME) FROM EMP08;  --대문자로 변경
SELECT LOWER(ENAME) FROM EMP08;  --소문자로 변경
SELECT INITCAP(ENAME) FROM EMP08;  --첫글자만 대문자로 변경 (INIT: Initialize)
SELECT ENAME FROM EMP08 WHERE UPPER(ENAME)='TIGER';
SELECT ENAME FROM EMP08 WHERE UPPER(ENAME) LIKE 'TI%';  --TI로 시작하는 것 찾기

SELECT LENGTH(ENAME), LENGTHB(ENAME) FROM EMP08;  --LENGTH: 글자길이 / LENGTHB: 데이터크기
SELECT * FROM EMP08 WHERE LENGTH(ENAME)<=4;



DROP TABLE EMP09;
CREATE TABLE EMP09(
  ENO NUMBER,
  TEL VARCHAR2(20)
);

INSERT INTO EMP09 VALUES(1,'010-1234-1234');
INSERT INTO EMP09 VALUES(2,'010-5678-5678');
INSERT INTO EMP09 VALUES(3,'010-9101-1121');
INSERT INTO EMP09 VALUES(4,'010-3141-5161');

SELECT SUBSTR(TEL, 5, 3) FROM EMP09;  --5번째부터 3개 추출하기
SELECT SUBSTR(TEL, 5) FROM EMP09;  --시작위치만 정해주고 끝자리 지정 안해주면 끝까지 추출
SELECT SUBSTR(TEL, 5, 3), SUBSTR(TEL, 3, 6) FROM EMP09;
--SELECT SUBSTR(TEL, 5, 3), SUBSTR(TEL, 3, 6), UPPER(ENAME) FROM EMP09;  가능







DROP TABLE EMP10;
CREATE TABLE EMP10(
  ENO NUMBER,
  TITLE VARCHAR2(20)
);

INSERT INTO EMP10 VALUES(1,'ABOUT TIME');
INSERT INTO EMP10 VALUES(2,'LALA LAND');
INSERT INTO EMP10 VALUES(3,'TENET');
INSERT INTO EMP10 VALUES(4,'변방의 호랑이');
INSERT INTO EMP10 VALUES(5,'호랑이');

SELECT SUBSTR(TITLE, 3, 5) FROM EMP10;
SELECT INSTR(TITLE,'호랑이') FROM EMP10;




DROP TABLE EMP11;
CREATE TABLE EMP11(
  TEL VARCHAR2(20)
);

INSERT INTO EMP11 VALUES('02)1234-5678');
INSERT INTO EMP11 VALUES('051)637-5678');
INSERT INTO EMP11 VALUES('031)23-7777');

SELECT SUBSTR( 
  TEL,
  1,
  INSTR(TEL, ')')-1 ) FROM EMP11;
-- 가독성




DROP TABLE EMP12;
CREATE TABLE EMP12(
  TEL VARCHAR2(40)
);

INSERT INTO EMP12 VALUES('무궁화- 꽃이 무궁화 피었습니다');
INSERT INTO EMP12 VALUES('피었습니다- 무궁화');
INSERT INTO EMP12 VALUES('피었-습니다');
INSERT INTO EMP12 VALUES('010-1111-1111');
INSERT INTO EMP12 VALUES('010-2222-2222');
INSERT INTO EMP12 VALUES('010-3333-3333');

SELECT REPLACE(TEL,'-',' ') FROM EMP12;




DROP TABLE EMP13;
CREATE TABLE EMP13(
  TEL VARCHAR2(40)
);

INSERT INTO EMP13 VALUES('CAT');
INSERT INTO EMP13 VALUES('TIGER');
INSERT INTO EMP13 VALUES('LION');

SELECT LPAD(TEL, 10, '*'), RPAD(TEL, 10, '*') FROM EMP13;  --10자리 확보해서 비어있는 자리는 *로 채워라






DROP TABLE EMP14;
CREATE TABLE EMP14(
  TEL VARCHAR2(40)
);

INSERT INTO EMP14 VALUES('800606-1234567');
INSERT INTO EMP14 VALUES('970818-2958204');
INSERT INTO EMP14 VALUES('870903-1029384');

--SELECT RPAD(TEL, 7, '*') FROM EMP14;
SELECT REPLACE(TEL,SUBSTR(TEL,8), '*******') FROM EMP14;
--SELECT REPLACE(TEL,SUBSTR(TEL,8), '*******') FROM EMP14;
--RPAD(TEL, 7, REPLACE(TEL,SUBSTR(TEL,8, '*'))

--SELECT SUBSTR(RPAD(TEL, 14), 1, 7) FROM EMP14;
 
SELECT RPAD( SUBSTR( TEL, 1, 7), 14, '*' ) FROM EMP14;





DROP TABLE EMP15;
CREATE TABLE EMP15(
  ENO NUMBER,
  NAME VARCHAR2(40)
);

INSERT INTO EMP15 VALUES(10, '코알라');
INSERT INTO EMP15 VALUES(20, '거북이');
INSERT INTO EMP15 VALUES(30, '사자');

SELECT CONCAT(NAME, '동물') FROM EMP15; 

SELECT NAME || ' : ' FROM EMP15; 
SELECT CONCAT(NAME, CONCAT(' : ', ENO)) FROM EMP15; 

SELECT CONCAT(NAME, CONCAT(' : ', ENO)) FROM EMP15; 
SELECT NAME || ' : ' || ENO FROM EMP15; 




DROP TABLE EMP16;
CREATE TABLE EMP16(
  ENO NUMBER,
  NAME VARCHAR2(40)
);

INSERT INTO EMP16 VALUES(10, ' 호랑이 ');
INSERT INTO EMP16 VALUES(20, ' 호 랑 이 ');
INSERT INTO EMP16 VALUES(20, '   호랑이');
INSERT INTO EMP16 VALUES(20, '--호-랑-이--');

SELECT TRIM(NAME) FROM EMP16;  --안에 들어있는 문자열 중에서 앞, 뒤에 스페이스 들어간거 제거해줌 (중간 스페이스는 아님)
SELECT TRIM('-' FROM NAME) FROM EMP16;  --앞,뒤 제거해줌
--EX) ID, PW 검사할 때(나도 모르게 스페이스바 눌렀을수도 있는데 그걸로 틀렸다고 할 수 있으니까)



-- 테이블로 해도 되지만 듀얼로 실습한다.
SELECT ROUND(1234.4), ROUND(1234.5) FROM DUAL;  --소수점 이하 반올림
SELECT ROUND(1234.5678, 3) FROM DUAL;  --소수점 3번째 자리까지 반올림하여 나타내라
SELECT ROUND(1235, -1) FROM DUAL;  --소수점 앞자리 영역을 마이너스(-)로 봄

SELECT TRUNC(1234.4), TRUNC(1234.5) FROM DUAL;  --반올림 안하고 소수점 이하 무조건 버림
SELECT TRUNC(1234.5678, 2) FROM DUAL;  --반올림X
SELECT TRUNC(1234, -1), TRUNC(1235, -1) FROM DUAL;

SELECT CEIL(3.14), FLOOR(3.14) FROM DUAL;  --가장 가까운 정수 찾기  
SELECT CEIL(-3.14), FLOOR(-3.14) FROM DUAL;  --음수 헷갈리지 않기

SELECT FLOOR(7/3), MOD(7,3) FROM DUAL;

SELECT 10+20, 10+'20', '10'+'20' FROM DUAL;
--SELECT 'TI'+'GER' FROM DUAL;  --(오류) 자바랑 다름
SELECT 'TI'||'GER' FROM DUAL;





DROP TABLE EMP17;
CREATE TABLE EMP17(
  ENO NUMBER,
  NAME VARCHAR2(40)
);

INSERT INTO EMP17 VALUES(null, '호랑이');
INSERT INTO EMP17 VALUES(10, null);

SELECT ENO+100, NVL(ENO, 0)+100 FROM EMP17;  --NVL(ENO, 0): NULL을 0으로 취급해서 계산해줘라
SELECT NAME, NVL(NAME, '익명') FROM EMP17;
SELECT NVL2(ENO, 777, 888) FROM EMP17;  --안에 들어있는 내용이 NULL이면 777, 아니면 888로 
SELECT NVL2(NAME, '익명', '실명') FROM EMP17;



-- DECODE: 제어문의 SWITCH와 동일하다
DROP TABLE EMP18;
CREATE TABLE EMP18(
  ENO NUMBER
);

INSERT INTO EMP18 VALUES(10);
INSERT INTO EMP18 VALUES(20);
INSERT INTO EMP18 VALUES(30);
INSERT INTO EMP18 VALUES(20);
INSERT INTO EMP18 VALUES(10);

SELECT DECODE(ENO,
10, '호랑이',
20, '코끼리',
30, '독수리') -- 10이면 '호랑이', 20이면 '코끼리', 30이면 '독수리'로 치환시켜줌
FROM EMP18;

SELECT DECODE(ENO,
10, ENO*1.2,
20, ENO*1.3,
30, ENO*1.4)  --EX) 근속년수가 10년이면 보너스를 1.2배
FROM EMP18;





DROP TABLE EMP19;
CREATE TABLE EMP19(
  DNO NUMBER,
  ENAME VARCHAR2(20),
  EYEAR NUMBER,
  SALARY NUMBER
);

INSERT INTO EMP19 VALUES(10, '일길동', 6, 100);
INSERT INTO EMP19 VALUES(20, '이길동', 12, 200);
INSERT INTO EMP19 VALUES(30, '삼길동', 18, 300);
INSERT INTO EMP19 VALUES(40, '사길동', 24, 400);
INSERT INTO EMP19 VALUES(50, '오길동', 30, 500);

--EX) 근속년수에 따라 보너스 주는 경우
SELECT DECODE(FLOOR(EYEAR/5),
0, SALARY*1.0,
1, SALARY*1.1,
2, SALARY*1.2,
3, SALARY*1.3,
4, SALARY*1.4,
5, SALARY*1.5,
6, SALARY*1.6
)
FROM EMP19;

COMMIT;
*/







--20201015
/*
DROP TABLE EMP20;
CREATE TABLE EMP20(
  ENAME VARCHAR2(20),
  SALARY NUMBER
);

INSERT INTO EMP20 VALUES('일길동',100);
INSERT INTO EMP20 VALUES('이길동',200);
INSERT INTO EMP20 VALUES('삼길동',300);
INSERT INTO EMP20 VALUES('사길동',400);
INSERT INTO EMP20 VALUES('오길동',500);

--집계함수 -> 결과가 한개이기 때문에 콤마(,)를 사용해서 필드 여려개 사용할 수 없음
--        -> WHERE절에서 사용할 수 없음
--        -> 갯수가 똑같으면 필드와 사용할 수 있음 
SELECT SUM(SALARY), COUNT(*), MAX(SALARY), MIN(SALARY), AVG(SALARY) FROM EMP20;  --합, ROW갯수, 최대/최소, 평균




DROP TABLE EMP21;
CREATE TABLE EMP21(
  ENAME VARCHAR2(20),
  ENO NUMBER,
  SALARY NUMBER
);

INSERT INTO EMP21 VALUES('일길동', 30, 100);
INSERT INTO EMP21 VALUES('이길동', 20, null);
INSERT INTO EMP21 VALUES('삼길동', 30, 300);
INSERT INTO EMP21 VALUES('사길동', 40, 300);

SELECT COUNT(*), COUNT(SALARY), COUNT(DISTINCT SALARY) FROM EMP21;  --ROW갯수/ 유효한 데이터명만 얻고싶을때/ 중복된 것을 제거한 갯수
SELECT SUM(SALARY), SUM(DISTINCT SALARY) FROM EMP21;  --모든 데이터 합/중복된 값을 제외한 SUM값
SELECT COUNT(*), SUM(SALARY) FROM EMP21 WHERE SALARY=300;
SELECT COUNT(*) FROM EMP21 WHERE SALARY IS NULL;
SELECT COUNT(*) FROM EMP21 WHERE SALARY IS NOT NULL;

--문제) 부서번호가 30번인 직원 중에서 급여가 가장 많은 사람은?
--SELECT ENAME FROM EMP21 WHERE ENO=30;
--SELECT MAX(SALARY) FROM EMP21 WHERE ENO=30;
SELECT ENAME FROM EMP21 
  WHERE ENO=30 AND SALARY = (SELECT MAX(SALARY) FROM EMP21);

--문제) 부서번호가 20인 직원들의 평균 급여는?
SELECT AVG(SALARY) FROM EMP21 WHERE ENO=30;




DROP TABLE EMP22;
CREATE TABLE EMP22(
  ENAME VARCHAR2(20),
  E_DEPT NUMBER,
  SALARY NUMBER
);

INSERT INTO EMP22 VALUES('일길동', 10, 100);
INSERT INTO EMP22 VALUES('이길동', 20, 200);
INSERT INTO EMP22 VALUES('삼길동', 10, 300);
INSERT INTO EMP22 VALUES('사길동', 20, 400);
INSERT INTO EMP22 VALUES('오길동', 10, 500);
INSERT INTO EMP22 VALUES('육길동', 30, 600);

-- ~별로, 종류별로 일때 사용되는 것이 그룹함수이다 EX)부서별로, 학과별로, 팀별로
--그룹별로 통계를 잡고 싶을 때 사용됨

SELECT E_DEPT, SUM(SALARY) --필드 갯수 같으니까 같이 쓸 수 있음
FROM EMP22
GROUP
BY E_DEPT;

SELECT E_DEPT, SUM(SALARY) 
FROM EMP22
WHERE SALARY > 300  --1차 필터링(급여가 300보다 큰것들 중에서만)
GROUP
BY E_DEPT;  --조건을 만족하는 것들에 대하여 그룹화하기

SELECT E_DEPT, SUM(SALARY)
FROM EMP22
GROUP
BY E_DEPT
HAVING SUM(salary) > 500;  --그룹화를 먼저시키고 그중에서 조건을 만족하는 그룹을 나타내기




DROP TABLE EMP23;
CREATE TABLE EMP23(
  ENAME VARCHAR2(20),
  E_DEPT NUMBER,
  SALARY NUMBER
);

INSERT INTO EMP23 VALUES('일길동', 10, 100);
INSERT INTO EMP23 VALUES('이길동', 20, 200);
INSERT INTO EMP23 VALUES('삼길동', 10, 300);
INSERT INTO EMP23 VALUES('사길동', 20, 400);
INSERT INTO EMP23 VALUES('오길동', 10, 500);
INSERT INTO EMP23 VALUES('육길동', 30, 600);
INSERT INTO EMP23 VALUES('칠길동', 10, 700);
INSERT INTO EMP23 VALUES('팔길동', 20, 800);
INSERT INTO EMP23 VALUES('구길동', 30, 900);
INSERT INTO EMP23 VALUES('십길동', 20, 500);
INSERT INTO EMP23 VALUES('십일길동', 10, 400);
INSERT INTO EMP23 VALUES('십이길동', 30, 300);

-- 급여가 500이 넘는 사람들로 부서별로 그룹화시키고, 그 중에서 급여 합이 1000이 넘는 사람의 E_DEPT와 SUM(SALARY)를 보여줘라
SELECT E_DEPT, SUM(SALARY)
FROM EMP23
WHERE SALARY > 500
GROUP
BY E_DEPT
HAVING SUM(SALARY) > 1000;




DROP TABLE EMP24;
CREATE TABLE EMP24(
  ENAME VARCHAR2(20),
  ENO NUMBER,
  SALARY NUMBER
);

INSERT INTO EMP24 VALUES('이순신', 10, 500);
INSERT INTO EMP24 VALUES('유관순', 20, 600);
INSERT INTO EMP24 VALUES('윤봉길', 20, 700);
INSERT INTO EMP24 VALUES('김구', 10, 800);


DROP TABLE EMP25;
CREATE TABLE EMP25(
  ENO NUMBER,
  NN VARCHAR2(20)
);

INSERT INTO EMP25 VALUES(10, '호랑이');
INSERT INTO EMP25 VALUES(20, '독수리');

--교차조인(CROSS JOIN)
SELECT * FROM EMP24, EMP25;  
SELECT * FROM EMP24 CROSS JOIN EMP25;

--등가조인(=INNTER JOIN)
SELECT * FROM EMP24, EMP25
WHERE EMP24.ENO = EMP25.ENO;

--자연조인 (공통된 필드 한개일때)
SELECT * 
FROM EMP24
NATURAL JOIN EMP25;

/*
첫번째 테이블: 사원번호 이름 급여 주소 부서번호
두번째 테이블: 부서번호 부서이름
=> 자연조인 => 거기에 매칭되는 부서가 쫙 나옴
*/
/*
--자연조인 (공통된 필드 여러개일때)
SELECT * 
FROM EMP24 JOIN EMP25 USING(ENO);


SELECT * FROM EMP24, EMP25
WHERE EMP24.ENO = EMP25.ENO;

SELECT E1.ENO, E2.ENO, SALARY, NN 
FROM EMP24 E1, EMP25 E2
WHERE E1.ENO = E2.ENO;

SELECT * 
FROM EMP24 E1, EMP25 E2
WHERE E1.ENO = E2.ENO;

SELECT ENO, ENAME, SALARY, NN 
FROM EMP24 E1
NATURAL JOIN EMP25 E2;

--INNER JOIN(내부조인)
SELECT * FROM EMP24 INNER JOIN EMP25
ON EMP24.ENO = EMP25.ENO;

SELECT * FROM EMP24, EMP25
WHERE EMP24.ENO = EMP25.ENO AND SALARY >= 300;  --하나의 명령이 끝나고 그 다음 명령으로 해석됨

COMMIT;
*/







--20201016
/*
DROP TABLE EMP24;
CREATE TABLE EMP24(
  ENAME VARCHAR2(20),
  ENO NUMBER,
  SALARY NUMBER
);
INSERT INTO EMP24 VALUES('이순신', 10, 500);
INSERT INTO EMP24 VALUES('유관순', 20, 600);
INSERT INTO EMP24 VALUES('윤봉길', 20, 700);
INSERT INTO EMP24 VALUES('김구', 10, 800);


DROP TABLE EMP25;
CREATE TABLE EMP25(
  ENO NUMBER,
  NN VARCHAR2(20)
);
INSERT INTO EMP25 VALUES(10, '호랑이');
INSERT INTO EMP25 VALUES(20, '독수리');


SELECT * FROM EMP24, EMP25; --교차조인

SELECT *
FROM EMP24, EMP25
WHERE EMP24.ENO = EMP25.ENO; --등가조인

SELECT *
FROM EMP24, EMP25
WHERE EMP24.ENO = EMP25.ENO AND  --WHERE 뒤에 들어오는 것은 조인의 조건을 설정한다
SALARY >= 200; --일반조건, AND논리로 생각하면 안됨(위에서 나온 최종 결과를 필터링하는 조건)

SELECT *
FROM EMP24 INNER JOIN EMP25
ON EMP24.ENO = EMP25.ENO AND
SALARY >= 200; --(위에 코드랑 같은 결과), 내부조인 -> 등가조인은 내부조인이다

SELECT *
FROM EMP24 JOIN EMP25
ON EMP24.ENO = EMP25.ENO AND
SALARY >= 200; --INNER 생략 가능

SELECT *
FROM EMP24, EMP25
WHERE EMP24.ENO = EMP25.ENO;

SELECT *
FROM EMP24 
NATURAL JOIN EMP25;

SELECT *
FROM EMP24 
NATURAL JOIN EMP25
WHERE SALARY >= 200;

SELECT *
FROM EMP24 
JOIN EMP25 USING(ENO) --공통된 필드가 한개 이상일때
WHERE SALARY >= 200;

COMMIT;
*/






--20201019
/*
DROP TABLE EMP26;
CREATE TABLE EMP26(
  ID VARCHAR2(20),
  NAME VARCHAR2(20)
);
INSERT INTO EMP26 VALUES('1', 'TIGER1');
INSERT INTO EMP26 VALUES('2', 'TIGER2');
INSERT INTO EMP26 VALUES('3', 'TIGER3');
INSERT INTO EMP26 VALUES('4', 'TIGER4');
INSERT INTO EMP26 VALUES('5', 'TIGER5');


DROP TABLE EMP27;
CREATE TABLE EMP27(
  ID VARCHAR2(20),
  AGE NUMBER
);
INSERT INTO EMP27 VALUES('3', 30);
INSERT INTO EMP27 VALUES('4', 40);
INSERT INTO EMP27 VALUES('5', 50);
INSERT INTO EMP27 VALUES('6', 60);
INSERT INTO EMP27 VALUES('7', 70);


SELECT * FROM EMP26, EMP27 WHERE EMP26.ID = EMP27.ID; --등가조인

SELECT * FROM EMP26, EMP27 WHERE EMP26.ID = EMP27.ID (+); --LEFT OUTER JOIN: 왼쪽에 있는 테이블은 조인 안되도 그냥 다 보여줌
SELECT * FROM EMP26 LEFT OUTER JOIN EMP27 USING (ID);

SELECT * FROM EMP26, EMP27 WHERE EMP26.ID (+) = EMP27.ID; --RIGHT OUTER JOIN: 오른쪽에 있는 테이블은 조인 안되도 다 보여줌
SELECT * FROM EMP26 RIGHT OUTER JOIN EMP27 USING (ID);
*/

/*
DROP TABLE EMP28;
CREATE TABLE EMP28(
  NAME VARCHAR2(20),
  AGE NUMBER
);

INSERT INTO EMP28 VALUES('호랑이', 20); --CRUD 중에서 C에 해당

SELECT * FROM EMP28; --R에 해당

UPDATE EMP28
SET AGE = 30
WHERE NAME = '호랑이'; --U: UPDATE

DELETE EMP28; --D: DELETE
SELECT * FROM EMP28;
*/




--Project
--DROP TABLE PROJECT01;

--CREATE TABLE PROJECT01 (
--  NAME VARCHAR2(20),
--  AGE NUMBER,
--  SALARY NUMBER
--);
----
--INSERT INTO PROJECT01 VALUES('황원정', 24, 500);
--INSERT INTO PROJECT01 VALUES('황원정', 24, 500);
--
--SELECT * FROM PROJECT01;



--COMMIT;





/*
DROP TABLE PROJECT02;

CREATE TABLE PROJECT02(
  NAME VARCHAR2(20),
  AGE NUMBER
);    --CREATE

INSERT INTO PROJECT02 VALUES('황원정', 20);
INSERT INTO PROJECT02 VALUES('황원준', 30);
INSERT INTO PROJECT02 VALUES('황원전', 40);

SELECT * FROM PROJECT02;    --SELECT

UPDATE PROJECT02 
SET AGE = 75 
WHERE NAME = '황원정';      --UPDATE
SELECT * FROM PROJECT02;   

DELETE PROJECT02;          --DELETE
SELECT * FROM PROJECT02;  
*/


/*
DROP TABLE TAB11;

CREATE TABLE TAB11(
  NAME VARCHAR(20),
  AGE NUMBER,
  SALARY NUMBER
); --C

INSERT INTO TAB11 VALUES('황원정', 5, 500);
INSERT INTO TAB11 VALUES('황원종', 7, 700);
INSERT INTO TAB11 VALUES('황원장', 3, 300);


UPDATE TAB11
SET SALARY = 550
WHERE AGE = 3; --U

DELETE TAB11; --D

SELECT * FROM TAB11; --R
*/






--DROP TABLE TAB12;
--
--CREATE TABLE TAB12(
--  NO NUMBER,
--  NAME VARCHAR2(20),
--  AGE NUMBER,
--  SALARY NUMBER
--);
--
--INSERT INTO TAB12 VALUES(137, '황원정1', 20, 500);
--INSERT INTO TAB12 VALUES(182, '황원정2', 30, 550);
--INSERT INTO TAB12 VALUES(94, '황원정3', 40, 590);
--INSERT INTO TAB12 VALUES(39, '황원정4', 50, 510);
--INSERT INTO TAB12 VALUES(145, '황원정5', 60, 580);
--
--SELECT * FROM TAB12;
--
--UPDATE TAB12
--SET NAME = '원숭이'
--WHERE AGE = 50;
--
--UPDATE TAB12
--SET SALARY = 888
--WHERE NAME = '황원정5';
--
--SELECT * FROM TAB12;
--
--SELECT COUNT(*) FROM TAB12;
--
--SELECT AGE AS 나이 FROM TAB12;
--
--SELECT (NAME||AGE) AS 이름나이 FROM TAB12;
--
----DELETE FROM TAB12 WHERE AGE = 30;
--
----SELECT * FROM TAB12;
--
----DELETE TAB12;
--
----SELECT * FROM TAB12;
--
--SELECT * FROM TAB12 ORDER BY NO ASC;
--SELECT * FROM TAB12 ORDER BY SALARY DESC;
--SELECT * FROM TAB12 WHERE SALARY >= 550;
--SELECT * FROM TAB12 WHERE SALARY != 500;
--SELECT * FROM TAB12 WHERE SALARY ^= 500;
--SELECT * FROM TAB12 WHERE SALARY <> 500;
--
--SELECT NAME AS 이름 FROM TAB12 WHERE NAME LIKE '황%';
--
--
--SELECT * FROM TAB12 WHERE SALARY >ANY(530, 550, 800);
--SELECT * FROM TAB12 WHERE SALARY <ANY(530, 550, 800);
--SELECT * FROM TAB12 WHERE SALARY >ALL(530, 550, 800);
--SELECT * FROM TAB12 WHERE SALARY <ALL(530, 550, 800);







--
--DROP TABLE TAB13;
--
--CREATE TABLE TAB13(
--  ADDRESS VARCHAR(20)
--);
--
--INSERT INTO TAB13 VALUES('서울');
--INSERT INTO TAB13 VALUES('대전');
--INSERT INTO TAB13 VALUES('대구');
--INSERT INTO TAB13 VALUES('부산');
--
--SELECT * FROM TAB12, TAB13;



--
--DROP TABLE EMP13;
--CREATE TABLE EMP13(
--  TEL VARCHAR2(40)
--);
--
--INSERT INTO EMP13 VALUES('CAT');
--INSERT INTO EMP13 VALUES('TIGER');
--INSERT INTO EMP13 VALUES('LION');
--
--SELECT LPAD(TEL, 10, '*'), RPAD(TEL, 10, '*') FROM EMP13;  --10자리 확보해서 비어있는 자리는 *로 채워라







DROP TABLE STUDY;

CREATE TABLE STUDY(
  NAME VARCHAR2(20),
  AGE NUMBER,
  SALARY NUMBER
);

INSERT INTO STUDY VALUES('황원정', 20, 500);
INSERT INTO STUDY VALUES('황원정1', 30, 600);
INSERT INTO STUDY VALUES('황원정2', 40, 700);
INSERT INTO STUDY VALUES('황원정3', 50, 800);
INSERT INTO STUDY VALUES('황원정4', 60, 900);
INSERT INTO STUDY VALUES('황원정5', 60, 900);
INSERT INTO STUDY VALUES('황원정6', 60, 900);
INSERT INTO STUDY VALUES('황원정7', 60, 900);

commit;















