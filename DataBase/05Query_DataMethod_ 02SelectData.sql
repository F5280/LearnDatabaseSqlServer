use Student
go

-- 查询某表中的所有数据
-- *表示所有，优化的时候一般不用*
-- StudentInfo
SELECT * from StudentInfo

-- 查询[StudentInfo]表中的姓名、性别、生日、班级
select 
	stuName,stuSex,stuBirthday,classId
from
	StudentInfo

-- 查询[StudentInfo]表中的信息并为每一列取别名
-- as:可省略
select 
	stuId as '学生主键',
	stuName as '学生姓名',
	classId as 班级编号,
	stuPhone '电话',
	stuSex 性别,
	stuBirthday '生日'
from
	StudentInfo

-- distinct：去重
-- 1、指定单个字段去除重复项
select distinct classId from StudentInfo

-- 2、指定多个字段时
-- 系统将多个字段组合在一起时，不会发生重复
select distinct stuSex,classId from StudentInfo