spool deptbb02_data.csv;

--Select statement enables to select the data and put it in the 
--csv file.

select deptno||','||dname||','||restaurant||','||location||','||motto  from deptbb02;

spool off;


