use Student
go

-- 计算每门课程的平均分
select
	courseName,
	AVG(skillScore) as '技能平均分'
from
	StudentScore
group by
	courseName
go

-- 每个学生的平均分
select
	stuId,
	AVG(skillScore) as '技能平均分'
from
	StudentScore
group by
	stuId
go

-- 每个班有多少个学生
select
	classId,
	Count(stuId) as '学生数量'
from
	StudentInfo
group by
	classId
go

-- 每门课程有多少位同学在学习
select
	courseName,
	COUNT(stuId) as '学生数量'
from
	StudentScore
group by
	courseName
go

-- 统计每个学生学了多少门课程
select
	stuId,
	COUNT(courseName) as '课程'
from
	StudentScore
group by
	stuId
go

-- 计算每一门课程的平均分、总分、最高分、最低分
select
	courseName,
	AVG(theoryScore+skillScore) as '平局分',
	SUM(theoryScore+skillScore) as '总分',
	MAX(theoryScore+skillScore) as '最高分',
	MIn(theoryScore+skillScore) as '最低分'
from
	StudentScore
group by
	courseName
go

------------------------------------------
-- 统计每门课程的最低分，并查询成绩大于70
select
	courseName,
	MIn(theoryScore+skillScore) as '最低分'
from
	StudentScore
group by
	courseName
having 
	min(theoryScore+skillScore)>150
go
