load data
infile empbb02_data.csv
replace into table empbb02
fields terminated by ','
(empno,ename,pos,boss,hiredate,sal,deptno,incentives)
