load data
infile deptbb02_data.csv
replace into table deptbb02
fields terminated by ','
(deptno,dname,restaurant,location,motto)
