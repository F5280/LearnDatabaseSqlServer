# Database Advanced

## Introduction

本次数据库的高级内容笔记我准备用双语（中文、英文）进行记录，英文部分使用的是百度翻译。

`SQL server` 高级内容涉及了索引、事务、锁、T-SQL编程、触发器、存储过程、数据库设计、临时表、数据库优化、发布等。

>
> I am going to record the high-level content notes of this database in bilingual (Chinese and English), and the English part is Baidu Translator.
> 
> The advanced content of `SQL server` involves indexes, transactions, locks, T-SQL programming, triggers, stored procedures, database design, temporary tables, database optimization, publishing, etc.
> 

## 1. Index and view(索引与视图)

### 1.1 Introduction

<B>Index(索引)</B>

`作用` : 当数据量非常庞大的时候，查询则会比较缓慢，通过索引可以大大的提高查询速度。

`定义` : 将数据结构中的一部分信息提取出来，重新组织，使其变得有一定的结构，这部分信息称为索引。

>
> `Function` : When the amount of data is very large, the query will be slow, and the index can greatly improve the query speed.
>
> `Definition` : Extract part of the information in the data structure, reorganize it, and make it have a certain structure. This part of information is called index.
>

<B>View(视图)</B>

视图是用于简化查询过程、提高数据库安全性的数据库虚拟表对象

### 1.2 Understand common data structures(了解常见的数据结构)

#### 1.2.1 Stack(栈)

`定义` : 只在一个方向(或一端)进行增删改查等操作的线性表。

`特点` : 先进后出、后进先出

类似与子弹上膛，最后压入的子弹最先打出。

>
> `Definition` : A linear table that can only be added, deleted, modified, or queried in one direction (or one end).
>
> `Features` : FIFO, LIFO
>
> Similar to the loading of a bullet, the last bullet pressed in is the first to shoot out.
>

![栈图](./Images%20Database/Stack.PNG)

#### 1.2.2 Queue(队列)

`定义` : 在一端进行删除元素，另一端进行增加元素的线性表。

`特点` : 先进先出。

类似于现实中的排队买单，最先排队的人最先走人。

>
> `Definition` : delete elements at one end and add elements at the other end.
>
> `Features` : First in, first out.
>
> Similar to the reality of queuing to pay the bill, the first person in line is the first to leave.
>

![队列图](./Images%20Database/Queue.PNG)

#### 1.2.3 Array(数组)

![数组](./Images%20Database/Array.PNG)

1、查询速度快：通过地址值与索引可快速定位到数据。

2、删除效率低：删除数据后，要将每个数据前移。

3、添加效率极低：添加位置后，每个数据都往后移，再添加数据。

>
> 1. Fast query speed: data can be quickly located through address value and index.
>
> 2. Low deletion efficiency: After deleting data, move each data forward.
>
> 3. The efficiency of adding is extremely low: after adding a location, each data is moved back and then added.
>

#### 1.2.4 Linked list(链表)

![链表图](./Images%20Database/Linked%20List.PNG)

1、链接中的数据都是游离存储的，每个元素节点包含元素值与下一个元素地址。

2、查询速度慢，因为每次查询都要通过 `head` 指针依次查询

3、添加、删除效率较高，因为只需要将指针重新指向新添加进来的元素，其他元素不需要动。

>
> 1. The data in the link is stored freely. Each element node contains the element value and the address of the next element.
>
> 2. The query speed is slow because each query needs to be queried in turn through the 'head' pointer
>
> 3. The efficiency of adding and deleting is high, because you only need to re-point the pointer to the newly added element, and other elements do not need to be moved.
>

![单链表与双链表的结构图](./Images%20Database/Linked%20List%20Classification.PNG)

#### 1.2.5 Tree(树)

##### Binary Tree(二叉树))

二叉树全称二叉搜索树。存入的数据以第一条数据为基准，小于放左边，大于放右边。

1、只能有一个根节点，每个节点最多支持两个子节点。

2、节点的度：节点拥有的子树的个数。节点的度数不大于2。如果度数为0，则称该节点为叶子节点。

缺点：当节点较多时，会面临查找速度慢的情况，而且容易出现<b>退化链表</b>情况。

>
> The full name of binary tree is binary search tree. The stored data is based on the first data, which is smaller than the left and larger than the right.
>
> 1. There can only be one root node, and each node can support up to two child nodes.
>
> 2. Node degree: the number of subtrees owned by the node. The degree of the node is not greater than 2. If the degree is 0, the node is called a leaf node.
>
> `Disadvantages` : When there are many nodes, the search speed will be slow, and it is easy to degenerate the linked list.

![Binary Tree](./Images%20Database/Binary%20Tree.PNG)

##### Balanced Binary Tree(平衡二叉树)

平衡二叉树是在满足二叉查找树的情况下，尽可能的让树的度数变低以提高效率。

> The balanced binary tree is to reduce the degree of the tree as much as possible to improve efficiency under the condition of satisfying the binary search tree.

![平衡二叉树图](./Images%20Database/BlanacedBinarryTree.PNG)

要求：任意节点的两个左右子树高度差不超过1，任意节点的左右子树都是一个平衡二叉树。

> Requirements: The height difference between the two left and right subtrees of any node shall not exceed 1, and the left and right subtrees of any node shall be a balanced binary tree.

![平衡二叉树图例题](./Images%20Database/BlanacedBinarryTree2.PNG)

底层在二叉树的基础上，对进行插入和删除操作时通过特定的操作（左旋，右旋）保持二叉树的平衡，从而获得较高的性能。

> On the basis of the binary tree, the bottom layer maintains the balance of the binary tree through specific operations (left and right) when performing insert and delete operations, so as to achieve high performance.

```txt
左旋转：被旋转的节点从左侧上升到父节点
右旋转：被旋转的节点从右侧上升到父节点

Left rotation: the rotated node rises from the left to the parent node
Right rotation: the rotated node rises from the right to the parent node
```

**缺点：**

+ 树的深度过高
+ 无法解决回旋查找问题
+ 添加节点的效率过低，发生旋转时容易发生

**Disadvantages:**

+ The depth of the tree is too high
+ Unable to resolve the roundabout lookup problem
+ The efficiency of adding nodes is too low, which is easy to occur when rotation occurs

##### Red Black Tree(红黑树)

红黑树是一种自平衡二叉查找树，是计算机中用到的一种数据结构。每一个节点可以是红或者黑；红黑树不是通过高度平衡的，它的平衡是通过 `红黑规则` 进行实现的。

>The red-black tree is a self-balanced binary search tree, which is a data structure used in computers. Each node can be red or black; The red-black tree is not balanced by height. Its balance is achieved by the `red-black rule`.

![红黑树图](./Images%20Database/RedBlackTree.PNG)

**红黑规则：**

+ 每一个节点为红色或黑色，根节点必须是黑色的。
+ 如果某一个节点是红色，那么它的子节点必须是黑色的（不能出现两个红色节点相连的情况）。
+ 对每一个节点，从该节点到其所有后代叶节点的简单路径上，均包含相同数目的黑色节点。
+ 如果一个节点没有子节点或者父节点，则该节点的相应指针属性值为 `NULL` ，这些 `NULL` 都视为叶节点，叶节点是黑色。

**Red and black rules:**

+ Each node is red or black, and the root node must be black.
+ If a node is red, its child nodes must be black (two red nodes cannot be connected).
+ For each node, the simple path from this node to all its descendant leaf nodes contains the same number of black nodes.
+ If a node has no child node or parent node, the corresponding pointer attribute value of the node is `NULL`. These `NULL` are considered as leaf nodes, and the leaf nodes are black.

**添加节点：**

+ 添加的节点颜色，可以是红色也可以是黑色
+ 默认使用红色效率高

**Add node:**

+ The added node color can be red or black
+ It is efficient to use red by default

##### B Tree(B 树)

B 树又称为多路平衡树，在树的基础上对节点进行横向拉伸。

> B-tree is also called multi-channel balanced tree, which stretches nodes horizontally on the basis of the tree.

**特点：**

+ 所有键值分布在整棵树中（索引值与具体 data 都在每个节点里）
+ 任何一个关键字出现且只出现在一个节点中
+ 搜索可能在非叶子节点结束
+ 在关键字全集内做一次查找，性能接近二分查找

**Features:**

+ All key values are distributed in the whole tree (index values and specific data are in each node)
+ Any keyword appears in only one node
+ Search may end at a non-leaf node
+ Perform a search in the complete set of keywords, and the performance is close to binary search

![B树图](./Images%20Database/BTree.PNG)

**规则：**

+ 每个结点最多有 m 棵子树（m 为阶）。
+ 除根节点外，其他每个分支节点至少 `ceiling` (m/2) 棵子树【ceiling 表示向上取整】。
+ 根节点至少包含两棵子树（除非 B 树只包含一个节点）。
+ 所有叶子节点在同一层上，B 树叶子节点可以是外部节点，不包含任何信息。
+ 有 j 个孩子的非叶子节点恰好有 j-1 个关键字，关键字按递增次序排列。

**Rules:**

+ Each node can have up to m subtrees (m is the order).
+ Except for the root node, each branch node has at least 'ceiling' (m/2) subtrees [ceiling means rounding up].
+ The root node contains at least two subtrees (unless the B-tree contains only one node).
+ All leaf nodes are on the same layer, and B-tree leaf nodes can be external nodes that do not contain any information.
+ A non leaf node with j children happens to have j-1 keywords, which are arranged in ascending order.

##### B + Tree

也是一种多路搜索树

**m 阶 B+ 树特点：**

+ 每个节点至多有 m 个子女。
+ 非根节点关键值个数范围：`ceiling(m/2)-1 <= k <= m-1` 。
+ 相邻叶子节点是通过指针连起来，且按关键字大小排序。

**M-level B+tree features:**

+ Each node can have up to m children.
+ The range of key values for non root nodes: `ceiling (m/2) - 1<=k<=m-1` .
+ Adjacent leaf nodes are connected by pointers and sorted by keyword size.

![B+树图](./Images%20Database/B+Tree.PNG)

### 1.2 Index

**聚集索引：**

+ 该索引中键值的逻辑顺序决定了表中相应的物理顺序
+ 聚焦索引是物理地址连续存放的索引
+ 只能有一个，一般为主键（主键一定是聚集索引，聚集索引不一定是主键）
+ 建表时没有设置主键，此时建立了聚集索引再设立主键，那么该主键就不是聚集索引

**Clustered index:**

+ The logical order of key values in the index determines the corresponding physical order in the table
+ The focus index is an index that continuously stores physical addresses
+ There can only be one, usually the primary key (the primary key must be a clustered index, and the clustered index must not be a primary key)
+ The primary key is not set when the table is created. If the primary key is set after the clustered index is created, the primary key is not a clustered index

**非聚集索引：**

非聚集索引是表中记录的物理顺序和逻辑顺序不同的索引，可以有多个。

**`Nonclustered index` :**
A nonclustered index is an index with different physical and logical order of records in a table, and can have multiple indexes.

**特点：**

+ 每张表上最大的聚集索引数为1
+ 每张表上最大的非聚集索引数为999
+ 每个索引最多能包含的键列数为16
+ 索引键记录大小最多为900字节

**Features:**

+ The maximum number of clustered indexes on each table is 1
+ The maximum number of non-clustered indexes on each table is 999
+ The maximum number of key columns per index is 16
+ Index key record size is up to 900 bytes

#### 1.2.1 Index data structure（索引数据结构）

在 `SQL Server` 数据库中，索引的存储是以B+树（(注意和二叉树的区别)结构来存储的，又称索引树，其节点类型为如下两种:

+ 索引节点(Key) 。
+ 叶子节点( Key + Value)。

索引节点按照层级关系，有时又可以分为根节点和中间节点，其本质是一样的，都只包含下一层节点的入口值和入口指针。

叶子节点就不同了，它包含数据，这个数据可能是表中真实的数据行，也有可能是索引列值和行书签，前者对应于聚集索引，后者对应于非聚集索引。

B+Tree:一种数据结构(也是一种多路平衡搜索树)

数据页:数据库保存数据的最小单位。( `SQL Server` 一个数据页的大小是8K，一个表中所有的数据都被保存到一个个的数据页中)

索引组织表: 一张表有聚集索引就是索引组织表(把表中的数据页以 B+ Tree 的方式组织起来)索引表:一个索引对应一张索引表，索引表中每条数据都对应一张数据页

In a `SQL Server` database, indexes are stored in a B+tree (note the difference between a binary tree and a binary tree) structure, also known as an index tree, with the following two node types:

+ Index node (Key).
+ Leaf node (Key+Value).

Index nodes can be divided into root nodes and intermediate nodes according to hierarchical relationships, and their essence is the same. They only contain the entry values and entry pointers of the nodes at the next level.

Leaf nodes are different. They contain data, which may be actual data rows in a table, or index column values, which correspond to clustered indexes, and row labels, which correspond to non clustered indexes.

B+Tree:  A data structure (also a multi way balanced search tree)

Data Page: The smallest unit in which a database stores data. "The size of a data page in `SQL Server` is 8K, and all data in a table is saved to data pages one by one."

Index organization table: A table with a clustered index is an index organization table (organizing the data pages in the table in a B+Tree manner) Index table: An index corresponds to an index table, and each data in the index table corresponds to a data page

#### 1.2.2 Why choose B+tree? （为什么选择 B+ 树）

1、B+树的磁盘读写代价更低:B+树的内部节点并没有指向关键字具体信息的指针，因此其内部节点相对B树更小，如果把所有同一内部节点的关键字存放在同一盘块中，那么盘块所能容纳的关键字数量也越多，一次性读入内存的需要查找的关键字也就越多，相对IO读写次数就降低了。

2、B+树的查询效率更加稳定:由于非终结点并不是最终指向文件内容的结点，而只是叶子结点中关键字的索引。所以任何关键字的查找必须走一条从根结点到叶子结点的路。所有关键字查询的路径长度相同，导致每一个数据的查询效率相当。

3、由于B+树的数据都存储在叶子结点中，分支结点均为索引，方便扫库，只需要扫一遍叶子结点即可，但是B树因为其分支结点同样存储着数据，我们要找到具体的数据，需要进行一次中序遍历按序来扫，所以B+树更加适合在区间查询的情况，所以通常B+树用于数据库索引。

数据库索引采用B+树的主要原因是: B树在提高了 `IO` 性能的同时并没有解决元素遍历效率低下的问题，正是为了解决这个问题，B+ 树应用而生。B+ 树只需要去遍历叶子节点就可以实现整棵树的遍历。而且在数据库中基于范围的查询是非常频繁的，而B树不支持这样的操作或者说效率太低。

1. "The disk read and write cost of a B+tree is lower: The internal nodes of a B+tree do not have pointers to specific information about keywords, so their internal nodes are smaller than those of a B tree. If all the keywords of the same internal node are stored in the same disk block, the more key words the disk block can hold, the more keywords that need to be searched for once to read into memory, and the relative IO read and write times are reduced.".
2. The query efficiency of B+trees is more stable: Because non endpoints are not the nodes that ultimately point to the file content, they are only the index of keywords in the leaf nodes. Therefore, any keyword search must follow a path from the root node to the leaf node. The path length for all keyword queries is the same, resulting in equivalent query efficiency for each data.
3. "Because the data of a B+tree is stored in leaf nodes, and the branch nodes are all indexes, which is convenient for scanning the database. It is only necessary to scan the leaf nodes once. However, because the branch nodes of a B tree also store data, we need to perform a middle order traversal to scan the specific data in order. Therefore, B+trees are more suitable for querying in intervals, so B+trees are usually used for database indexing.".
The main reason for using B+trees for database indexing is that B trees improve the 'IO' performance while not solving the problem of inefficient element traversal. It is precisely to solve this problem that B+trees are applied. A B+tree only needs to traverse leaf nodes to traverse the entire tree. Moreover, range based queries are very frequent in databases, and B-trees do not support such operations or are inefficient.

#### 1.2.3 Index design principles （索引设计原则）

1. 索引也是需要空间存储，索引太多意味着占用的空间也越多。
2. 索引页也需要系统维护，在增、删、改数据时索引需要重新编排。就好像一本书某一页被撕掉了，对应的目录也需要重新进行编排。
3. 索引堆积久了，由于维护数据过程中会产生过多的索引碎片，反而不利于数据查询。

1. Indexes also require spatial storage. Too many indexes mean that they occupy more space.
2. The index page also requires system maintenance, and the index needs to be reorganized when adding, deleting, or modifying data. It's like a page in a book is torn off, and the corresponding table of contents needs to be rearranged.
3. Indexes accumulate for a long time, and excessive index fragments may be generated during data maintenance, which is not conducive to data query.

**When is indexing established?（什么情况下建立索引）：**

1. 主键一定要建 `The primary key must be created.`

2. 外键一定要 `Foreign keys are essential.`

3. 经常查询的列 `Frequently queried columns.`
4. 经常用作查询条件的列 `Columns frequently used as query criteria.`
5. 经常用在 `order by`, `group by`, `distinct` 后面的列
6. 重复值比较多的列不能建立索引 `Columns with more duplicate values cannot be indexed.`
7. 对于 `text`, `image`, `bit` 这些类型的字段不能建立索引
8. 经常存取的列不要建立索引 **Do not index frequently accessed columns.**

#### 1.2.4 Use index（使用索引）

```sql
-- 创建索引的语法
-- Syntax for creating an index
CREATE [unique] [clustered / nonclustered]
index index_name
on table_name(column_name1, ……)
```

`unique` 唯一索引

`clustered` 聚集索引

`nonclustered` 非聚集索引

``` sql
-- 建立聚集索引	Building a clustered index
create clustered index id_userinfo_Id on UserInfo(Id);

-- 建立非聚集索引	Building a non clustered index
create nonclustered index id_userinfo_Account on UserInfo(Account);

-- 创建唯一非聚集索引	Create a unique non clustered index
create unique nonclustered index id_userinfo_Pwd on UserInfo(Pwd);

-- ☆ unique 索引字段必须唯一，但可以有一个值为 NULL
-- ☆ The unique index field must be unique, but can have a value of NULL.
```

```sql
-- 重命名索引	Rename Index
-- exec sp_rename '表名.旧索引名','新索引名', 'index';

-- 删除索引	Delete Index
-- drop index index_name on table_name;

-- 重建索引	Reindex
-- alter index index_name on table_name rebuild
```



### 1.3 View（视图）

`作用` 提高安全性；简化查询过程

`本质` 相当于封装好的 `SQL` 

`Function` Improve safety; Simplify the query process
`essence` Equivalent to packaged ` SQL`

```sql
-- 创建视图
Create view view_name
as
select column_name from table_name [where……]

-- 例
create view view_studentscore
as
select a.*,b.Degree,c.cno,cname , d.*from student a
inner join score b on a.sno=b.Sno
inner join course c on b.cno=c.Cno
inner join Teacher d on c.Tno=d.Tno

-- 使用视图
select * from view_studentscore

-- 修改视图
alter view v_studentscore
-- with encryption --加密。加密后注意保存代码
as
select a.*,b.Degree,c.cno,Cname ,d.* from student a
inner join score b on a.Sno=b. Sno
inner join course c on b.cno=c.Cno
inner join Teacher d on c.Tno=d.Tno

-- 删除视图
drop view view_name
```

## 2. Transaction(事务)

什么是事务: 在实际的开发过程中，一个业务操作如:转账，往往是要多次访问数据库才能完成的。转账是一个用户扣钱，另一个角户加钱。如果其中有一条 `SQL` 语句出现异常，这条 `SQL` 就可能执行失败。事务执行是一个整体，所有的 `SQL` 语句都必须执行成功。如果其中有1条 `SQL` 语句出现异常，则所有的 `SQL` 语句都要回滚，整个业务执行失败。

What is a transaction? In the actual development process, a business operation, such as transfer, often requires multiple accesses to the database to complete. Transfer is where one user deducts money and another corner account adds money. If an exception occurs in one of the `SQL`'statements, the `SQL` statement may fail to execute. Transaction execution is a whole, and all `SQL` statements must be executed successfully. If an exception occurs in one of the `SQL` statements, all `SQL` statements will be rolled back, and the entire business execution will fail.

```sql
-- transaction / tran

-- 模拟转账操作
begin transaction -- 开启事务
begin try	-- try语句
	-- 需要执行的 SQL 语句
	update account set balance=balance-1000 where name='广东曹贼';
	update account set balance=balance+1000 where name='东北孙权';
	commit;	-- 提交事物
end try	-- 结束try
begin catch	-- catch语句
	rollback;	-- 回滚事务
end catch
```

`原理` 事务开启之后，所有的操作都会临时保存到事务日志中，事务日志只有在得到 `commit` 命令才会同步到数据表中，其他任何情况都会清空事务日志(`rollback`，断开连接)

`执行步骤` 

1. 客户端连接数据库服务器，创建连接时创建此用户临时日志文件
2. 开启事务以后，所有的操作都会先写入到临时日志文件
3. 所有的查询操作从表中查询，但会经过日志文件加工后才返回
4. 如果事务提交则将日志文件中的数据写到表中，否则清空日志文件。

`事物特性`

+ Atomic(原子性)︰事务中包含的操作被看做一个逻辑单元，这个逻辑单元中的操作要么全部成功，要么全部失败。
+ Consistency (一致性)︰事务完成时，数据必须处于一致状态，数据的完整性约束没有被破坏，事务在执行过程中发生错误，会被回滚(Rollback)到事务开始前的状态，就像这个事务从来没有执行过一样。如: 转账前2个人的总金额是2000，转账后2个人总金额也是2000。
+ Isolation(隔离性)∶事务允许多个用户对同一个数据进行并发访问，而不破坏数据的正确性和完整性。同时，并行事务的修改必须与其他并行事务的修改相互独立。
+ Durability (持久性)∶事务结束后，事务处理的结果必须能够得到固化(永久存储到数据库中了)。就算断电了，也是保存下来的。

### 2.1 事务的隔离

事务在操作时的理想状态：所有的事务之间保持隔离，互不影响。因为并发问题，多个用户同时访问同一个数据从而引发的问题。

| 并发访问问题 | 含义 |
| :--- | :--- |
| 脏读 | 一个事务读取到另一个事务中尚未提交的数据 |
| 不可重复读 | 一个事务中两次读取的数据内容不一致，要求的是一个事务中多次读取时数据是一致的，这是事务 update 时引发的问题 |
| 幻读 | 一个事务中两次读取的数据的数量不一致，要求在一个事务多次读取的数据的数量是一致 |

**隔离级别** 

1~4，1级最低。“是” 表示会出现这种问题，“否” 表示不会出现这种问题

| 级别     | 名称     | 隔离级别         | 脏读 | 不可重复读 | 幻读 |
| -------- | -------- | ---------------- | ---- | ---------- | ---- |
| 1        | 读未提交 | read uncommitted | 是   | 是         | 是   |
| 2        | 读已提交 | read committed   | 否   | 是         | 是   |
| 3        | 可重复读 | repeatable read  | 否   | 否         | 是   |
| 4        | 串行化   | serializable     | 否   | 否         | 否   |
| 2~3 之间 | 快照     | SNAPSHOT         | 否   | 否         | 否   |

> 隔离级别越高，性能越差，安全性越高。
>
> ```sql
> -- 查看当前隔离级别
> DBCC Useroptions;
> 
> -- 设置隔离级别
> set transaction isolation level [隔离级别]
> 
> -- 例
> set transaction isolation level read uncommitted
> 
> ```

### 2.2 事务的快照

`SNAPSHOT` 快照: `SNAPSHOT` 和 `READ COMMITTED SNAPSHOT` 两种隔离(可以把事务已经提交的行的上一版本保存在 `TEMPDB` 数据库中)

`SNAPSHOT` 隔离级别在逻辑上与 `SERIALIZABLE`类似

`READ COMMITTED SNAPSHOT` 隔离级别在逻辑上与 `READ COMMITTED` 类似

不过在快照隔离级别下读操作不需要申请获得共享锁，所以即便是数据已经存在排他锁也不影响读操作。而且仍然可以得到和``SERIALIZABLE` 与 `READ COMMITTED` 隔离级别类似的一致性;如果目前版本与预期的版本不一致，读操作可以从 `TEMPDB` 中获取预期的版本。

如果启用任何一种基于快照的隔离级别，DELETE和UPDATE语句在做出修改前都会把行的当前版本复制到 `TEMPDB` 中，而INSERT语句不需要在 `TEMPDB` 中进行版本控制，因为此时还没有行的旧数据

| 事务ID | 数据ID | 数据版本                                        |
| ------ | ------ | ----------------------------------------------- |
| １     | １     | 1（快照）                                       |
| ２     | １     | 2（如果版本不一致，则事务将会获取版本１的数据） |

**作用:**

+　读操作时不会陷入block和死锁的问题中，SNAPSHOT本身提高了数据库系统的事务处理的性能。

+　避免了脏读，非一致性读，以及丢失更新，和不可重复读等多个问题

## 3. Lock(锁)

锁是多用户访问同一数据库资源时，对访问的先后次序权限管理的机制

分类

+　共享锁
+　排他锁
+　更新锁
+　架构锁
+　意向锁
+　大容量锁

`悲观锁`

总是假设最坏的情况，每次去拿数据的时候都认为别人会修改，所以每次在拿数据的时候都会上锁，这样别人想拿这个数据就会阻塞直到它拿到锁（**共享资源每次只给一个线程使用，其它线程阻塞，用完后再把资源转让给其它线程**)。传统的关系型数据库里边就用到了很多这种锁机制，比如行锁，表锁等，读锁，写锁等，都是在做操作之前先上锁。

`乐观锁`

总是假设最好的情况，每次去拿数据的时候都认为别人不会修改，所以不会上锁，但是在更新的时候会判断一下在此期间别人有没有去更新这个数据，可以使用版本号机制和 `CAS` 算法实现。**乐观锁适用于多读的应用类型，这样可以提高吞吐量**，像数据库提供的类似于`write_condition机制`，其实都是提供的乐观锁。

###  3.1 `rowlock`（行锁）

```sql
-- 关键字 rowlock
select colName from TabelName rowlock [where id=1]

-- 在 SQL 语句添加关键字 rowlock 会将该语句的内容锁住
-- 仍然可以操作该表中的其他内容
-- 不加 where 条件则将整个表锁住
```



### 3.2 `tableLockX`（表锁）

```sql
-- 关键字 tableLockX
select colName from TableName tableLockX where id=2

-- 在 SQL 语句添加关键字 tableLockX 会将该表锁住
-- 无法操作其他内容
-- where 条件不会限制锁住的内容
```



### 3.3 `S 锁`（共享锁）

共享锁是用于读取数据操作，允许多个事务读取相同的数据，但不允许其他事务修改当前数据。

```sql
-- 窗口1（添加共享锁)
begin tran
select * from account with(ho1d1ock) where id=1;
waitfor delay '00:00: 10';
commit;

-- 窗口2(可读)
begin tran
select * from account where id=1;
commit;

-- 窗口3（等待窗口1结束，才可执行)begin tran
update account set balance=500 where id=1;
commit;

```

### 3.4 Exclusive Locks（排他锁，简称X锁）

又称为独占锁，当事务对数据资源进行增删改操作时，不允许其它任何事务操作这块资源(可以读取)。防止对同一资源进行多重操作。

```sql
-- 窗口1
begin tran;
update account set balance=500 where id=1; -- 更新锁自动转换为排它锁
-- 等效于update account with(updlock) set balance=500 where id=1
waitfor de1ay '00:00:10';
commit;

-- 窗口2(可读)
begin tran;
select * from account;
commit;

-- 窗口3（等待窗口1结束才会执行）
begin tran
update account set balance=1500 where id=1;
commit;

```

### 3.5 更新丢失

第一类丢失更新(通过设置隔离级别可以防止 Repeatable Read)

+ A事务撤销时，把已经提交的B事务的更新数据覆盖了。这种错误可能造成很严重的问题。

第二类丢失更新(需要应用程序控制，乐观锁)

+ A事务覆盖B事务已经提交的数据，造成B事务所做操作丢失。

**更新锁**

目前更新丢失问题目前无法重现，因为系统在执行update语句时，会自带更新锁，在更新数据时，会将更新锁自动转换为排它锁(别人只能读)。

```sql
update account with(upd1ock) set bal1ance=1000 where id=1
```

###  3.6 死锁

在多个任务中，每个任务锁定了其他任务试图锁定的资源，会造成这些任务永久阻塞，从而出现死锁，此时系统处于死锁状态。

```sql
-- 窗口1(发生死锁)
begin tran;
update account set balance=500 where id=1;
waitfor delay '0:0:10'
update account set balance=1500 where id=2;
commit;

-- 窗口2(执行成功)
begin tran;
update account set balance=1500 where id=2;
waitfor delay 'o:0:8 '
update account set balance=500 where id=1;
commit;

```

**如何减少死锁**

1. 在所有事务中以相同的次序使用资源

2. 使事务尽可能简短并且在一个批处理中

3. 避免在事务内和用户进行交互，减少资源的锁定时间
4. 为死锁超时参数设置一个合理范围

## 4. 事务与锁的关系

事务与锁是不同的。

1. 事务具有ACID（原子性、一致性、隔离性和持久性)，锁是用于解决隔离性的一种机制。

2. 事务的隔离级别通过锁的机制来实现。

3. 另外锁有不同的粒度，同时事务也是有不同的隔离级别的(一般有四种:读未提交 `Read uncommitted`，读已提交 `Read committed`，可重复读Repeatable read，可串行化 `serializable `)。

在具体的程序设计中，开启事务其实是要数据库支持才行的，如果数据库本身不支持事务，那么仍然无法确保你在程序中使用的事务是有效的。锁可以分为乐观锁和悲观锁:悲观锁:认为在修改数据库数据的这段时间里存在着也想修改此数据的事务;乐观锁:认为在短暂的时间里不会有事务来修改此数据库的数据;我们一般意义上讲的锁其实是指悲观锁，在数据处理过程中，将数据置于锁定状态（由数据库实现)。回到你的问题，如果开启了事务，在事务没提交之前，别人是无法修改该数据的;如果rollback，你在本次事务中的修改将撤消（不是别人修改的会没有，因为别人此时无法修改)。当然，前提是你使用的数据库支持事务。还有一个要注意的是，部分数据库支持自定义SQL锁覆盖事务隔离级别默认的锁机制，如果使用了自定义的锁，那就另当别论。重点:一般事务使用的是悲观锁(具有排他性)。

## 5. `T-SQL` 编程

```sql
create database Company;
go

use Company;
go

-- 部门表
CREATE TABLE [dbo].[Department](
    [Id][int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [Name] [varchar](20) NULL
);

-- 职位表
CREATE TABLE [dbo].[Job](
    [Id][int] PRIMARY KEY IDENTITY(1,1)NOT NULL,
    [Name] [varchar](20)NULL
);

-- 人员表
CREATE TABLE [dbo].[Person](
    [Id] [int] PRIMARY KEY IDENTITY(1, 1)NOT NULL,
    [Name][varchar](50) NULL,
    [sex] [varchar](10)NULL,
    [Age] [int] NULL
);

-- 工资表
CREATE TABLE [dbo].[Salary](
    [Id] [int] PRIMARY KEY IDENTITY(1, 1)NOT NULL,
    [sal][money] NULL,
    [comm] [money] NULL,
    [staffId] [int] NULL
);

-- 员工表
CREATE TABLE [dbo].[Staff](
    [Id] [int] PRIMARY KEY IDENTITY(1, 1)NOT NULL,
    [Name] [varchar](20)NOT NULL,
    [Hiredate] [datetime] NOT NULL,
    [DepartmentId] [int] NULL,
    [JobId] [int] NULL
);

SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'技术部')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'人资部')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (3, N'市场部')
SET IDENTITY_INSERT [dbo].[Department] OFF

SET IDENTITY_INSERT [dbo].[Job] ON
INSERT [dbo].[Job] ([Id], [Name]) VALUES (1, N'经理')
INSERT [dbo].[Job] ([Id], [Name])VALUES (2, N'组长')
INSERT [dbo].[Job] ([Id], [Name]) VALUES (3, N'员工')
SET IDENTITY_INSERT [dbo].[Job] OFF

SET IDENTITY_INSERT [dbo].[Person] oN
INSERT [dbo].[person] ([Id], [Name], [Sex], [Age])VALUES(1, N'高圆圆', N'女', 28)
INSERT [dbo].[person]([Id], [Name], [Sex], [Age]) VALUES(2, N'王佳佳', N'女', 32)
INSERT [dbo].[person]([Id], [Name], [Sex], [Age])VALUES(3, N'杨硕', N'男', 25)
SET IDENTITY_INSERT [dbo].[person] OFF

SET IDENTITY_INSERT [dbo].[Salary] oN
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES (1, 15000.0000, 10000.0000, 1)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES(2, 15000.0000, 9000.0000, 2)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES (3, 12000.0000, 8000.0000, 3)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES(4, 8000.0000, 6000.0000, 4)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES (5, 4000.0000, 3000.0000, 5)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES (6, 9000.0000, 8000.0000, 6)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES(7, 15000.0000, 12000.0000, 7)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES(8, 12000.0000, 9000.0000, 7)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES (9, 7000.0000, 2000.0000, 9)
INSERT [dbo].[Salary]([Id], [sal], [comm], [staffId]) VALUES (10, 9000.0000, 8000.0000, 10)
SET IDENTITY_INSERT[dbo]. [salary] OFF

SET IDENTITY_INSERT [dbo].[Staff] oN
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(1, N'王鑫', CAST(N'2014-02-01 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(2, N'张磊', CAST(N'2015-09-03 00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(3, N'李鹏', CAST(N'2016-08-01 00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(4, N'王洋', CAST(N'2019-02-03 00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(5, N'吴潘', CAST(N'2018-10-01 00:00:00.000' As DateTime), 2, 3)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(6, N'贾丹', CAST(N'2018-07-01 00:00:00.000 'AS DateTime), 2, 2)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(7, N'李露', CAST(N'2016-09-01 00:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(8, N'杨腾', CAST(N'2018-11-08 00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(9, N'孙艺', CAST(N'2018-12-26 00:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Staff]([Id], [Name], [Hiredate], [DepartmentId], [JobId])VALUES(10, N'赵帅', CAST(N'2019-01-03 00:00:00.000' As DateTime), 1, 3)
SET IDENTITY_INSERT [dbo].[staff] OFF
```

### 5.1 `T-SQL` 命名规则

1. 开头不能是数字，空格或特殊字符 => 数据库名称、数据表、变量
1. 首字符必须是`英文字母`、`数字`、`_`、`@`、`#`
2. 首字符后可以包含`字母`、`数字`、`汉字`、`_`、`@`、`#` 、`$` 
3. 不能是关键字

> `@` : 两个 `@` 开头作为全局变量
>
> `#`  :  `#`  开头的表是临时表

### 5.2 变量

**全局变量**

>`@@ERROR` 返回执行的上一个 `T-SQL` 语句的错误号
>
>`@@IDENTITY` 返回插入到表的IDENTITY列的最后一个值
>
>`@@LANGUAGE` 返回当前所用语言的名称
>
>`@@MAX_CONNECTIONS` 返回 `sq1 server`实例允许同时进行的最大用户连接数 
>
>`@@ROWCOUNT`返回上一次语句影响的数据行的行数
>
>`@@SERVERNAME` 返回运行 `sq1 server` 的本地服务器的名称
>
>`@@SERVTCENAME` 返回 `Sql server` 正在其下运行的注册表项的名称
>
>`@@TIMETICKS` 返回每个时钟周期的微秒数
>
>`@@TRANCOUNT` 返回当前连接的活动事务数
>
>`@@VERSION` 返回当前安装的日期、版本和处理器类型



**局部变量**

> ☆：定义局部变量必须以 `@` 符号开头
