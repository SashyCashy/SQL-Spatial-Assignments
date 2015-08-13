set echo on;
set serveroutput on;

declare
 empname empbb02.ename%type;
 empmgr empbb02.boss%type;
 empsal empbb02.sal%type;
 begin
  select emp.ename,emp.boss,emp.sal into
  empname,empmgr,empsal
  from empbb02 emp
  where emp.empno = 755;
  dbms_output.put_line(empname);
 end;
 /
