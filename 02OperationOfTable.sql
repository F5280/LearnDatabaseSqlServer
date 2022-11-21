use library
go

-- ����ͼ�����ݱ�
create table tb_Book
(
	B_id char(10) not null,
	B_name varchar(35) not null,
	B_info varchar(100) not null,
	B_publisher varchar(30) not null,
	primary key(B_id)
)
go

-- �޸ı������ֶ�
-- B_author:ͼ������
-- varchar(50):�ֶ�����
-- not null:�ǿ�Լ��
alter table tb_Book
add B_author varchar(50) not null;
go

-- �޸ı���޸��ֶ���������
-- ��ͼ�����ݱ���id�����������޸�Ϊint
alter table tb_Book
alter column B_id int;
go

-- �޸ı��ɾ���ֶ�
-- ��ͼ�����ݱ��е�B_info�ֶ�ɾ��
alter table tb_Book
drop column B_info;
go

-- ɾ�����ݱ�
drop table tb_Book;
go
