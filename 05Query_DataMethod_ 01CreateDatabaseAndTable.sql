-- 创建数据库
create database Student;
go 

-- 使用数据库/切换数据库
use Student;
go

-- 创建班级表
Create table ClassInfo
(
	id int primary key identity,
	[name] varchar(30) not null,
	college varchar(20) not null
)
go

-- 创建学生表
Create table StudentInfo
(
	stuId char(10) primary key,
	stuName varchar(20) not null,
	classId int foreign key references ClassInfo(id) on delete cascade on update cascade not null,
	stuPhone char(11) not null,
	stuSex char(2) check(stuSex in ('男','女')),
	stuBirthday dateTime not null
)
go

-- 成绩表
create table StudentScore
(
	id int primary key identity,
	stuId char(10) foreign key references StudentInfo(stuId) on delete cascade on update cascade not null,
	courseName varchar(20) not null,
	theoryScore int not null,
	skillScore int not null
)
go