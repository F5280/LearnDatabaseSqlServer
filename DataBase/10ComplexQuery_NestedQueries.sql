use Student
go

-- 查询软件技术1班的所有学生信息
Select * from StudentInfo 
where classId = 
  (
	select id from ClassInfo 
	where [name] = '软件技术1班'
  )
go

-- 查询任天堂同学的所有成绩
select * from StudentScore
where stuId = 
  (
	select stuId from StudentInfo 
	where stuName = '任天堂'
  )
go

-- 查询张三同学所在班级信息
select * from ClassInfo
where id = 
  (
	select classId from StudentInfo
	where stuName = '张三'
  )
go

-- 查询学号为'180325011'的同学所在班级所有男生信息
select * from StudentInfo
where classId = 
  (
	select classId from StudentInfo
	where stuId = '180325011'
  ) 
  and stuSex = '男'
go

-- 查询班级名称为“软件技术1班”一共有多少个女生信息
select * from StudentInfo
where classId = 
  (
	select id from ClassInfo
	where [name] = '软件技术1班'
  ) 
  and stuSex = '女'
go

-----------------------------------
-- 分页查询
-- Row_Number() Over(order by 字段):按某个字段进行排名编号
select
	row_Number() over(order by stuId) as id排名,
	*
from
	StudentInfo
go

-- 按总成绩降序排名并给每一个同学进行编号
select 
	ROW_NUMBER() over(Order by (skillScore+theoryScore) desc) as 排名,
	*
from StudentScore


-- 查询当前SQL server版本
select @@VERSION