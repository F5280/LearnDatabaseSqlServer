use Student
go

-- ���ֶ�����
-- ���ɼ��Ӹߵ�������
Select
	*
from 
	StudentScore 
Order BY(skillScore + theoryScore) desc
go

-- ����������A~Z��˳��
Select
	*
from
	StudentInfo
order by(stuName) asc
go

------------------------------------
-- ���ֶ�����
-- ��ѯ�ɼ�����ID���������ٰ��ɼ�����
Select
	*
from
	StudentScore
Order by(stuId) asc,(skillScore+theoryScore) desc
go

-- ��ѯѧ����Ϣ���Ȱ༶�����ٰ����ս���
select
	*
from
	StudentInfo
Order by
	(classId) asc,
	(Year(GETDATE()) - Year(stuBirthday)) desc
go