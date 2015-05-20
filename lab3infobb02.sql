spool infobb02_data.csv;

--Select statement enables to select the data and put it in the 
--csv file.

select empno||','||nvl(fname,'No Fname')||','||nvl(nick,'No Nick')||','||uni||','||average||','||era from infobb02;

spool off;


