Create schema sms;
USE sms;
create table admin(
username varchar(25) primary key,
password varchar(25)
);
Insert into admin values('021-21-0076','sooraj');

CREATE TABLE teacher(
t_id INT auto_increment ,
t_name VARCHAR(25) NOT NULL,
t_email VARCHAR(45) NOT NULL  unique ,
phone_number VARCHAR(11) NOT NULL,
qualification VARCHAR(25) NOT NULL,
password VARCHAR(25) NOT NULL,
join_date  DATE NOT NULL,
salary integer NOT NULL,
 primary key (t_id)
);
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('1013','Sajid' ,'sajid@gmail.com','03082545395','Phd','sajid',CURRENT_DATE(),5000 );
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('1014','Aqib' ,'aqib@gmail.com','03082545425','Phd','Aqib',CURRENT_DATE(),5000 );
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('1015','Masood' ,'masood@gmail.com','03082541495','Phd','Masood',CURRENT_DATE(),5000 );
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('101','Sooraj' ,'sooraj1@gmail.com','03082545495','Phd','sooraj',CURRENT_DATE(),5000 );
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('Shaharyar' ,'shaharyar@gamil.com','03082543495','Enter','sooraj',CURRENT_DATE(),5000 );
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('Abdul Sami' ,'sami@gamil.com','03082546495','Enter','shaharyar',CURRENT_DATE(),5000 );
INSERT INTO teacher (t_id,t_name ,t_email,phone_number,qualification,password,join_date , salary) VALUES ('Danish' ,'danish@gamil.com','03022545495','Enter','danishmangi',CURRENT_DATE(),5000 );

CREATE TABLE resigned_teacher(
t_id INT  ,
t_name VARCHAR(25) ,
t_email VARCHAR(45) ,
phone_number VARCHAR(11) ,
qualification VARCHAR(25) ,
join_date  DATE ,
salary integer ,
resign_date DATE,
foreign key (t_id) references teacher(t_id) 
on update cascade on delete set null
);

INSERT INTO resigned_teacher (t_id ,t_name,t_email,phone_number,qualification,join_date , salary,resign_date)  VALUES (100 , 'Danish' ,'danishmangi','03079149315','Enter',CURRENT_DATE(),5000 ,CURRENT_DATE() );
INSERT INTO resigned_teacher (t_id ,t_name,t_email,phone_number,qualification,join_date , salary,resign_date) VALUES (112 , 'Shoaib' ,'shoaibali','03079149315','Enter',CURRENT_DATE(),5000 ,CURRENT_DATE() );
INSERT INTO resigned_teacher (t_id ,t_name,t_email,phone_number,qualification,join_date , salary,resign_date) VALUES (111 , 'Musawer' ,'musawer','03079149315','Enter',CURRENT_DATE(),5000 , CURRENT_DATE() );

create table Grade(
grade varchar(10) primary key ,
room INt unique check(room>=1 AND room <=16 ),
t_id int ,
foreign key (t_id) references teacher(t_id) on delete set null,
subject1 varchar(15) ,
subject2 varchar(15) ,
subject3 varchar(15) 
);
alter table Grade Add column subject4 varchar(15);
insert Into grade (grade ,room,t_id,subject1,subject2,subject3) value ( 'One A', 1, 100,'English','Mathematics','Sindhi', 'Urdu');
insert Into grade (grade ,room,t_id,subject1,subject2,subject3)  value ( 'One B', 2, 110,'English','Mathematics','Sindhi', 'Urdu' );
insert Into grade (grade ,room,t_id,subject1,subject2,subject3)  value ( 'Two A', 3, 103,'English 2','Mathematics 2','Sindhi 2', 'Urdu 2' );
insert Into grade (grade ,room,t_id,subject1,subject2,subject3)  value ( 'Two B', 4, 106,'English 2','Mathematics 2','Sindhi 2', 'Urdu 2' );
insert Into grade (grade ,room,t_id,subject1,subject2,subject3)  value ( 'Three A', 5, 106,'English 2','Mathematics 2','Sindhi 2', 'Urdu 2' );

CREATE TABLE student(
s_id INT auto_increment,
s_name VARCHAR(25) NOT NULL,
s_email VARCHAR(45) NOT NULL  ,
phone_number VARCHAR(11) NOT NULL,
grade varchar(10) ,
Admission_date  DATE ,
 primary key (s_id)
);
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1002 , 'asif' ,'asif@gmail.com','030791549315','One A',CURRENT_DATE());
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1002 , 'Suresh' ,'suresh@gmail.com','030791549315','One A',CURRENT_DATE());
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1002 , 'Aqib' ,'aqib@gmail.com','030791549315','One A',CURRENT_DATE());
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1002 , 'salam' ,'salam@gmail.com','030791549315','One A',CURRENT_DATE());
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1002 , 'Sami' ,'sami@gmail.com','030791549315','One A',CURRENT_DATE());
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1010 , 'Ahmed Ali' ,'aa@gmail.com','03079149315','Three A',CURRENT_DATE());
INSERT INTO student (s_id,s_name,s_email,phone_number,grade,Admission_date) VALUES (1011 , 'Akbar' ,'akbar@gmail.com','03079149315','Three A',CURRENT_DATE());

Create Table exam(
exam_id int auto_increment primary key,
`date` Date
);
INsert into exam value(10000, current_date()) ;

Create table marks(

s_id int ,
exam_id int ,
sub1 int default 0 ,
sub2 int default 0,
sub3 int default 0,
sub4 int default 0,
foreign key (s_id) references student(s_id),
foreign key (exam_id) references exam(exam_id),
primary key (s_id , exam_id)
);

SELECT * FROM  student natural join grade where t_id =103;
SELECT * FROM  student natural join grade where t_id =106;
SELECT * FROM  student natural join grade where t_id =107;
insert into  marks (s_id ,exam_id)  values (1001 ,10000);
select *From marks;
Select *From marks where s_id = 1016 AND exam_id = 10002;
SELECT * FROM  student natural join grade  natural join marks natural join exam where t_id = 100;
SELECT * FROM  student natural join grade  natural join marks natural join exam where t_id = 105;
SELECT * FROM  student natural join grade  natural join marks natural join exam where t_id = 106;
SELECT * FROM  student natural join grade  natural join marks natural join exam where t_id = 107;