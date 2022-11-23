use Student;
go

-- top的使用
-- 1、取前5条数据
select 
	top 5 *
from 
	StudentInfo
go

-- 2、取前百分之70的数据
select 
	top 70 percent *
from
	StudentInfo
go

-- 查询年龄大于30岁的学生
select 
	*
from 
	StudentInfo
where
	(YEAR(GETDATE())-YEAR(stuBirthday)) > 25
go

-- 查询学生的姓名、性别、年龄(取别名)
select
	stuName as '姓名',
	stuSex as '性别',
	(Year(getdate())-Year(stuBirthday)) as 年龄
from
	StudentInfo
go

-- 查询90后的女生
select
	*
from
	StudentInfo
where
	YEAR(stuBirthday) >= 1990 and
	YEAR(stuBirthday) <= 1999 and
	stuSex = '女'
go

-- 查询姓 李 的学生
select 
	*
from
	StudentInfo
where
	stuName LIKE '李%'
go

-- 查询名字含 富 的学生
select
	*
from
	StudentInfo
where
	stuName like '%富%'
go 

--
select * from StudentInfo