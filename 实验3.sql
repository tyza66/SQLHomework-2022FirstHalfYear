USE Lib;
/*
一、创建数据库Lib及表。
图书(总编号，分类号，书名，作者，出版单位，单价)
读者(借书证号，单位，姓名，性别，职称,地址)
借阅(借书证号，总编号，借书日期)
*/
CREATE TABLE Book(
Bno INT PRIMARY KEY,
Bclassification INT,
Bname CHAR(30),
Bauther CHAR(50),
BpublishingUnit CHAR(50),
BunitPrice INT
);
CREATE TABLE Reader(
Rno INT PRIMARY KEY,
Rcompany CHAR(50),
Rname CHAR(10),
Rgender CHAR(3),
Rtitle CHAR(20),
Raddress CHAR(50)
);
CREATE TABLE Borrow(
Rno INT,
Bno INT PRIMARY KEY,
Bdate DATE
);
--在表中插入几条记录为了方便作业中测试
INSERT INTO Book VALUES(1,1,'红楼梦','曹雪芹','高等教育出版社',100);
INSERT INTO Book VALUES(2,2,'西游记','吴承恩','高等教育出版社',10);
INSERT INTO Book VALUES(3,3,'数据库原理','孙小明','锦州出版社',10);

INSERT INTO Reader VALUES(123456,'渤海大学图书馆','赵丹','女','图书管理员','辽宁省锦州市渤大');
INSERT INTO Reader VALUES(123457,'渤海大学','李广','男','讲师','辽宁省锦州市渤大');

INSERT INTO Borrow VALUES(123456,1,'2021-11-2');
INSERT INTO Borrow VALUES(123456,2,'2021-11-2');
INSERT INTO Borrow VALUES(123456,3,'2012-11-2');
/*
二、完成如下操作：
1、分别浏览3个表中的所有数据；
2、查询出读者“赵丹”借阅的所有图书的书名。
3、检索单价大于30元的书名和出版单位。
4、查询“图书”表中书名包含“数据库”、单价不高于40元的图书信息。
5、检索职称为“讲师”的所有读者信息。
6、查询 “图书”表中"高等教育出版社"出版的图书的最高价、最低价和平均价。
7、检索每个出版社的图书的平均价格，结果包括出版单位和平均价格，记录按平均价格降序排列。
8、分组统计出2014年底以前借阅的、借阅数量不低于3本的借书人姓名和借阅数量。
9、检索在2014年12月31日以后借阅图书的所有读者的姓名和部门名称（结果不包括重复记录）
10、试用SQL命令根据借阅表建立一个视图V_DAY，统计出到目前为止图书已经借阅的天数（视图中包括 “借书证号、总编号和天数”三个字段）。
11、将图书信息（’ 13010011’,’301’,‘计算机视觉’，‘王华’，‘清华大学出版社’，35）插入到图书表中。
*/
--1
SELECT * FROM Book;
SELECT * FROM Borrow;
SELECT * FROM dbo.Reader;

--2
SELECT Bname 赵丹借的书 FROM Book WHERE Bno IN(SELECT Bno FROM Borrow WHERE Rno=(SELECT Rno FROM Reader WHERE Rname = '赵丹'));

--3
SELECT Bname,BpublishingUnit FROM Book WHERE BunitPrice > 30;

--4
SELECT * FROM Book WHERE Bname LIKE '%数据库%';

--5
SELECT * FROM Reader WHERE Rtitle = '讲师';

--6
SELECT MAX(BunitPrice) 最高价,MIN(BunitPrice) 最低价,AVG(BunitPrice) 平均价 FROM Book WHERE BpublishingUnit = '高等教育出版社';

--7
SELECT BpublishingUnit 出版社,AVG(BunitPrice) 平均价格 FROM Book GROUP BY BpublishingUnit ORDER BY AVG(BunitPrice) DESC;
--8
SELECT Rname 姓名, COUNT(*) 借书数量 FROM Reader a , Borrow b WHERE a.Rno = b.Rno AND b.Bdate <= '2014-12-31' AND COUNT(*) >= 3 GROUP BY a.Rname;

--9
SELECT DISTINCT a.Rname 姓名, a.Rtitle 部门名称 FROM Reader a , Borrow b WHERE a.Rno = b.Rno AND b.Bdate >= '2014-12-31';

--10
CREATE VIEW V_DAY AS SELECT Rno 借书证号,Bno 总编号,DATEDIFF(DAY,Bdate,'2022-3-31') 天数 FROM Borrow;

--11
INSERT INTO Book VALUES(13010011,301,'计算机视觉','王华','清华大学出版社',35);