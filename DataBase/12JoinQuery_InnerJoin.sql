use Enterprise
go 

-- ��ѯ���ű�š���������
select id,deptName from Dept
go

-- ��ѯԱ��������н��
select staffName, salary
from Staff
go

-- ��ѯԱ��������н�ʣ����ڲ���(������)
select 
	Staff.staffName, Staff.salary , Dept.deptName
from 
	Staff inner join Dept on Staff.deptId=Dept.id
go