USE ����1;
--�ֱ�����������������������
SELECT * FROM Course;
SELECT * FROM SC;
SELECT * FROM Student;

--��ѯѧ����ѧ�ţ�������������
SELECT Sno,Sname,Sage FROM Student;

--��ѯǰ���ѧ��������������
SELECT TOP 5 Sname,Sage FROM Student;

--��ѯѧ����ѧ�ţ����������䣬Ҫ��������������
SELECT Sno ѧ��,Sname ����,Sage ���� FROM Student;

--��ѯ���гɼ���ÿ���ɼ��������
SELECT Grade+5 FROM Sc;

--��ѯ�����롱������
SELECT Sage ��������� FROM Student WHERE Sname='����';

--��ѯ������ڵ��ڵ�ѧ��������
SELECT Sname ���� FROM Student WHERE Sage>=20;

--��ѯ������ڵ��ڵ�Ůѧ��������
SELECT Sname ���� FROM Student WHERE Sage>=20 AND Ssex='Ů';

--��ѯ�����ڵ�֮��ѧ��������
SELECT Sname ���� FROM Student WHERE Sage BETWEEN 18 AND 20;

--��ѯ���䲻�ڵ�֮��ѧ��������
SELECT Sname ���� FROM Student WHERE Sage NOT BETWEEN 18 AND 20;

--��ѯ�������ǡ���㡱�͡���ʱ�䡱������ͬѧ������
SELECT Sage ���� FROM Student WHERE Sname NOT IN('���','��ʱ��');

--��ѯ���������ͬѧ������������
SELECT Sname ����,Sage ���� FROM Student WHERE Sname LIKE '��%';

--��ѯѧ���еڶ����ִ�����ѧ����Ϣ
SELECT * FROM Student WHERE Sname LIKE '_��%';

--��ѯû�����޿γ̵Ŀγ���Ϣ
SELECT * FROM Course WHERE Cpon is null;