use Student
go

-- ����ÿ�ſγ̵�ƽ����
select
	courseName,
	AVG(skillScore) as '����ƽ����'
from
	StudentScore
group by
	courseName
go

-- ÿ��ѧ����ƽ����
select
	stuId,
	AVG(skillScore) as '����ƽ����'
from
	StudentScore
group by
	stuId
go

-- ÿ�����ж��ٸ�ѧ��
select
	classId,
	Count(stuId) as 'ѧ������'
from
	StudentInfo
group by
	classId
go

-- ÿ�ſγ��ж���λͬѧ��ѧϰ
select
	courseName,
	COUNT(stuId) as 'ѧ������'
from
	StudentScore
group by
	courseName
go

-- ͳ��ÿ��ѧ��ѧ�˶����ſγ�
select
	stuId,
	COUNT(courseName) as '�γ�'
from
	StudentScore
group by
	stuId
go

-- ����ÿһ�ſγ̵�ƽ���֡��ܷ֡���߷֡���ͷ�
select
	courseName,
	AVG(theoryScore+skillScore) as 'ƽ�ַ�',
	SUM(theoryScore+skillScore) as '�ܷ�',
	MAX(theoryScore+skillScore) as '��߷�',
	MIn(theoryScore+skillScore) as '��ͷ�'
from
	StudentScore
group by
	courseName
go

------------------------------------------
-- ͳ��ÿ�ſγ̵���ͷ֣�����ѯ�ɼ�����70
select
	courseName,
	MIn(theoryScore+skillScore) as '��ͷ�'
from
	StudentScore
group by
	courseName
having 
	min(theoryScore+skillScore)>150
go
