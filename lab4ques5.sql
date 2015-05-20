CREATE or REPLACE TRIGGER hire_trigger
AFTER INSERT ON empbb02
FOR EACH ROW
BEGIN 
INSERT INTO newhires 
VALUES 
(:new.empno, 
 :new.ename, 
 :new.hiredate); 
END; 

/ 

insert into empbb02 values(2,'sashank','dsad','xxx','01-Jan-2015',10,20,12);
insert into empbb02 values(3,'akhil','dsad','xxx','01-Jan-2015',10,30,12);
insert into empbb02 values(4,'reet','dsad','xxx','01-Jan-2015',10,40,12);

select * from empbb02;
select * from newhires;