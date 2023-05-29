drop table appointment;
drop table patient;

drop table physician;
drop table department;
drop table hospital_branch;




create table hospital_branch(
branch_no number,
location char(60),
contact_no number,
email varchar(40),
PRIMARY KEY(branch_no));



create table department(
dept_id number,
dept_name varchar(30),
total_doc number,
dept_head char(60),
branch_no number,
PRIMARY KEY(dept_id),
FOREIGN KEY(branch_no) REFERENCES hospital_branch);


create table physician(
doc_code number,
doc_name varchar(30),
dept_id number,
designation char(60),
contact_no number,
PRIMARY KEY(doc_code),
FOREIGN KEY(dept_id) REFERENCES department);

create table patient(
p_id number,
p_name varchar(30),
gender char(20),
age number,
weight number,
PRIMARY KEY(p_id));

create table appointment(
app_si number,
app_date varchar(40),
app_time varchar(20),
p_id number,
doc_code number,
PRIMARY KEY(app_si),
FOREIGN KEY(doc_code) REFERENCES physician,
FOREIGN KEY(p_id) REFERENCES patient);


insert into hospital_branch values (1,'mirpur_1',123,'popular_mirpur1');
insert into hospital_branch values (2,'mirpur_10',456,'popular_mirpur10');
insert into hospital_branch values (3,'shantinagar',789,'popular_shantinagar');
insert into hospital_branch values (4, 'dhanmondi', 987, 'popular_dhanmondi');
insert into hospital_branch values (5, 'uttara', 654, 'popular_uttara');
insert into hospital_branch values (6, 'gulshan', 321, 'popular_gulshan');
insert into hospital_branch values (7, 'bashundhara', 159, 'popular_bashundhara');
insert into hospital_branch values (8, 'mohammadpur', 753, 'popular_mohammadpur');
insert into hospital_branch values (9, 'banani', 852, 'popular_banani');
insert into hospital_branch values (10, 'malibagh', 951, 'popular_malibagh');
insert into hospital_branch values (11, 'abc', 951, 'popular_malibagh');


insert into department values(1,'dental',10,'MR.RASHID',1);
insert into department values(2,'neurology',5,'MR.HUMAYAN',2);
insert into department values(3,'cardiology',8,'DEVI_SHETTY',3);
insert into department values(4, 'orthopedics', 6, 'DR. AHMED', 1);
insert into department values(5, 'gynecology', 7, 'DR. FARAH', 2);
insert into department values(6, 'pediatrics', 4, 'DR. KHAN', 3);
insert into department values(7, 'dermatology', 3, 'DR. ALI', 1);
insert into department values(8, 'ophthalmology', 5, 'DR. SANA', 2);
insert into department values(9, 'dental', 6, 'DR. HASSAN', 3);
insert into department values(10, 'general surgery', 9, 'DR. NAZIM', 1);

insert into physician values(1,'MR.HABIB',1,'PROFESSOR',1456);
insert into physician values(2,'MR.SHAMIM',2,'ASSOCIATE_PROFESSOR',57656);
insert into physician values(3,'MR.LIMON',2,'PROFESSOR',5456);
insert into physician values(4, 'DR. FARHAN', 3, 'ASSOCIATE_PROFESSOR', 9874);
insert into physician values(5, 'DR. SARA', 1, 'CONSULTANT', 2547);
insert into physician values(6, 'DR. RAHIM', 1, 'PROFESSOR', 6325);
insert into physician values(7, 'DR. ZARA', 2, 'CONSULTANT', 9852);
insert into physician values(8, 'DR. KAMAL', 3, 'PROFESSOR', 3654);
insert into physician values(9, 'DR. NISHA', 1, 'ASSISTANT_PROFESSOR', 7452);
insert into physician values(10, 'DR. SAIF', 2, 'CONSULTANT', 2356);

insert into patient values(18,'RAISA','FEMALE',22,53.5);
insert into patient values(28,'bristy','FEMALE',28,63.5);
insert into patient values(38,'habib','MALE',21,78);
insert into patient values(48, 'John', 'MALE', 35, 82.5);
insert into patient values(58, 'Emily', 'FEMALE', 42, 61.2);
insert into patient values(68, 'Michael', 'MALE', 20, 95.8);
insert into patient values(78, 'Sophia', 'FEMALE', 29, 55.3);
insert into patient values(88, 'Daniel', 'MALE', 47, 76.9);
insert into patient values(98, 'Olivia', 'FEMALE', 19, 48.7);
insert into patient values(108, 'James', 'MALE', 65, 89.2);


insert into appointment values(400,'2023-11-11','3.00pm',18,1);
insert into appointment values(401,'2023-11-12','4.00pm',28,2);
insert into appointment values(402,'2023-11-11','3.00pm',38,3);
insert into appointment values(403, '2023-11-13', '10.00am', 48, 1);
insert into appointment values(404, '2023-11-14', '11.00am', 58, 5);
insert into appointment values(405, '2023-11-15', '2.00pm', 68, 6);
insert into appointment values(406, '2023-11-16', '9.00am', 78, 7);
insert into appointment values(407, '2023-11-17', '1.00pm', 88, 8);
insert into appointment values(408, '2023-11-18', '4.00pm', 98, 9);
insert into appointment values(409, '2023-11-19', '2.30pm', 108, 1);
insert into appointment values(410, '2023-11-11', '2.30pm', 108, 1);
