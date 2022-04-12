USE 试验1;
--分别浏览三个表里面的所有数据
SELECT * FROM Course;
SELECT * FROM SC;
SELECT * FROM Student;

--查询学生的学号，姓名，和年龄
SELECT Sno,Sname,Sage FROM Student;

--查询前五个学生的姓名和年龄
SELECT TOP 5 Sname,Sage FROM Student;

--查询学生的学号，姓名和年龄，要求列用中文命名
SELECT Sno 学号,Sname 姓名,Sage 年龄 FROM Student;

--查询所有成绩，每个成绩都加五分
SELECT Grade+5 FROM Sc;

--查询“李想”的年龄
SELECT Sage 李想的年龄 FROM Student WHERE Sname='李想';

--查询年龄大于等于的学生的姓名
SELECT Sname 姓名 FROM Student WHERE Sage>=20;

--查询年龄大于等于的女学生的姓名
SELECT Sname 姓名 FROM Student WHERE Sage>=20 AND Ssex='女';

--查询年龄在到之间学生的姓名
SELECT Sname 姓名 FROM Student WHERE Sage BETWEEN 18 AND 20;

--查询年龄不在到之间学生的姓名
SELECT Sname 姓名 FROM Student WHERE Sage NOT BETWEEN 18 AND 20;

--查询姓名不是“李广”和“李时珍”的其他同学的年龄
SELECT Sage 年龄 FROM Student WHERE Sname NOT IN('李广','李时珍');

--查询所有姓李的同学的姓名和年龄
SELECT Sname 姓名,Sage 年龄 FROM Student WHERE Sname LIKE '李%';

--查询学生中第二个字带海的学生信息
SELECT * FROM Student WHERE Sname LIKE '_海%';

--查询没有先修课程的课程信息
SELECT * FROM Course WHERE Cpon is null;