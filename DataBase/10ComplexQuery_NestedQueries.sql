use Student
go

-- ��ѯ�������1�������ѧ����Ϣ
Select * from StudentInfo 
where classId = 
  (
	select id from ClassInfo 
	where [name] = '�������1��'
  )
go

-- ��ѯ������ͬѧ�����гɼ�
select * from StudentScore
where stuId = 
  (
	select stuId from StudentInfo 
	where stuName = '������'
  )
go

-- ��ѯ����ͬѧ���ڰ༶��Ϣ
select * from ClassInfo
where id = 
  (
	select classId from StudentInfo
	where stuName = '����'
  )
go

-- ��ѯѧ��Ϊ'180325011'��ͬѧ���ڰ༶����������Ϣ
select * from StudentInfo
where classId = 
  (
	select classId from StudentInfo
	where stuId = '180325011'
  ) 
  and stuSex = '��'
go

-- ��ѯ�༶����Ϊ���������1�ࡱһ���ж��ٸ�Ů����Ϣ
select * from StudentInfo
where classId = 
  (
	select id from ClassInfo
	where [name] = '�������1��'
  ) 
  and stuSex = 'Ů'
go

-----------------------------------
-- ��ҳ��ѯ
-- Row_Number() Over(order by �ֶ�):��ĳ���ֶν����������
select
	row_Number() over(order by stuId) as id����,
	*
from
	StudentInfo
go

-- ���ܳɼ�������������ÿһ��ͬѧ���б��
select 
	ROW_NUMBER() over(Order by (skillScore+theoryScore) desc) as ����,
	*
from StudentScore


-- ��ѯ��ǰSQL server�汾
select @@VERSION