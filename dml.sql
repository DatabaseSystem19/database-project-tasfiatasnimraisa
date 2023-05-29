
-- add,rename,delete collumn
alter table department add location char(20);
alter table department modify location varchar(23);
alter table department rename column location to location2;
alter table department drop column location2;


select * from hospital_branch;
select * from department;
select * from physician;
select * from patient;
select * from appointment;

--query

select dept_name from department where branch_no='1';
select dept_name from department where branch_no='2';
select dept_name from department where branch_no='3';
select p_name from patient where p_id=(select p_id from appointment where app_si=400);
select p_id from appointment where app_date='2023-11-11';

--update row,delete row
update appointment set app_date='2023-11-13' where app_date='2023-11-14';
delete from  hospital_branch where branch_no=11;



WITH max_total_doc AS (
  SELECT MAX(total_doc) AS max_doc
  FROM department
)
SELECT *
FROM department, max_total_doc
WHERE department.total_doc = max_total_doc.max_doc;


--aggregate FUNCTION
select count(*) from department;
select count(distinct dept_name) as number_of_dept from department;
select avg(total_doc) from department;
select sum(total_doc) from department;
select gender,avg(age) from patient group by gender;
select gender,avg(age) from patient group by gender having avg(age)>30;

--nested subquery
select p_name from patient where p_id in(SELECT p_id from appointment where app_date='2023-11-11');
select p_name from patient where p_id in(SELECT p_id from appointment where app_date='2023-11-11' and doc_code=1);
select p_name from patient where gender='FEMALE' and p_id in (select p_id from appointment where app_date='2023-11-11' );

select age from patient where age> all(select age from patient where age<40);
select age from patient where age> some(select age from patient where age>40);

SELECT * FROM patient WHERE p_name LIKE 'R%';


--join
select * from patient natural join appointment;
select * from patient natural join appointment where p_id=58;
select * from patient join appointment using(p_id);
select * from patient left outer join appointment using(p_id);
select * from patient right outer join appointment using(p_id);
select * from patient full outer join appointment using(p_id);
