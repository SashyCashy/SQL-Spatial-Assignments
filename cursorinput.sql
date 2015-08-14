set echo on;
set serveroutput on;
declare
 cursor c(deptno number) is
 select * from empbb02 
 where empbb02.deptno=deptno;
 rec empbb02%rowtype;
 begin
  for rec in c(10) loop
  dbms_output.put_line( rec.ename );
  end loop;
 end;
 /
