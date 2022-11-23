# 数据库

> 狭义：存储数据的仓库
>
> 广义：可以对数据进行存储和管理的软件以及数据本身统称为数据库
>
> `SQL server`的端口号默认1433

## 数据结构与数据库的区别

>  主体不同
>
>  + 数据库：按照数据结构来组织、存储和管理数据的仓库
>  + 数据结构：是计算机存储、组织数据的方式
>
>  +++
>
>  组成不同
>
>  + 数据库：是一个长期存储在计算机内的、有组织的、可共享的、统一管理的大量数据的集合
>  + 数据结构：是指相互之间存在一种或多种特定关系的数据元素的集合
>
>  +++
>
>  特点不同
>
>  + 数据库：以一定方式储存在一起、能与多个用户共享、具有尽可能小的冗余度、与应用程序彼此独立的数据集合
>  + 数据结构：精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关

# 数据库文件组成

> 主数据文件
>
> + 文件扩展名为`.mdf`
> + 包含数据库的启动信息
> + 每个数据库都有一个主数据文件
>
> +++
>
> 次要数据文件
>
> + 文件扩展名为`.ndf`
> + 可选文件，数据库可以没有次要数据文件
>
> +++
>
> 事务日志
>
> + 文件扩展名为`.ldf`
> + 每个数据库必须至少有一个
> + 保存用于恢复数据库的事务日志信息

# SQL与T-SQL

> SQL
>
> 结构化查询语言(Structured Query Language)， 简称SQL，是一种特殊目的的编程语言，是一种数据库查询和程序设计语言，用于存取数据以及查询、更新和管理关系型数据库系统，同时也是数据库脚本文件的扩展名
>
> 包含六个部分
>
> + DQL：数据查询语言（Data Query Language），用于从表中获取数据。通常最常用的为保留字SELECT，并且常与FROM子句、WHERE子句组成SQL查询语句
> + DML：数据操纵语言（Data Manipulation Language），主要用来对数据库中的数据进行一些操作，常用的就是INSERT、UPDATE、DELETE
> + DDL：数据定义语言（Data Definition Language），常用的有CREATE、DROP和ALTER，用于在数据库中创建新表、删除表或修改表，以及为表加入索引等
> + DCL：数据控制语言（Data Control Language），通过GRANT和REVOKE，确定单个用户或用户组对数据库对象的访问权限
> + TPL：事务处理语言（Transaction Processing Language），能确保被DML语句影响的表的所有行及时得以更新。TPL语句包括BEGIN TRANSACTION、COMMIT和ROLLBACK
> + CCL：指针控制语言（Pointer Processing Language），像DECLARE CURSOR、FETCH INTO和UPDATE WHERE CURRENT用于对一个或多个表单独行的操作
>
> +++
>
> T-SQL
>
>  T-SQL 即 Transact-SQL，是 SQL 在 Microsoft SQL Server 上的增强版，它是用来让应用程序与 SQL Server 沟通的主要语言。T-SQL 提供标准 SQL 的 DDL 和 DML 功能，加上延伸的函数、系统预存程序以及程式设计结构(例如 IF 和 WHILE)让程式设计更有弹性

# 数据库操作

> 1、通过图形化界面(SSMS)进行`新建`数据库
>
> 2、通过T-SQL语句`新建`数据库
>
> ```sql
> CREATE DATABASE [library]
> CONTAINMENT = NONE
> ON  PRIMARY 
> ( 
> 	NAME = N"library", 
> 	FILENAME = N"E:\DataBases\library.mdf", 
> 	SIZE = 8192KB , 
> 	MAXSIZE = UNLIMITED, 
> 	FILEGROWTH = 65536KB 
> )
> LOG ON 
> ( 
> 	NAME = N"student_log", 
> 	FILENAME = N"E:\DataBases\library_log.ldf", 
> 	SIZE = 8192KB , 
> 	MAXSIZE = 2048GB , 
> 	FILEGROWTH = 65536KB 
> )
> WITH CATALOG_COLLATION = DATABASE_DEFAULT
> GO
> 
> -- create:用于创建的关键字
> -- DATABAS:用于操作数据库时的关键字
> -- PRIMARY:主键
> -- NAME:文件名
> -- FILENAME:文件名全称，在硬盘上的绝对路径
> -- SIZE:创建数据库的初始大小
> -- MAXSIZE:最大的大小
> -- unlimited:不限制大小
> -- FileGrowth:每次增长的大小
> 
> -- 简写形式
> CREATE DATABASE library;
> ```
>
> +++
>
> 1、通过图形化界面(SSMS)进行`删除`数据库
>
> 2、通过T-SQL语句`删除`数据库
>
> ```sql
> -- drop Database [数据库名]
> -- drop 删除指令
> -- database 数据库
> drop Database library;
> ```
>
> +++
>
> 1、通过图形化界面(SSMS)进行`查看`数据库
>
> 2、通过T-SQL语句`查看`数据库
>
> ```sql
> -- exec sp_helpdb [数据库名]
> -- exec:执行，全称execute
> -- sp_helpdb
> 
> -- 查看数据库信息是需要使用当前数据库
> use library;
> exec sp_helpdb library;
> ```
>
> +++
>
> 1、通过图形化界面(SSMS)进行`使用`数据库
>
> 2、通过T-SQL语句`使用`数据库
>
> ```sql
> -- use database [数据库名]
> -- use:使用数据库的指令
> use library;
> ```
>
> +++
>
> 1、通过图形化界面(SSMS)进行`修改`数据库名
>
> 2、通过T-SQL语句`修改`数据库名
>
> ```sql
> use master
> execute sp_renamedb library,db_library;
> ```
>
> +++
>
> 1、通过图形化界面(SSMS)进行`备份与还原`数据库
>
> 2、通过T-SQL语句`备份与还原`数据库
>
> ```sql
> -- 备份数据库
> backup database db_library 
> to disk='E:\BackUpDatabase\db_library_bak.bak';
> 
> -- 还原数据库
> restore database db_library 
> from disk='E:\BackUpDatabase\db_library_bak.bak';
> 
> -- 还原数据库(替换参数)
> restore database db_library 
> from disk='E:\BackUpDatabase\db_library_bak.bak' 
> with replace;
> ```
>
> +++
>
> 1、通过图形化界面(SSMS)进行`分离与附加`数据库
>
> 2、通过T-SQL语句`分离与附加`数据库
>
> ```sql
> -- 分离数据库
> execute sp_detach_db 'db_library';
> 
> -- 附加数据库
> execute sp_attach_db 
> 'library',
> 'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\library.mdf';
> ```

# 数据类型

> `char(n)`：固定长度字符串。最多8千个字符
>
> `varchar(n)`：可变长度的字符串。最多8千个字符
>
> `varchar(max)`：可变长度字符串。最多10亿多个字符
>
> `text`：可变长度的字符串。最多2GB字符数据
>
> +++
>
> `nchar(n)`：固定长度`Unicode`数据。最多4千个字符
>
> `nvarchar(n)`：可变长度`Unicode`数据。最多4千个字符
>
> `nvarchar(max)`：可变长度`Unicode`数据。最多5亿多个字符
>
> `text`：可变长度`Unicode`数据。最多2GB字符数据
>
> +++
>
> `bit`：0、1或null
>
> `binary(n)`：固定长度的二进制。最多8千字节
>
> `varbinary(n)`：可变长度的二进制数据。最多8千字节
>
> `varbinary(max)`：可变长度的二进制数据。做多2GB字节
>
> `image`：可变长度的二进制数据。最多2GB
>
> +++
>
> `tinyint`：0~255。1字节
>
> `smallint`：-32768~32767。2字节
>
> `int`：-2147483648~2147483647。4字节
>
> `bigint`：8字节
>
> `decimal(p,s)`：固定精度和比例的数字。5~17字节
>
> `numeric(p,s)`：固定精度和比例的数字。5~17字节
>
> `smallmoney`：货币数据。4字节
>
> `money`：货币数据。8字节
>
> `float(a)`：浮点数。4或8字节
>
> `real`：浮动精度数据。4字节
>
> +++
>
> `datetime`：从1753年1月1日到9999年12月31日。精度3.33毫秒。8bytes
>
> `datetime2`：从1753年1月1日到9999年12月31日。精度100纳秒。6~8bytes
>
> `smalldatetime`：从1900年1月1日到2079年12月31日。精度1分钟。4bytes
>
> `date`：仅存储日期。从0001年1月1日到9999年12月31日。3bytes
>
> `time`：仅存储时间。精度100纳秒。3~5bytes
>
> `datetimeoffset`：与`datetime2`相同，外加时区偏移
>
> `timestamp`：存储唯一数字，每个表只能有一个。基于内部时间不对应真实时间
>
> `sql_variant`：存储最多8千字节不同数据类型的数据
>
> `uniqueidentifier`：存储全局标识符（GUID）
>
> `xml`：存储xml数据。最多2GB
>
> `cursor`：存储对用于数据库操作的指针的引用
>
> `table`：存储结果集
>
> +++
>
> C#中的类型对应的sql的类型
>
> ```json
> String   <==> char,varchar,nvarchar,text……
> Bool     <==> bit
> DateTime <==> datetime
> Int      <==> int
> byte     <==> tinyint
> Short    <==> smallint
> Long     <==> bigint
> Double   <==> money,smallmoney
> Float    <==> float
> Decimal  <==> decimal
> Guid     <==> uniqueidentifier
> 
> //二进制
> 音频、视频、文件、图片……
> ```

# 数据库命名规范

> `Oracle`表、字段等名称统一使用大写，单词间用_下划线分隔_
>
> `SQLServer`数据库、表等名称采用Pascal命名法，字段名称采用Camel命名法，大小写字母混排
>
> `MySQL`数据库、表、字段等名称统一使用小写，单词间用_下划线分隔

# 数据表操作

## 新建数据表

> 1、通过图形化界面(SSMS)形式创建数据表
>
> 2、通过T-SQL语句进行创建数据表
>
> ```sql
> -- 创建图书数据表
> create table tb_Book
> (
> 	B_id char(10) not null,
> 	B_name varchar(35) not null,
> 	B_info varchar(100) not null,
> 	B_publisher varchar(30) not null,
> 	primary key(B_id)
> )
> -- B_id:唯一编号便于查找的书籍id
> -- B_name:书名
> -- B_info:简介
> -- B_publisher:出版社
> -- primary key:设置主键
> -- not null:不能为空
> 
> ```

## 修改数据表

> 1、通过图形化界面(SSMS)形式修改数据表
>
> 2、通过T-SQL语句进行修改数据表
>
> ```sql
> -- 修改表格，向图书数据表中添加字段
> -- B_author:图书作者
> -- varchar(50):字段类型
> -- not null:非空约束
> alter table tb_Book
> add B_author varchar(50) not null;
> go
> 
> -- 修改表格
> -- 将图书数据表中id的数据类型修改为int
> alter table tb_Book
> alter column B_id int;
> -- 直接用命令修改主键的数据类型可能会报错
> 
> -- 修改表格，删除字段
> -- 将图书数据表中的B_info字段删除
> alter table tb_Book
> drop column B_info;
> go
> ```

## 数据表的删除操作

> 1、图形化界面操作
>
> 2、T-SQL语句进行删除数据表
>
> ```sql
> -- 删除数据表
> -- drop table [数据表名]
> 
> drop table tb_Book;
> go
> ```

# 数据表约束

## 主键约束

> 保证数据的完整性、唯一性和原子性
>
> 主键只有一个，但是可以由多个字段组成，称为复合主键
>
> ```sql
> -- 写法一：行级主键约束，仅适用于一个主键的情况
> create table tb_name
> (
>     id int primary key,
>     name varchar(20) not null
> )
> go
> 
> -- 写法二：表级主键约束
> create table tb_name
> (
>     id int not null,
>     name varchar(20) not null,
>     primary key(id)
> )
> go
> 
> -- 写法三：通过表级主键约束自定义主键名称
> create table tb_name
> (
>     id int not null,
>     name varchar(20) not null,
>     constraint pk_tb_name_id primary key(id)
> )
> go
> 
> -- 写法四：通过修改表结构添加主键
> alter table tb_name
> add constraint pk_tb_name_id primary key(id)
> go
> 
> -- 复合主键:通常用另外多个表的外键组合成当前表的复合主键
> create table tb_name
> (
>     id int not null,
>     tb2_id int not null,
>     name varchar(20) not null,
>     constraint pk_tb_name_id primary key(id,tb2_id)
> )
> go
> ```
>
> ☆：可以设置identity进行主键自增(必须是数字类型)

## 外键约束

> 保证数据的合理性
>
> 与另一个表中的主键关联。当该表插入数据时，若与外表的字段无法对应则数据插入失败
>
> ```wiki
> 例：
> 在图书数据库中
> 有分类表作为外键约束，包含图书类、员工类、读者类
> 此时在某一个表格中插入数据，写入动物类，则该数据插入失败
> ```
>
> +++
>
> ```sql
> -- 外键只能引用已存在的表中字段
> -- 例：
> create table tb1
> (
>     id int primary key,
>     name varchar(20) not null
> )
> 
> create table tb2 
> (
>     id int primary
>     tb1_id int foreign key references tb1(id),
>     name varchar(20) not null
> )
> 
> -- foreign key:外面
> -- references:关联
> 
> -- 在删除表时，得先将引用外键的表删除
> -- 被引用外键的表才能删除
> ```
>
> 

## 唯一约束

> `unique`
>
> 保证数据的唯一性
>
> 可以为空，但整张表中只能有一个为空

## 检查约束

> `check()`：设置插入的数据只能在check限制范围内
>
> `default`：设置插入的数据默认值
>
> ☆：check与default可以一起用

## 非空约束

> `not null`
>
> 有利于数据的检索

# 表数据操作

> 可以通过图形化(SSMS)界面操作表数据
>
> 通过T-SQL语句操作表数据

## 添加数据

> 关键字：Insert
>
> ```sql
> -- 方式一:插入一条数据
> -- Insert into [表名]([表中含有的字段以逗号分隔])
> -- values([按括号内的字段顺序写入数据以逗号分隔])
> Insert into UserType(id, [type])
> values(1,'超级管理员')
> go
> 
> -- 方式二：插入一条数据
> -- Insert into [表名]
> -- values([按表设计时的字段顺序写入数据以逗号分隔且一个字段都不能少])
> Insert into UserType
> Values(2,'图书管理员')
> go
> 
> -- 方式三:批量添加数据
> -- Insert into [表名]
> -- values ([数据1]),([数据2]),……
> Insert into UserType
> Values (3,'员工'),
> (4,'读者');
> go
> ```

## 修改数据

> 关键字：Update
>
> ```sql
> -- Update [表名]
> -- set [字段名] = 新值
> -- where [限制字段] = 值
> -- 该方式是修改指定行上的某个字段值
> Update [User]	-- 修改用户表中数据
> set age = 24	-- 年龄改为24岁
> where id=7		-- 限制id为7。即只有id为7的age才会被修改
> go
> 
> -- 可以修改多个字段也可以设置多个限制条件
> ```

## 删除数据

> 关键字：Delete
>
> ```sql
> -- delete清空表中的数据
> -- 当设置主键自增时，该主键并不会初始化
> Delete from [user]
> go
> 
> -- truncate清空表中的数据
> -- 当设置主键自增时，该主键会初始化
> truncate from [user]
> 
> -- 删除指定数据
> delete from [User]
> where [name] = 'xiaohong'
> go
> 
> ```

## 查看数据

> 关键字：Select
>
> ```sql
> -- 查看某表中的所有数据
> -- select * from [表名]
> select * from [User]
> ```

## 主键策略

> identity：自增适用于数字类型
>
> uniqueidentifier：适用于非数字类型，搭配`newid()`函数使用
>
> ```sql
> -- 新建图书表
> create table LibraryBook
> (
> 	id int primary key identity, -- 自增
> 	bookType varchar(20) not null
> )
> go
> 
> -- 向LibraryBook批量添加数据
> Insert into LibraryBook	-- 省略id
> values ('哲学'), ('社会科学'), ('自然科学'),
> ('小说'), ('诗歌'), ('散文'), ('历史');
> go
> 
> ----------------------------------
> 
> -- 新建图书表
> Create table Book
> (
> 	id uniqueidentifier primary key, --
> 	bookName varchar(50) not null,
> 	author varchar(50) not null,
> 	publisher varchar(50) not null,
> 	libraryBookTypeId int not null, 
> 	foreign key(LibraryBookTypeId) references LibraryBookType(id)
> )
> 
> --插入数据
> Insert into Book
> values(NewID(),'程序员的自我修养','LuckyFeng','暂无出版',5)
> ```
>
> ☆：适用于并发量小的时候

## 联级删除与联级更新

> 当两个数据表通过`主、外键`进行关联的时候，无法直接使用`delete`或`update`进行删除与更新操作，需将关联表中的相应的数据删除后才能删除被关联表或表中数据
>
> 联级删除需要用到：on delete cascade
>
> 联级更新需要用到：on update cascade
>
> ```sql
> -- 表的约束情况
> -- 创建一个表
> create table [Type]
> (
> 	id int primary key,
> 	[name] varchar(20) not null
> )
> 
> -- 创建另一个表关联上面的表
> -- on delete cascade用于关联删除
> -- on update cascade用于关联更新
> create table [Product]
> (
> 	id int primary key,
> 	[namr] varchar(20) not null,
> 	[typeId] int foreign key references [Type](id) on delete cascade on update cascade
> )
> 
> ----------------------------------
> -- 插入数据
> insert into [Type] values(1,'书籍'),(2,'电器'),(3,'生活品'),(4,'酱料')
> 
> insert into [Product] 
> values(1,'程序员的自我修养',1),
> (2,'小米电视机',2),
> (3,'纸巾',3),
> (4,'海天蚝油',4),
> (5,'数据库从入门到入坟',1)
> 
> -----------------------------------
> -- 对[type]表进行数据更新
> -- 则[Product]表中的数据也会更新
> update [Type]
> set id = 5
> where [name]='书籍'
> go
> 
> -- 删除[Type]表中的行数据后
> -- [product]中对应数据也会删除
> delete [Type] where id=2
> ```

# 查询数据

> 先创建库与表以及插入一堆数据进而进行操作
>
> +++
>
> 建库、表
>
> ```sql
> -- 创建数据库
> create database Student;
> go 
> 
> -- 使用数据库/切换数据库
> use Student;
> go
> 
> -- 创建班级表
> Create table ClassInfo
> (
> 	id int primary key identity,
> 	[name] varchar(30) not null,
> 	college varchar(20) not null
> )
> go
> 
> -- 创建学生表
> Create table StudentInfo
> (
> 	stuId char(10) primary key,
> 	stuName varchar(20) not null,
> 	classId int foreign key references ClassInfo(id) on delete cascade on update cascade not null,
> 	stuPhone char(11) not null,
> 	stuSex char(2) check(stuSex in ('男','女')),
> 	stuBirthday dateTime not null
> )
> go
> 
> -- 成绩表
> create table StudentScore
> (
> 	id int primary key identity,
> 	stuId char(10) foreign key references StudentInfo(stuId) on delete cascade on update cascade not null,
> 	courseName varchar(20) not null,
> 	theoryScore int not null,
> 	skillScore int not null
> )
> go
> ```
>
> +++
>
> 插入数据
>
> ```sql
> -- 切换数据库
> use Student
> go 
> 
> -- 向[ClassInfo]表插入数据
> Insert into 
> 	ClassInfo
> values
> 	('软件技术1班', '计算机系'),
> 	('会计1班', '经济管理系'),
> 	('会计2班', '经济管理系'),
> 	('欧美软件外包班', '计算机系'),
> 	('会计3班', '经济管理系')
> go
> 
> -- 向[StudentInfo]表中插入数据
> insert into 
> 	StudentInfo
> values
> 	('180325011', '任天堂', 1, '12345678902', '男', '1999-09-09'),
> 	('180325012', '张三', 2, '12345678902', '女', '1998-08-09'),
> 	('180325013', '李四', 3, '12345678902', '男', '1997-07-09'),
> 	('180325014', '王五', 4, '12345678902', '女', '1996-06-09'),
> 	('180325015', '赵六', 5, '12345678902', '男', '1995-05-09'),
> 	('180325016', '张学友', 5, '12345678902', '女', '1994-04-09'),
> 	('180325017', '郭富城', 4, '12345678902', '男', '1993-03-09'),
> 	('180325018', '刘德华', 3, '12345678902', '女', '1992-02-09'),
> 	('180325019', '黎明', 2, '12345678902', '男', '1991-01-09'),
> 	('180325020', '谭咏麟', 1, '12345678902', '女', '1990-10-09'),
> 	('180325021', '林子祥', 1, '12345678902', '男', '1989-11-09'),
> 	('180325022', '周慧敏', 2, '12345678902', '男', '1999-12-09')
> go
> 
> -- 向[StudentScore]表中插入数据
> Insert into
> 	StudentScore
> values
> 	('180325011', 'C# 入门到入坟', 80, 90),
> 	('180325012', '会计从业', 90, 88),
> 	('180325013', '会计从业', 100, 90),
> 	('180325014', '计算机基础', 70, 60),
> 	('180325015', '会计从业', 60, 90),
> 	('180325016', '会计从业',50, 90),
> 	('180325017', '计算机基础', 40, 100),
> 	('180325018', '会计从业', 100, 100),
> 	('180325019', '会计从业', 80, 90),
> 	('180325020', 'C# 入门到入坟', 100, 100),
> 	('180325021', 'C# 入门到入坟', 80, 90),
> 	('180325022', '会计从业',100, 90)
> go
> ```

## 简单查询

> 查询某表中的所有数据
>
> ```sql
> -- StudentInfo
> -- *表示所有，优化的时候一般不用*
> SELECT * from StudentInfo
> ```
>
> +++
>
> 查询表中指定的字段
>
> ```sql
> -- 查询[StudentInfo]表中的姓名、性别、生日、班级
> select 
> 	stuName,stuSex,stuBirthday,classId
> from
> 	StudentInfo
> ```
>
> +++
>
> 为表中的列取别名
>
> ```sql
> -- 查询[StudentInfo]表中的信息并为每一列取别名
> -- as:可省略
> select 
> 	stuId as '学生主键',
> 	stuName as '学生姓名',
> 	classId as 班级编号,
> 	stuPhone '电话',
> 	stuSex 性别,
> 	stuBirthday '生日'
> from
> 	StudentInfo
> ```
>
> +++
>
> `distinct`：去重
>
> ```sql
> -- 1、指定单个字段去除重复项
> select distinct classId from StudentInfo
> 
> -- 2、指定多个字段时
> -- 系统将多个字段组合在一起时，不会发生重复
> select distinct stuSex,classId from StudentInfo
> ```
>
> +++
>
> `top`：取前几条数据
>
> ```sql
> -- 1、取前5条数据
> select 
> 	top 5 *
> from 
> 	StudentInfo
> go
> 
> -- 2、取前百分之70的数据
> select 
> 	top 70 percent *
> from
> 	StudentInfo
> ```
>
> ☆：top取的数据数量采取`向上取整`的方式
>
> +++
>
> `where`：查询条件
>
> ```sql
> -- 查询年龄大于30岁的学生
> select 
> 	*
> from 
> 	StudentInfo
> where
> 	(YEAR(GETDATE())-YEAR(stuBirthday)) > 25
> go
> 
> -- 查询学生的姓名、性别、年龄(取别名)
> select
> 	stuName as '姓名',
> 	stuSex as '性别',
> 	(Year(getdate())-Year(stuBirthday)) as 年龄
> from
> 	StudentInfo
> go
> 
> -- 查询90后的女生
> select
> 	*
> from
> 	StudentInfo
> where
> 	YEAR(stuBirthday) >= 1990 and
> 	YEAR(stuBirthday) <= 1999 and
> 	stuSex = '女'
> go
> ```
>
> ☆：YEAR()：从参数里面截取年份
>
> ☆：GETDATE()：获取当前时间
>
> ☆：当要求多个条件时需要用and连接
>
> +++
>
> `like`：模糊查询
>
> ```sql
> -- 查询姓李的学生
> select 
> 	*
> from
> 	StudentInfo
> where
> 	stuName LIKE '李%'
> go
> 
> -- 查询名字含 富 的学生
> select
> 	*
> from
> 	StudentInfo
> where
> 	stuName like '%富%'
> ```
>
> ☆：`%` 表示任意**多个**字符
>
> ☆：`_` 表示任意**一个**字符
>
> ☆：[`charlist`] 表示中括号内的字符列表中的任意**一个**字符
>
> ☆：[`!charlist`] 表示不含中括号内的字符列表中的任意**一个**字符
>
> ☆：[`^charlist`] 表示不含中括号内的字符列表中的任意**一个**字符

## ORDER BY

> Order by：排序。默认情况下是升序
>
> ASC：升序。
>
> DESC：降序
>
> ```sql
> -- 单字段排序：Order by(字段名) asc/desc
> -- 将成绩从高到低排序
> Select
> 	*
> from 
> 	StudentScore 
> Order BY(skillScore + theoryScore) desc
> go
> 
> -- 将姓名升序【A~Z的顺序】
> Select
> 	*
> from
> 	StudentInfo
> order by(stuName) asc
> go
> 
> -----------------------------------------
> -- 多字段排序：Order by(字段名) asc/desc, (字段名) asc/desc[……]
> -- 查询成绩表，先ID进行排序再按成绩降序
> Select
> 	*
> from
> 	StudentScore
> Order by(stuId) asc,(skillScore+theoryScore) desc
> go
> 
> -- 查询学生信息，先班级排序再按生日降序
> select
> 	*
> from
> 	StudentInfo
> Order by
> 	(classId) asc,
> 	(Year(GETDATE()) - Year(stuBirthday)) desc
> go
> ```

## In/Between ……and

> in：指定的值。固定
>
> between……and：在某个范围内。范围
>
> ```sql
> -- In
> -- 查询班级（1、3、5）的学生信息
> select 
> 	*
> from
> 	StudentInfo
> where 
> 	classId in (1,3,5)
> go
> 
> -- between and
> -- 查询理论成绩在40~80的学生
> select
> 	*
> from
> 	StudentScore
> where
> 	theoryScore between 40 and 80
> go
> ```

## 聚合查询

> 聚合函数
>
> + MIN()：最小值。数字类型
> + MAX()：最大值。数字类型
> + SUM()：求总和。数字类型
> + COUNT()：求个数。无要求
> + COUNT(distinct 字段)：去重后求个数
> + AVG()：求平均数。数字类型
>
> ```sql
> -- 统计学生的个数
> Select
> 	count(stuId)
> from
> 	StudentInfo
> go
> 
> -- 统计女生的个数
> select
> 	COUNT(stuId)
> from
> 	StudentInfo
> where
> 	stuSex = '女'
> go
> 
> -- 查询学生的平均分
> select
> 	AVG(theoryScore+skillScore)
> from
> 	StudentScore
> go
> 
> -- 查询学生会计从业的平均分
> select
> 	AVG(theoryScore+skillScore)
> from
> 	StudentScore
> where
> 	courseName = '会计从业'
> go
> 
> -- 求编号最大的班级
> select
> 	MAX(id)
> from
> 	ClassInfo
> go
> 
> -- 计算最低分
> select
> 	Min(theoryScore+skillScore)
> from
> 	StudentScore
> go
> 
> -- 查询技能的总分
> select
> 	SUM(skillScore)
> from
> 	StudentScore
> go
> 
> -- 查询有多少个人参加了考试
> Select 
> 	COUNT(distinct stuId)
> FROM
> 	StudentScore
> ```

## EXISTS查询

> 用于嵌套查询
>
> `exists`后的查询语句有结果则为**真**，无结果则为**假**
>
> 当为**真**时，执行外层查询，否则外层查询不执行
>
> ```sql
> select
> 	字段1,字段2……
> from
> 	表名
> where
> 	exists(select 字段 from 表名 where ……)
> 	
> -----------------------------------------------
> -- 查询学生表，大于25岁，且为女性
> select 
> 	*
> from 
> 	StudentInfo
> where
> 	exists(
> 		select 
> 			* 
> 		from 
> 			StudentInfo 
> 		where
> 			YEAR(GETDATE()-Year(stuBirthday)) > 25
> 		) and
> 	stuSex = '女'
> go
> ```
>
> 
