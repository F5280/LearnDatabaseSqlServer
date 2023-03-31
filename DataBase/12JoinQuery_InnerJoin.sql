use Enterprise
go 

-- 查询部门编号、部门名称
select id,deptName from Dept
go

-- 查询员工姓名、薪资
select staffName, salary
from Staff
go

-- 查询员工姓名、薪资，所在部门(内连接)
select 
	Staff.staffName, Staff.salary , Dept.deptName
from 
	Staff inner join Dept on Staff.deptId=Dept.id
go