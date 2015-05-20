--spool empStatsbb02.dat
set serveroutput on
set echo on
set pages 100
ACCEPT name PROMPT 'Please enter the last name: '
DECLARE
  average NUMBER;
  era NUMBER;
  lastName empbb02.ename%TYPE;
  BEGIN
  lastName := '&name';
  second(lastName,era,average);
  DBMS_OUTPUT.PUT_LINE(lastName||' has an era of '||era||' and an average of '||average||'.');
  EXCEPTION
WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('The last name does not exists!');
 
END;
 .
/
