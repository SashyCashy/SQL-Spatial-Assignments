spool empbb02_data.csv;

--Select statement enables to select the data and put it in the 
--csv file.

select empno||','||ename||','||pos||','||boss||','||hiredate||','||sal||','||deptno||','||nvl(incentives,0)   from empbb02;

spool off;


