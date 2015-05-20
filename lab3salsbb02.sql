spool salsbb02_data.csv;

--Select statement enables to select the data and put it in the 
--csv file.

select grade||','||role||','||losal||','||hisal from salsbb02;

spool off;


