use Student
go

-- ��ѯĳ���е���������
-- *��ʾ���У��Ż���ʱ��һ�㲻��*
-- StudentInfo
SELECT * from StudentInfo

-- ��ѯ[StudentInfo]���е��������Ա����ա��༶
select 
	stuName,stuSex,stuBirthday,classId
from
	StudentInfo

-- ��ѯ[StudentInfo]���е���Ϣ��Ϊÿһ��ȡ����
-- as:��ʡ��
select 
	stuId as 'ѧ������',
	stuName as 'ѧ������',
	classId as �༶���,
	stuPhone '�绰',
	stuSex �Ա�,
	stuBirthday '����'
from
	StudentInfo

-- distinct��ȥ��
-- 1��ָ�������ֶ�ȥ���ظ���
select distinct classId from StudentInfo

-- 2��ָ������ֶ�ʱ
-- ϵͳ������ֶ������һ��ʱ�����ᷢ���ظ�
select distinct stuSex,classId from StudentInfo