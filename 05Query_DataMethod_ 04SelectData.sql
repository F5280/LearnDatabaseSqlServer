use Student;
go

-- top��ʹ��
-- 1��ȡǰ5������
select 
	top 5 *
from 
	StudentInfo
go

-- 2��ȡǰ�ٷ�֮70������
select 
	top 70 percent *
from
	StudentInfo
go

-- ��ѯ�������30���ѧ��
select 
	*
from 
	StudentInfo
where
	(YEAR(GETDATE())-YEAR(stuBirthday)) > 25
go

-- ��ѯѧ�����������Ա�����(ȡ����)
select
	stuName as '����',
	stuSex as '�Ա�',
	(Year(getdate())-Year(stuBirthday)) as ����
from
	StudentInfo
go

-- ��ѯ90���Ů��
select
	*
from
	StudentInfo
where
	YEAR(stuBirthday) >= 1990 and
	YEAR(stuBirthday) <= 1999 and
	stuSex = 'Ů'
go

-- ��ѯ�� �� ��ѧ��
select 
	*
from
	StudentInfo
where
	stuName LIKE '��%'
go

-- ��ѯ���ֺ� �� ��ѧ��
select
	*
from
	StudentInfo
where
	stuName like '%��%'
go 

--
select * from StudentInfo