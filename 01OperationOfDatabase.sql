-- �������ݿ�
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

-- ɾ�����ݿ�
drop database library;

-- ��Լ����ʽ�������ݿ�
create database library;

-- ʹ�����ݿ�
--use library;

-- �鿴���ݿ����
exec sp_helpdb library;

-- �޸����ݿ���
use master
execute sp_renamedb library,db_library;

-- �������ݿ�
backup database db_library to disk='E:\BackUpDatabase\db_library_bak.bak';

-- ɾ�����ݿ�
drop database db_library;

-- ��ԭ���ݿ�
restore database db_library 
from disk='E:\BackUpDatabase\db_library_bak.bak';

-- ��ԭ���ݿ�(�滻����)
restore database db_library 
from disk='E:\BackUpDatabase\db_library_bak.bak' 
with replace;

-- �鿴���ݿ�
exec sp_helpdb db_library;

-- �������ݿ�
execute sp_detach_db 'db_library';

-- �������ݿ�
execute sp_attach_db 
'library','D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\library.mdf';