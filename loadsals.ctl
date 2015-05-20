load data
infile salsbb02_data.csv
replace into table sals04
fields terminated by ','
(grade,role,losal,hisal)
