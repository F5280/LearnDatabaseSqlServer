use Student
go

-- 统计学生的个数
Select
	count(stuId)
from
	StudentInfo
go

-- 统计女生的个数
select
	COUNT(stuId)
from
	StudentInfo
where
	stuSex = '女'
go

-- 查询学生的平均分
select
	AVG(theoryScore+skillScore)
from
	StudentScore
go

-- 查询学生会计从业的平均分
select
	AVG(theoryScore+skillScore)
from
	StudentScore
where
	courseName = '会计从业'
go

-- 求编号最大的班级
select
	MAX(id)
from
	ClassInfo
go

-- 计算最低分
select
	Min(theoryScore+skillScore)
from
	StudentScore
go

-- 查询技能的总分
select
	SUM(skillScore)
from
	StudentScore
go

-- 查询有多少个人参加了考试
Select 
	COUNT(distinct stuId)
FROM
	StudentScore
go


----------------------------------------
-- exists
-- 查询学生表，大于25岁，且为女性
select 
	*
from 
	StudentInfo
where
	exists(
		select 
			* 
		from 
			StudentInfo 
		where
			YEAR(GETDATE()-Year(stuBirthday)) > 25
		) and
	stuSex = '女'
go