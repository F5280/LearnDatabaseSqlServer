use Student
go

-- 单字段排序
-- 将成绩从高到低排序
Select
	*
from 
	StudentScore 
Order BY(skillScore + theoryScore) desc
go

-- 将姓名升序【A~Z的顺序】
Select
	*
from
	StudentInfo
order by(stuName) asc
go

------------------------------------
-- 多字段排序
-- 查询成绩表，先ID进行排序再按成绩降序
Select
	*
from
	StudentScore
Order by(stuId) asc,(skillScore+theoryScore) desc
go

-- 查询学生信息，先班级排序再按生日降序
select
	*
from
	StudentInfo
Order by
	(classId) asc,
	(Year(GETDATE()) - Year(stuBirthday)) desc
go