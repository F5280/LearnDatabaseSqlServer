use library
go

-- ����һ����
create table [Type]
(
	id int primary key,
	[name] varchar(20) not null
)

-- ������һ�����������ı�
-- on delete cascade���ڹ���ɾ��
-- on update cascade���ڹ�������
create table [Product]
(
	id int primary key,
	[namr] varchar(20) not null,
	[typeId] int foreign key references [Type](id) on delete cascade on update cascade
)

insert into [Type] values(1,'�鼮'),(2,'����'),(3,'����Ʒ'),(4,'����')

insert into [Product] 
values(1,'����Ա����������',1),
(2,'С�׵��ӻ�',2),
(3,'ֽ��',3),
(4,'�������',4),
(5,'���ݿ�����ŵ����',1)

-- ��[type]��������ݸ���
update [Type]
set id = 5
where [name]='�鼮'
go

delete [Type] where id=2

-- �鿴�Ƿ�ɹ���������ͬʱ�޸�
select * from [Product]
select * from [Type]

drop table [Product]
drop table [Type]
