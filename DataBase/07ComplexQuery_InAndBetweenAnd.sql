use Student
go

-- In
-- 查询班级（1、3、5）的学生信息
select 
	*
from
	StudentInfo
where 
	classId in (1,3,5)
go

-- between and
-- 查询理论成绩在40~80的学生
select
	*
from
	StudentScore
where
	theoryScore between 40 and 80
go