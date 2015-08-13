set echo on;
set serveroutput on;
declare
 b1 boolean := False;
 b2 boolean := False;
 b3 boolean := True;
Begin
 b2 := b2 and b3;

 If b2 = True then
 	Dbms_output.put_line('b2 is true');

 elsif b2 = false then
 	Dbms_output.put_line('b2 is false');

 else
 	Dbms_output.put_line('b3 is null');
 end if;
end;
/

