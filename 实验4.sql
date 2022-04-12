create table Student(
sno char(20) primary key,
sname char(20),
ssex char(20),
sage int,
sdept char(200)
);
create table Course(
cno char(20) primary key,
cname char(20),
cpno char(20),
ccredit int
);
create table sc(
sno char(20) ,
cno char(20),
grade int
);
INSERT INTO Student  VALUES('200215122','李海霞','女',20,'数学');
INSERT INTO Student  VALUES('200212129','赵扩','女',19,'计算机科学与技术');
INSERT INTO Student  VALUES('200212130','李想','男',18,'通信工程');
INSERT INTO Student  VALUES('200212131','徐闻','男',21,'通信工程');
INSERT INTO Student  VALUES('200215123','林红','女',21,'软件工程');
INSERT INTO Student  VALUES('200215126','张海洋','男',19,'软件工程');
INSERT INTO Student  VALUES('200215127','杨洋','女',22,'软件工程');
INSERT INTO Student  VALUES('200215121','李广','男',21,'数学');

INSERT INTO Course  VALUES('1','计算机基础',null,3);
INSERT INTO Course  VALUES('2','C语言程序设计','1',4);
INSERT INTO Course  VALUES('3','数学',null,2);
INSERT INTO Course  VALUES('4','信息系统',null,4);
INSERT INTO Course  VALUES('5','数据库','2',4)
INSERT INTO Course  VALUES('6',' 操作系统','1',3);
INSERT INTO Course  VALUES('7','数据结构','2',4);

INSERT INTO sc  VALUES('200212131','1',70);
INSERT INTO sc  VALUES ('200215123','1',84);
INSERT INTO sc  VALUES ('200215123','4',95);
INSERT INTO sc  VALUES('200215128','1',40);
INSERT INTO sc  VALUES ('200212129','1',59);
INSERT INTO sc  VALUES('200212130','1',60);
INSERT INTO sc  VALUES ('200212128','2',94);
INSERT INTO sc  VALUES('200215121','2',92) ;                   
INSERT INTO sc  VALUES('200215122','2',85);
INSERT INTO sc  VALUES('200212131','2',69);
INSERT INTO sc  VALUES('200215123','2',94);
INSERT INTO sc  VALUES('200215127','2',50);
INSERT INTO sc  VALUES('200215122','3',48);
INSERT INTO sc  VALUES('200215121','3',55);
INSERT INTO sc  VALUES( '200215127','3',78);
INSERT INTO sc  VALUES('200215122','4',90);
INSERT INTO sc  VALUES('200215121','4',87);
INSERT INTO sc  VALUES ('200212131','4',75);
INSERT INTO sc  VALUES ('200212131','5',null);

/*
一、创建ST学生选课数据库，打开“创建学生选课表.txt”，将命令拷入“查询”窗口中，执行相关命令，创建数据库及表。
二、观察对象资源管理器，看有什么变化。
三、在查询窗口完成如下操作：
*/
USE 实验4;
--1、对“学生”表按性别进行分组，查询相应的人数。
SELECT Ssex 性别,COUNT(*) 人数 FROM Student GROUP BY Ssex;
--2、在“选课”表中查询选修两门以上（含两门）课程的学生的学号和选课门数。
SELECT Sno 学号,COUNT(*) 选课数 FROM sc GROUP BY Sno HAVING COUNT(*)>=2;
--3、求每个同学的成绩总和
SELECT Sno 学号,SUM(grade) 成绩总和 FROM sc GROUP BY Sno;
SELECT SUM(grade) 所有成绩总和 FROM sc;
--4、查询每个学生的学号及其选修课程的平均分。
SELECT Sno 学号,AVG(grade) 平均分 FROM sc GROUP BY Sno;
--5、查询每个学生的姓名、课程号和成绩。
SELECT Sname 姓名,Cno 课程号,grade 成绩 FROM Student s,sc c WHERE s.Sno = c.Sno;
--6、查询“学生”表中的学号、姓名、年龄，将查询结果存放在新建表“学生年龄”中。
SELECT Sno,Sname,Sage INTO StudentAge FROM Student;
--7、查询没有考试成绩的学生的学号和课程号。
SELECT Sno 学号,Cno 课程号 FROM sc WHERE grade is null;
--8、查询“学生”表中的学生信息，查询结果集按年龄升序排列。
SELECT * FROM Student ORDER BY Sage;
--9、查询“学生”表中的学生信息，查询结果集先按性别升序排列，然后再按照按出生年份降序排列。为了方便查看结果，输出“出生年份”计算列。
SELECT *,(2022-Sage) 出生年份 FROM Student ORDER BY Ssex,(2022-Sage) desc;
--10、查询每个学生及其选修课程的成绩情况（含未选课的学生信息）。
SELECT s.*,Cno 课程号,grade 成绩 FROM Student s LEFT JOIN sc c ON s.sno = c.sno;
--11、查询成绩在分以上的学生的学号、姓名、课程名、成绩。
SELECT s.Sno 学号,Sname 姓名,Cname 课程名,grade 成绩 FROM Student s,sc c,Course o WHERE s.Sno = c.Sno AND c.cno = o.cno;
--12、查询与“杨洋”在同一个专业学习的学生的学号、姓名和专业。
SELECT Sno 学号,Sname 姓名,Sdept 专业 FROM Student WHERE Sdept = (SELECT Sdept FROM Student WHERE Sname = '杨洋');
--13、查询选修了“2”号课程的学生的姓名和所在专业。
SELECT Sname 姓名,Sdept 所在专业 FROM Student s,sc c WHERE s.Sno = c.Sno AND cno = '2';
--14、查询选修了“3”号课程或“4”号课程的学生的姓名。
SELECT Sname 姓名 FROM Student WHERE Sno in(SELECT Sno FROM sc WHERE Cno in('3','4'));
--15、查询既选修了“3”号课程又选修了“4”号课程的学生的姓名。
SELECT Sname 姓名 FROM Student WHERE Sno in(SELECT Sno FROM sc WHERE Cno in('3','4') GROUP BY Sno HAVING COUNT(*)=2);
--16、在该库中创建“选课”表的一个副本“SC2”表，将“选课”表中的不及格学生信息添加到SC2中，并将不及格学生的学号、姓名、课程名、成绩存入表“bjgmd”中。
SELECT * INTO SC2 FROM sc WHERE Grade < 60;
SELECT * INTO bjgmd FROM Student WHERE Sno in (SELECT Sno FROM SC WHERE Grade < 60);
--17、查询学生“王丽”的所有科目考试成绩。
SELECT Cno 课程号,grade 成绩 FROM sc WHERE Sno = (SELECT Sno FROM Student WHERE Sname = '杨洋');
--18、查询选修了课程号为1的且分数大于80分的学生的信息。
SELECT * FROM Student WHERE Sno = (SELECT Sno FROM SC WHERE cno='1' AND grade > 80);
--19、从成绩表中查询优秀（成绩在[90,100]之间）的成绩信息。
SELECT * FROM sc WHERE grade >= 90 AND grade <= 100;
--20、从“学生”表中查询200215班的学生信息（学号前6位为班号）。
SELECT * FROM Student WHERE Sno LIKE '200215%';
--21、查询“学生”表中的学生总数。
SELECT COUNT(*) 学生总数 FROM Student;
--22、查询“成绩”表中' 200215'班所学过的'1'号课程的总分。
SELECT SUM(grade) 总分 FROM SC WHERE (Sno LIKE '200215%') AND (Cno = '1');
--23、查询“成绩”表中学号是' 200215122'的学生的所有课程的平均分。
SELECT AVG(grade) 平均成绩 FROM SC WHERE Sno = '200215122';
--24、查询“成绩”表中'1'号课程的最高分。
SELECT MAX(grade) 最高成绩 FROM SC WHERE Cno = '1';