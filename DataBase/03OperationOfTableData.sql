-- 使用指定数据库
use library
go

-- 创建数据表
create table UserType
(
	id int primary key,	--设置id为主键
	[type] varchar(20) not null -- 这里的中括号是为了告诉编辑器type是个普通字段
)
go

-- 向表中插入数据
Insert into UserType(id, [type])
values(1,'超级管理员')
go

-- 向表中插入数据
Insert into UserType
Values(2,'图书管理员')
go

-- 向表中批量插入数据
Insert into UserType
Values (3,'员工'),
(4,'读者');
go

---------------------------------------------------------------

-- 创建用户列表
create table [User]
(
	id int primary key,
	[name] varchar(20) not null,
	sex char(2) check(sex in('男', '女')) not null,
	age int default 18 not null,
	phone char(11) not null,
	[userTypeId] int foreign key references UserType(id)
)
go

-- 向user表中插入数据
Insert into [User]
values (1, 'admin', '男', 55, '01234567899', 1),
(2, 'zhangsan', '男', 20, '01234567899', 2),
(3, 'lisi', '女', 36, '01234567899', 2),
(4, 'wangwu', '男', 18, '01234567899', 3),
(5, 'zhaoliu', '女', 22, '01234567899', 3),
(6, 'xiaoming', '男', 15, '01234567899', 4),
(7, 'xiaohong', '女', 42, '01234567899', 4);

-- 修改数据
Update [User]	-- 修改用户表中数据
set age = 24	-- 年龄改为24岁
where id=7		-- 限制id为7。即只有id为7的age才会被修改
go

-- 删除数据
delete from [User] -- 清空数据
go

-- 删除指定数据
delete from [User]
where [name] = 'xiaohong'
go

-- 查看数据
select * from [User]

-------------------

-- 新建图书分类表
create table LibraryBookType
(
	id int primary key identity,
	bookType varchar(20) not null
)
go

-- 向LibraryBook
Insert into LibraryBookType
values ('哲学'), ('社会科学'), ('自然科学'),
('小说'), ('诗歌'), ('散文'), ('历史');
go

select * from LibraryBookType
go

--------------------------------------
-- 新建图书表
Create table Book
(
	id uniqueidentifier primary key,
	bookName varchar(50) not null,
	author varchar(50) not null,
	publisher varchar(50) not null,
	libraryBookTypeId int not null, 
	foreign key(LibraryBookTypeId) references LibraryBookType(id)
)

--插入数据
Insert into Book
values(NewID(),'程序员的自我修养','LuckyFeng','暂无出版',5)
