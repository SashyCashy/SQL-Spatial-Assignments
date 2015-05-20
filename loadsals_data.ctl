load data
infile salsbb02_data.csv
replace into table salsbb02
fields terminated by ','
(grade,role,losal,hisal)
