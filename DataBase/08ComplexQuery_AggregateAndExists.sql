use Student
go

-- ͳ��ѧ���ĸ���
Select
	count(stuId)
from
	StudentInfo
go

-- ͳ��Ů���ĸ���
select
	COUNT(stuId)
from
	StudentInfo
where
	stuSex = 'Ů'
go

-- ��ѯѧ����ƽ����
select
	AVG(theoryScore+skillScore)
from
	StudentScore
go

-- ��ѯѧ����ƴ�ҵ��ƽ����
select
	AVG(theoryScore+skillScore)
from
	StudentScore
where
	courseName = '��ƴ�ҵ'
go

-- �������İ༶
select
	MAX(id)
from
	ClassInfo
go

-- ������ͷ�
select
	Min(theoryScore+skillScore)
from
	StudentScore
go

-- ��ѯ���ܵ��ܷ�
select
	SUM(skillScore)
from
	StudentScore
go

-- ��ѯ�ж��ٸ��˲μ��˿���
Select 
	COUNT(distinct stuId)
FROM
	StudentScore
go


----------------------------------------
-- exists
-- ��ѯѧ��������25�꣬��ΪŮ��
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
	stuSex = 'Ů'
go