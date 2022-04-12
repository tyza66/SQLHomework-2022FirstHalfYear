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
INSERT INTO Student  VALUES('200215122','�ϼ','Ů',20,'��ѧ');
INSERT INTO Student  VALUES('200212129','����','Ů',19,'�������ѧ�뼼��');
INSERT INTO Student  VALUES('200212130','����','��',18,'ͨ�Ź���');
INSERT INTO Student  VALUES('200212131','����','��',21,'ͨ�Ź���');
INSERT INTO Student  VALUES('200215123','�ֺ�','Ů',21,'�������');
INSERT INTO Student  VALUES('200215126','�ź���','��',19,'�������');
INSERT INTO Student  VALUES('200215127','����','Ů',22,'�������');
INSERT INTO Student  VALUES('200215121','���','��',21,'��ѧ');

INSERT INTO Course  VALUES('1','���������',null,3);
INSERT INTO Course  VALUES('2','C���Գ������','1',4);
INSERT INTO Course  VALUES('3','��ѧ',null,2);
INSERT INTO Course  VALUES('4','��Ϣϵͳ',null,4);
INSERT INTO Course  VALUES('5','���ݿ�','2',4)
INSERT INTO Course  VALUES('6',' ����ϵͳ','1',3);
INSERT INTO Course  VALUES('7','���ݽṹ','2',4);

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
һ������STѧ��ѡ�����ݿ⣬�򿪡�����ѧ��ѡ�α�.txt����������롰��ѯ�������У�ִ���������������ݿ⼰��
�����۲������Դ������������ʲô�仯��
�����ڲ�ѯ����������²�����
*/
USE ʵ��4;
--1���ԡ�ѧ�������Ա���з��飬��ѯ��Ӧ��������
SELECT Ssex �Ա�,COUNT(*) ���� FROM Student GROUP BY Ssex;
--2���ڡ�ѡ�Ρ����в�ѯѡ���������ϣ������ţ��γ̵�ѧ����ѧ�ź�ѡ��������
SELECT Sno ѧ��,COUNT(*) ѡ���� FROM sc GROUP BY Sno HAVING COUNT(*)>=2;
--3����ÿ��ͬѧ�ĳɼ��ܺ�
SELECT Sno ѧ��,SUM(grade) �ɼ��ܺ� FROM sc GROUP BY Sno;
SELECT SUM(grade) ���гɼ��ܺ� FROM sc;
--4����ѯÿ��ѧ����ѧ�ż���ѡ�޿γ̵�ƽ���֡�
SELECT Sno ѧ��,AVG(grade) ƽ���� FROM sc GROUP BY Sno;
--5����ѯÿ��ѧ�����������γ̺źͳɼ���
SELECT Sname ����,Cno �γ̺�,grade �ɼ� FROM Student s,sc c WHERE s.Sno = c.Sno;
--6����ѯ��ѧ�������е�ѧ�š����������䣬����ѯ���������½���ѧ�����䡱�С�
SELECT Sno,Sname,Sage INTO StudentAge FROM Student;
--7����ѯû�п��Գɼ���ѧ����ѧ�źͿγ̺š�
SELECT Sno ѧ��,Cno �γ̺� FROM sc WHERE grade is null;
--8����ѯ��ѧ�������е�ѧ����Ϣ����ѯ������������������С�
SELECT * FROM Student ORDER BY Sage;
--9����ѯ��ѧ�������е�ѧ����Ϣ����ѯ������Ȱ��Ա��������У�Ȼ���ٰ��հ�������ݽ������С�Ϊ�˷���鿴����������������ݡ������С�
SELECT *,(2022-Sage) ������� FROM Student ORDER BY Ssex,(2022-Sage) desc;
--10����ѯÿ��ѧ������ѡ�޿γ̵ĳɼ��������δѡ�ε�ѧ����Ϣ����
SELECT s.*,Cno �γ̺�,grade �ɼ� FROM Student s LEFT JOIN sc c ON s.sno = c.sno;
--11����ѯ�ɼ��ڷ����ϵ�ѧ����ѧ�š��������γ������ɼ���
SELECT s.Sno ѧ��,Sname ����,Cname �γ���,grade �ɼ� FROM Student s,sc c,Course o WHERE s.Sno = c.Sno AND c.cno = o.cno;
--12����ѯ�롰������ͬһ��רҵѧϰ��ѧ����ѧ�š�������רҵ��
SELECT Sno ѧ��,Sname ����,Sdept רҵ FROM Student WHERE Sdept = (SELECT Sdept FROM Student WHERE Sname = '����');
--13����ѯѡ���ˡ�2���ſγ̵�ѧ��������������רҵ��
SELECT Sname ����,Sdept ����רҵ FROM Student s,sc c WHERE s.Sno = c.Sno AND cno = '2';
--14����ѯѡ���ˡ�3���ſγ̻�4���ſγ̵�ѧ����������
SELECT Sname ���� FROM Student WHERE Sno in(SELECT Sno FROM sc WHERE Cno in('3','4'));
--15����ѯ��ѡ���ˡ�3���ſγ���ѡ���ˡ�4���ſγ̵�ѧ����������
SELECT Sname ���� FROM Student WHERE Sno in(SELECT Sno FROM sc WHERE Cno in('3','4') GROUP BY Sno HAVING COUNT(*)=2);
--16���ڸÿ��д�����ѡ�Ρ����һ��������SC2��������ѡ�Ρ����еĲ�����ѧ����Ϣ��ӵ�SC2�У�����������ѧ����ѧ�š��������γ������ɼ������bjgmd���С�
SELECT * INTO SC2 FROM sc WHERE Grade < 60;
SELECT * INTO bjgmd FROM Student WHERE Sno in (SELECT Sno FROM SC WHERE Grade < 60);
--17����ѯѧ���������������п�Ŀ���Գɼ���
SELECT Cno �γ̺�,grade �ɼ� FROM sc WHERE Sno = (SELECT Sno FROM Student WHERE Sname = '����');
--18����ѯѡ���˿γ̺�Ϊ1���ҷ�������80�ֵ�ѧ������Ϣ��
SELECT * FROM Student WHERE Sno = (SELECT Sno FROM SC WHERE cno='1' AND grade > 80);
--19���ӳɼ����в�ѯ���㣨�ɼ���[90,100]֮�䣩�ĳɼ���Ϣ��
SELECT * FROM sc WHERE grade >= 90 AND grade <= 100;
--20���ӡ�ѧ�������в�ѯ200215���ѧ����Ϣ��ѧ��ǰ6λΪ��ţ���
SELECT * FROM Student WHERE Sno LIKE '200215%';
--21����ѯ��ѧ�������е�ѧ��������
SELECT COUNT(*) ѧ������ FROM Student;
--22����ѯ���ɼ�������' 200215'����ѧ����'1'�ſγ̵��ܷ֡�
SELECT SUM(grade) �ܷ� FROM SC WHERE (Sno LIKE '200215%') AND (Cno = '1');
--23����ѯ���ɼ�������ѧ����' 200215122'��ѧ�������пγ̵�ƽ���֡�
SELECT AVG(grade) ƽ���ɼ� FROM SC WHERE Sno = '200215122';
--24����ѯ���ɼ�������'1'�ſγ̵���߷֡�
SELECT MAX(grade) ��߳ɼ� FROM SC WHERE Cno = '1';