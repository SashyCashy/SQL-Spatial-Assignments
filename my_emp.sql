set echo on;
set serveroutput on;
declare
	my_emp empbb02%rowtype;
	begin
		select * into my_emp
		from empbb02
		where empbb02.empno=755;
		dbms_output.put_line('The name is ' || my_emp.ename);
	end;
/
