load data
infile infobb02_data.csv
replace into table infobb02
fields terminated by ','
(empno,fname,nick,uni,average,era)
