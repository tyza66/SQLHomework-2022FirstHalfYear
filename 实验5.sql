/*
某软件公司有员工表EMP、项目表P和员工参加项目表WORKS如下所示，
其中属性含义如下：ENO员工号，ENAME员工名，SEX性别，TITLE职位，SALARY工资，
PNO项目号，PNAME项目名，BUDGET项目预算，
RESP员工在参加的项目中承担的职务，DUR员工参加项目的时长（单位是月）。
*/
--1．创建EMP表，将ENO定义为主码。（其他表相应操作）
USE 实验5;
CREATE TABLE EMP(
ENO char(5) primary key,
ENAME char(10),
SEX char(10),
TITLE char(20),
SALARY int
);
CREATE TABLE P(
PNO char(5) primary key,
PNAME char(20),
BUDGET int
);
CREATE TABLE WORKS(
ENO char(5),
PNO char(5),
RESP char(10),
DUR char(10)
);
INSERT INTO EMP VALUES('E01','刘明','女','程序员',3700);
INSERT INTO EMP VALUES('E02','王大海','男','软件设计师',3700);
INSERT INTO EMP VALUES('E03','赵志广','男','程序员',3700);
INSERT INTO EMP VALUES('E04','李男','女','系统分析员',3700);
INSERT INTO EMP VALUES('E08','沈忱','女','程序员',3700);
INSERT INTO EMP VALUES('E09','沈','男','程序员',3700);

INSERT INTO P VALUES('P1','中间件开发',50000);
INSERT INTO P VALUES('P2','数据库开发',30000);
INSERT INTO P VALUES('P3','网站设计',15000);

INSERT INTO WORKS VALUES('E01','P1','经理','12');
INSERT INTO WORKS VALUES('E02','P1','分析员','24');
INSERT INTO WORKS VALUES('E02','P2','分析员','6');
INSERT INTO WORKS VALUES('E03','P3','顾问','10');
INSERT INTO WORKS VALUES('E03','P2','工程师','48');
INSERT INTO WORKS VALUES('E04','P2','程序员','18');
INSERT INTO WORKS VALUES('E08','P3','工程师','36');
--2．在项目表P中添加一条记录（P4，销售管理系统，200000）。
INSERT INTO P VALUES('P4','销售管理系统',200000);
--3．在员工参加项目表中，删除“E02”参与的项目记录。
DELETE FROM WORKS WHERE ENO = 'E02';
--4．将所有员工的工资上调10%。
UPDATE EMP SET SALARY = SALARY*1.1;
--5．将P3项目的预算增加10000元。
UPDATE P SET BUDGET = BUDGET+10000 WHERE PNO = 'P3';
--6. 查询员工表中有几种职位，要求字段列用中文名字“职位”显示。
SELECT TITLE 职位 FROM EMP GROUP BY TITLE;
--7. 查询所有女学生的工号和姓名。
SELECT ENO 工号,ENAME 姓名 FROM EMP WHERE SEX = '女';
--8. 查询员工E02参加的所有项目的项目名称。
SELECT PNAME FROM p WHERE PNO in (SELECT PNO FROM WORKS WHERE ENO = 'E02');
--9. 查询工资在4000到5000之间的男职工的姓名。
SELECT ENAME 姓名 FROM EMP WHERE (SEX = '男') AND (SALARY BETWEEN 4000 AND 5000);
--10. 查询工号为‘E03’的职员的工作情况，结果包括姓名、项目名和参加项目时长。
SELECT e.ENAME 姓名,p.PNAME 项目名,w.DUR 参加项目时长 FROM EMP e,P p,WORKS w WHERE e.ENO = w.ENO AND p.PNO = w.PNO AND e.ENO = 'E03';
--11．查询员工表中所有男同学信息，结果按工资升序排列。
SELECT * FROM EMP WHERE SEX = '男' ORDER BY SALARY;
--12．查询所有员工信息，结果按工资降序排列。
SELECT * FROM EMP ORDER BY SALARY DESC;
--13．统计工资收入超过3000元的员工人数。
SELECT * FROM EMP WHERE SALARY >= 3000;
--14．统计参与“数据库开发”项目的“工程师”的人数。
SELECT COUNT(*) FROM EMP WHERE ENO IN (SELECT ENO FROM WORKS WHERE (PNO = (SELECT PNO FROM P WHERE PNAME='数据库开发')) AND (RESP = '工程师'));
--15． 查询参与“数据库开发”项目的员工姓名。
SELECT ENAME FROM EMP WHERE ENO IN (SELECT ENO FROM WORKS WHERE PNO = (SELECT PNO FROM P WHERE PNAME = '数据库开发'));
--16．为所有女员工创建一个视图View_woman。
CREATE VIEW View_woman AS SELECT * FROM EMP WHERE SEX = '女';
--17. 建立一个视图W_VIEW, 包含员工参加项目表的所有数据。
CREATE VIEW W_VIEW AS SELECT * FROM WORKS;
--18. 把对表works的查询权限授予所有用户。
GRANT SELECT ON WORKS TO PUBLIC;
--19. 将视图W_VIEW的查询权限授予李男。
GRANT SELECT ON W_VIEW TO 李男;