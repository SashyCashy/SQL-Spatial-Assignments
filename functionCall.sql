set echo on;
set serveroutput on;
variable deptname varchar2(10);
variable sal number;
execute :deptname := functionPrototype('lasorda',:sal);
print deptname;
/
