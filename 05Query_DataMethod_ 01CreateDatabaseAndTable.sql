-- �������ݿ�
create database Student;
go 

-- ʹ�����ݿ�/�л����ݿ�
use Student;
go

-- �����༶��
Create table ClassInfo
(
	id int primary key identity,
	[name] varchar(30) not null,
	college varchar(20) not null
)
go

-- ����ѧ����
Create table StudentInfo
(
	stuId char(10) primary key,
	stuName varchar(20) not null,
	classId int foreign key references ClassInfo(id) on delete cascade on update cascade not null,
	stuPhone char(11) not null,
	stuSex char(2) check(stuSex in ('��','Ů')),
	stuBirthday dateTime not null
)
go

-- �ɼ���
create table StudentScore
(
	id int primary key identity,
	stuId char(10) foreign key references StudentInfo(stuId) on delete cascade on update cascade not null,
	courseName varchar(20) not null,
	theoryScore int not null,
	skillScore int not null
)
go