use Student
go

-- Query the students assigned classes and their class information.
-- 查询出分配了班级的学生和学生班级信息
select S.*, C.college, C.name
from StudentInfo S inner join ClassInfo C
on S.classId=C.id
go

-- Find out the students and class information of Software Technology Class 1.
-- 查询出软件技术1班的学生和班级信息
select 
	S.*, C.[name], C.college
from 
	StudentInfo as S inner join ClassInfo as C 
on
	S.classId=C.id
go

-- Find out the information of the students 
-- and classes aged over 25 
-- who have been assigned to the class.
-- 查询出分配了班级, 年龄在25岁以上的学生和学生班级信息
select
	S.*, C.[name], C.college
from 
	StudentInfo as S 
	inner join ClassInfo as C
	on S.classId=C.id
where 
	(YEAR(GETDATE())-YEAR(S.stuBirthday))>25
go

-- Find out the information of the students 
-- and their classes aged 20~24 
-- who have been assigned classes.
-- 查询出分配了班级, 年龄在20~24岁的学生和学生班级信息
select
	S.*, C.[name], C.college
from 
	StudentInfo as S 
	inner join ClassInfo as C
	on S.classId=C.id
where 
	(YEAR(GETDATE())-YEAR(S.stuBirthday)) between 20 and 24
go

-- Query the class name without students.
-- 查询没有学生的班级名称
select ClassInfo.[name]
FROM ClassInfo
WHERE id not in (SELECT classId from StudentInfo)

-- Query the information of the students 
-- and classes assigned to the class, with the gender of female.
-- 查询分配了班级，性别为女的学生和班级信息
select
	S.*, C.[name], C.college
from 
	StudentInfo as S 
	inner join ClassInfo as C
	on S.classId=C.id
where
	S.stuSex='女'
go

-- Modify the character set format of the database.
ALTER DATABASE Student COLLATE Chinese_PRC_CS_AI_WS;
go