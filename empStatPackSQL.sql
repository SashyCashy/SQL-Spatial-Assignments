set echo on;
set serveroutput on;
DECLARE
 i number := 0;
 j number := 0;
BEGIN
 <<Outer>>
 Loop
  i := i+1;
  <<Inner>>
  Loop
   i:=i+1;
   j:=j+1;
   Exit Outer when j = 4;
  End loop;
 End loop;
 DBMS_OUTPUT.PUT_LINE('i = ' || i || ' and j is ' || j);
 End;
 /
