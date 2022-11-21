use library
go

-- 创建图书数据表
create table tb_Book
(
	B_id char(10) not null,
	B_name varchar(35) not null,
	B_info varchar(100) not null,
	B_publisher varchar(30) not null,
	primary key(B_id)
)
go

-- 修改表格，添加字段
-- B_author:图书作者
-- varchar(50):字段类型
-- not null:非空约束
alter table tb_Book
add B_author varchar(50) not null;
go

-- 修改表格，修改字段数据类型
-- 将图书数据表中id的数据类型修改为int
alter table tb_Book
alter column B_id int;
go

-- 修改表格，删除字段
-- 将图书数据表中的B_info字段删除
alter table tb_Book
drop column B_info;
go

-- 删除数据表
drop table tb_Book;
go
