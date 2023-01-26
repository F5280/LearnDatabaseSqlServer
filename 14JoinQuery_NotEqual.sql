use Student
go 

-- Query each student to find other optional classes besides their own class.
-- 查询每位同学除了自己所属的班级外查询出其余可选的班级
select
	S.stuId, S.stuName, S.stuSex, C.[name], C.college
FROM 
	StudentInfo as S inner join ClassInfo as C
	on S.classId!=C.id
go

-- Query the scores of other students.
-- 查询其他同学的成绩
SELECT 
	*
FROM 
	StudentInfo as SI inner join StudentScore as SS
	on SI.stuId!=SS.stuId