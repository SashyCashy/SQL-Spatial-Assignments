 set echo on;
 set serveroutput on;
 declare
 x number := &input;
 out varchar2(30);

 begin
 	case when x = 1 then out := 'one';
	else out := 'default value';
	end case;
 dbms_output.put_line(out);
 end;
 /
 
