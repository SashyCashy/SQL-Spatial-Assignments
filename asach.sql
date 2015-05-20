spool empStatsbb02b.dat
set serveroutput on
set echo on
set pages 100

CREATE OR REPLACE PROCEDURE infoStatsbb02(
  enames IN empbb02.ename%TYPE,
  avg OUT NUMBER,   
  era OUT NUMBER) AS
BEGIN
  SELECT infobb02.average,infobb02.era
  INTO avg,era       
  FROM infobb02
  WHERE infobb02.empno = (select empbb02.empno from empbb02 where empbb02.ename = enames);
END;
.
/

VARIABLE avg NUMBER
VARIABLE era NUMBER
VARIABLE name VARCHAR2(10)
BEGIN
  :name:='minoso';

  infoStatsbb02(:name,:avg,:era);
  DBMS_OUTPUT.PUT_LINE(:name || ' has an era of '||nvl(:era,0)||
    ' and the average is '||nvl(:avg,0));
END; 
/
