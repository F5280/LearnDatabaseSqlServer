CREATE DATABASE Enterprise
ON  PRIMARY 
( 
	NAME = 'enterprise', 
	FILENAME = 'E:\DataBases\Enterprise.mdf', 
	SIZE = 8192KB , 
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 65536KB 
)
LOG ON 
( 
	NAME = 'Enterprise_log', 
	FILENAME = 'E:\DataBases\Enterprise_log.ldf', 
	SIZE = 8192KB , 
	MAXSIZE = 2048GB , 
	FILEGROWTH = 65536KB 
)
GO
-----------------------------------------
use Enterprise
go

-- �������ű�
create table Dept
(
	id int primary key identity,
	deptName varchar(50) not null unique
)

-- ����Ա����
create table Staff
(
	id int primary key identity,
	staffName varchar(50) not null unique,
	sex char(4) not null default '��',
	age tinyint not null default 18,
	salary decimal(10,2) not null default 10,
	deptId int not null foreign key references Dept(id)
)