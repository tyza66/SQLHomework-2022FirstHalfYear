/*
ĳ�����˾��Ա����EMP����Ŀ��P��Ա���μ���Ŀ��WORKS������ʾ��
�������Ժ������£�ENOԱ���ţ�ENAMEԱ������SEX�Ա�TITLEְλ��SALARY���ʣ�
PNO��Ŀ�ţ�PNAME��Ŀ����BUDGET��ĿԤ�㣬
RESPԱ���ڲμӵ���Ŀ�ге���ְ��DURԱ���μ���Ŀ��ʱ������λ���£���
*/
--1������EMP����ENO����Ϊ���롣����������Ӧ������
USE ʵ��5;
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
INSERT INTO EMP VALUES('E01','����','Ů','����Ա',3700);
INSERT INTO EMP VALUES('E02','����','��','������ʦ',3700);
INSERT INTO EMP VALUES('E03','��־��','��','����Ա',3700);
INSERT INTO EMP VALUES('E04','����','Ů','ϵͳ����Ա',3700);
INSERT INTO EMP VALUES('E08','���','Ů','����Ա',3700);
INSERT INTO EMP VALUES('E09','��','��','����Ա',3700);

INSERT INTO P VALUES('P1','�м������',50000);
INSERT INTO P VALUES('P2','���ݿ⿪��',30000);
INSERT INTO P VALUES('P3','��վ���',15000);

INSERT INTO WORKS VALUES('E01','P1','����','12');
INSERT INTO WORKS VALUES('E02','P1','����Ա','24');
INSERT INTO WORKS VALUES('E02','P2','����Ա','6');
INSERT INTO WORKS VALUES('E03','P3','����','10');
INSERT INTO WORKS VALUES('E03','P2','����ʦ','48');
INSERT INTO WORKS VALUES('E04','P2','����Ա','18');
INSERT INTO WORKS VALUES('E08','P3','����ʦ','36');
--2������Ŀ��P�����һ����¼��P4�����۹���ϵͳ��200000����
INSERT INTO P VALUES('P4','���۹���ϵͳ',200000);
--3����Ա���μ���Ŀ���У�ɾ����E02���������Ŀ��¼��
DELETE FROM WORKS WHERE ENO = 'E02';
--4��������Ա���Ĺ����ϵ�10%��
UPDATE EMP SET SALARY = SALARY*1.1;
--5����P3��Ŀ��Ԥ������10000Ԫ��
UPDATE P SET BUDGET = BUDGET+10000 WHERE PNO = 'P3';
--6. ��ѯԱ�������м���ְλ��Ҫ���ֶ������������֡�ְλ����ʾ��
SELECT TITLE ְλ FROM EMP GROUP BY TITLE;
--7. ��ѯ����Ůѧ���Ĺ��ź�������
SELECT ENO ����,ENAME ���� FROM EMP WHERE SEX = 'Ů';
--8. ��ѯԱ��E02�μӵ�������Ŀ����Ŀ���ơ�
SELECT PNAME FROM p WHERE PNO in (SELECT PNO FROM WORKS WHERE ENO = 'E02');
--9. ��ѯ������4000��5000֮�����ְ����������
SELECT ENAME ���� FROM EMP WHERE (SEX = '��') AND (SALARY BETWEEN 4000 AND 5000);
--10. ��ѯ����Ϊ��E03����ְԱ�Ĺ�����������������������Ŀ���Ͳμ���Ŀʱ����
SELECT e.ENAME ����,p.PNAME ��Ŀ��,w.DUR �μ���Ŀʱ�� FROM EMP e,P p,WORKS w WHERE e.ENO = w.ENO AND p.PNO = w.PNO AND e.ENO = 'E03';
--11����ѯԱ������������ͬѧ��Ϣ������������������С�
SELECT * FROM EMP WHERE SEX = '��' ORDER BY SALARY;
--12����ѯ����Ա����Ϣ����������ʽ������С�
SELECT * FROM EMP ORDER BY SALARY DESC;
--13��ͳ�ƹ������볬��3000Ԫ��Ա��������
SELECT * FROM EMP WHERE SALARY >= 3000;
--14��ͳ�Ʋ��롰���ݿ⿪������Ŀ�ġ�����ʦ����������
SELECT COUNT(*) FROM EMP WHERE ENO IN (SELECT ENO FROM WORKS WHERE (PNO = (SELECT PNO FROM P WHERE PNAME='���ݿ⿪��')) AND (RESP = '����ʦ'));
--15�� ��ѯ���롰���ݿ⿪������Ŀ��Ա��������
SELECT ENAME FROM EMP WHERE ENO IN (SELECT ENO FROM WORKS WHERE PNO = (SELECT PNO FROM P WHERE PNAME = '���ݿ⿪��'));
--16��Ϊ����ŮԱ������һ����ͼView_woman��
CREATE VIEW View_woman AS SELECT * FROM EMP WHERE SEX = 'Ů';
--17. ����һ����ͼW_VIEW, ����Ա���μ���Ŀ����������ݡ�
CREATE VIEW W_VIEW AS SELECT * FROM WORKS;
--18. �ѶԱ�works�Ĳ�ѯȨ�����������û���
GRANT SELECT ON WORKS TO PUBLIC;
--19. ����ͼW_VIEW�Ĳ�ѯȨ���������С�
GRANT SELECT ON W_VIEW TO ����;