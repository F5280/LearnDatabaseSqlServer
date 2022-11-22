use library
go

-- 创建一个表
create table [Type]
(
	id int primary key,
	[name] varchar(20) not null
)

-- 创建另一个表关联上面的表
-- on delete cascade用于关联删除
-- on update cascade用于关联更新
create table [Product]
(
	id int primary key,
	[namr] varchar(20) not null,
	[typeId] int foreign key references [Type](id) on delete cascade on update cascade
)

insert into [Type] values(1,'书籍'),(2,'电器'),(3,'生活品'),(4,'酱料')

insert into [Product] 
values(1,'程序员的自我修养',1),
(2,'小米电视机',2),
(3,'纸巾',3),
(4,'海天蚝油',4),
(5,'数据库从入门到入坟',1)

-- 对[type]表进行数据更新
update [Type]
set id = 5
where [name]='书籍'
go

delete [Type] where id=2

-- 查看是否成功将两个表同时修改
select * from [Product]
select * from [Type]

drop table [Product]
drop table [Type]
