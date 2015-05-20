create table empbb02 (EMPNO VARCHAR2(5),
ENAME VARCHAR2(10) NOT NULL, 
POS VARCHAR2(12),
BOSS VARCHAR2(4),
HIREDATE DATE,
SAL NUMBER(6),
DEPTNO NUMBER(2),
INCENTIVES NUMBER(6));

create table infobb02(EMPNO VARCHAR2(5),
FNAME VARCHAR2(10),
NICK VARCHAR2(15),
UNI VARCHAR2(4),
AVERAGE NUMBER(4),
ERA NUMBER(6,3));

create table deptbb02(DEPTNO NUMBER(3),
DNAME VARCHAR2(8),
RESTAURANT VARCHAR2(15),
LOCATION VARCHAR2(15),
MOTTO VARCHAR2(30));

create table salsbb02(GRADE NUMBER(2),
ROLE VARCHAR2(8),
LOSAL NUMBER(6),
HISAL NUMBER(6));