set pages 300;
set echo on;
spool on;
--1.Make empno the primary key of both empbb02 and infobb02.
--Make deptno the primary key for deptbb02.Create an appropriate two
--column key for salsbb02.Use the naming convention for
--all constraints in Lab2, that was given in class.

alter table empbb02 add constraint empbb02_empno_pk PRIMARY KEY(empno);
alter table infobb02 add constraint infobb02_empno_pk PRIMARY KEY (empno);
alter table salsbb02 add constraint salsbb02_grade_role_pk PRIMARY KEY (grade,role);
alter table deptbb02 add constraint deptbb02_deptno_pk PRIMARY KEY (deptno);

--2. Check your primary key for deptbb02 by attempting to add a new dept. 
--name with a duplicate deptno.

insert into deptbb02 values (20,'Security','Bawarchi','Miramar','Let the play begin!');

--3.Add a unique constraint for ename in empbb02.
alter table empbb02 add constraint empbb02_ename_uk unique(ename);

--4.The team has decided that, except for the gm and catchers, a player
--name should not exceed 10 letters.  Implement this as a check constraint.

alter table empbb02 add constraint empbb02_ename_ck check (length(ename) <=10 or pos in ('gm','catcher'));

--5(a) Change the length constraint on ename to 15 using an ALTER TABLE command

alter table empbb02 modify ename varchar(15);

-- 5(b) Violate the constraint in 4. to make sure you did it correctly,
-- by trying to add a Hall of Fame player whose name exceeds length 10.

insert into empbb02 values (1,'Alexander.C','pitcher',712,'01-Jan-97',1000,10,0);

--6.Make empno a foreign key in infobb02, with parent table empbb02

alter table infobb02 add constraint infobb02_empno_fk foreign key(empno) references empbb02 (empno);

-- 7.  Make depno a foreign key in empbb02, with parent table deptbb02

alter table empbb02 add constraint empbb02_deptno_fk foreign key  (deptno) references deptbb02(deptno);

--8.  Test one of your foreign key constraints to make sure it is working.
--Test it in two ways, one of which is attempting to delete a parent table.

drop table deptbb02; 

insert into infobb02 values(850,'xyz','abc',60,0,0);

--9.Display ename, pos, hiredate from empbb02 for all employees not in 
--department 50.  Make the column headers Last Name, Position, Date Hired.
--Show dollar signs and commas for salary, and show zero cents for
--each salary, without changing the data.

select ename as "Last Name",pos as "Position",hiredate as "Date Hired",to_char(sal,'$99,999,900.00') as "Salary" from empbb02 where not deptno=50;

--10.  Describe the meta-table user_constraints, and notice the first
--five fields.  Display your constraints, using these five fields.

desc user_constraints;

select owner,constraint_name,constraint_type,table_name,search_condition from user_constraints;

--11.Drop the check constraint that you made earlier.
alter table empbb02 drop constraint empbb02_ename_ck;

--12.The boss makes a new year's resolution to send anniversary cards 
--once a month to the appropriate employees.  Display enames and hiredates
--of all players who were hired in the month of January.   Your code
--should work tomorrow even if you trade two thirds of the team tonight.


select ename,hiredate from empbb02 where pos not in ('gm','coach')and hiredate like '__-JAN%';

--13.The boss wants to create a security department with deptno 60.  A guy
--named Mongo is a one man force, so add him to the dept.  He has a perfect
--record, so his batting average will be 1000, and his uniform number 007.
--Mongo has no first name or nickname, and the hiredate can be given by 
--SYSDATE.  Find his department a good Latin motto, and create values for
--other fields with similar creativity, but some discretion.  Mongo is not
--big on levity.

 insert into deptbb02 values (60,'Security','Bawarchi','Lo Jolla','a bene placito');
 insert into empbb02 values(007,'Mongo','pitcher',712,to_char(sysdate,'dd-month-yy'),0,60,0);
insert into infobb02 values(007,'','',99,1000,0);

--14. Add a constraint that a department number must be evenly divisible 
   -- by 10. 
 alter table deptbb02 add constraint deptbb02_deptno_ck check ((deptno/10)>= ceil(deptno/10));
set echo off;
spool off; 
