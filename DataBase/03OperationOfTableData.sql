-- ʹ��ָ�����ݿ�
use library
go

-- �������ݱ�
create table UserType
(
	id int primary key,	--����idΪ����
	[type] varchar(20) not null -- �������������Ϊ�˸��߱༭��type�Ǹ���ͨ�ֶ�
)
go

-- ����в�������
Insert into UserType(id, [type])
values(1,'��������Ա')
go

-- ����в�������
Insert into UserType
Values(2,'ͼ�����Ա')
go

-- �����������������
Insert into UserType
Values (3,'Ա��'),
(4,'����');
go

---------------------------------------------------------------

-- �����û��б�
create table [User]
(
	id int primary key,
	[name] varchar(20) not null,
	sex char(2) check(sex in('��', 'Ů')) not null,
	age int default 18 not null,
	phone char(11) not null,
	[userTypeId] int foreign key references UserType(id)
)
go

-- ��user���в�������
Insert into [User]
values (1, 'admin', '��', 55, '01234567899', 1),
(2, 'zhangsan', '��', 20, '01234567899', 2),
(3, 'lisi', 'Ů', 36, '01234567899', 2),
(4, 'wangwu', '��', 18, '01234567899', 3),
(5, 'zhaoliu', 'Ů', 22, '01234567899', 3),
(6, 'xiaoming', '��', 15, '01234567899', 4),
(7, 'xiaohong', 'Ů', 42, '01234567899', 4);

-- �޸�����
Update [User]	-- �޸��û���������
set age = 24	-- �����Ϊ24��
where id=7		-- ����idΪ7����ֻ��idΪ7��age�Żᱻ�޸�
go

-- ɾ������
delete from [User] -- �������
go

-- ɾ��ָ������
delete from [User]
where [name] = 'xiaohong'
go

-- �鿴����
select * from [User]

-------------------

-- �½�ͼ������
create table LibraryBookType
(
	id int primary key identity,
	bookType varchar(20) not null
)
go

-- ��LibraryBook
Insert into LibraryBookType
values ('��ѧ'), ('����ѧ'), ('��Ȼ��ѧ'),
('С˵'), ('ʫ��'), ('ɢ��'), ('��ʷ');
go

select * from LibraryBookType
go

--------------------------------------
-- �½�ͼ���
Create table Book
(
	id uniqueidentifier primary key,
	bookName varchar(50) not null,
	author varchar(50) not null,
	publisher varchar(50) not null,
	libraryBookTypeId int not null, 
	foreign key(LibraryBookTypeId) references LibraryBookType(id)
)

--��������
Insert into Book
values(NewID(),'����Ա����������','LuckyFeng','���޳���',5)
