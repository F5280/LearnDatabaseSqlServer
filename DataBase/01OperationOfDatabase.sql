-- 创建数据库
CREATE DATABASE library
ON PRIMARY
(
	NAME = "library",
	filename = "E:\DataBases\library.mdf",
	SIZE = 5mb,
	maxsize = unlimited,
	filegrowth = 65536KB
)
Log on
(
	name = "library_log",
	filename = "E:\DataBases\library_log.ldf",
	size = 2mb,
	maxsize = 60mb
)

-- 删除数据库
drop database library;

-- 简约的形式创建数据库
create database library;

-- 使用数据库
--use library;

-- 查看数据库设计
exec sp_helpdb library;

-- 修改数据库名
use master
execute sp_renamedb library,db_library;

-- 备份数据库
backup database db_library to disk='E:\BackUpDatabase\db_library_bak.bak';

-- 删除数据库
drop database db_library;

-- 还原数据库
restore database db_library 
from disk='E:\BackUpDatabase\db_library_bak.bak';

-- 还原数据库(替换参数)
restore database db_library 
from disk='E:\BackUpDatabase\db_library_bak.bak' 
with replace;

-- 查看数据库
exec sp_helpdb db_library;

-- 分离数据库
execute sp_detach_db 'db_library';

-- 附加数据库
execute sp_attach_db 
'library','D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\library.mdf';