use Student
go

-- In
-- ��ѯ�༶��1��3��5����ѧ����Ϣ
select 
	*
from
	StudentInfo
where 
	classId in (1,3,5)
go

-- between and
-- ��ѯ���۳ɼ���40~80��ѧ��
select
	*
from
	StudentScore
where
	theoryScore between 40 and 80
go