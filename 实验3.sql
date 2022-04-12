USE Lib;
/*
һ���������ݿ�Lib����
ͼ��(�ܱ�ţ�����ţ����������ߣ����浥λ������)
����(����֤�ţ���λ���������Ա�ְ��,��ַ)
����(����֤�ţ��ܱ�ţ���������)
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
--�ڱ��в��뼸����¼Ϊ�˷�����ҵ�в���
INSERT INTO Book VALUES(1,1,'��¥��','��ѩ��','�ߵȽ���������',100);
INSERT INTO Book VALUES(2,2,'���μ�','��ж�','�ߵȽ���������',10);
INSERT INTO Book VALUES(3,3,'���ݿ�ԭ��','��С��','���ݳ�����',10);

INSERT INTO Reader VALUES(123456,'������ѧͼ���','�Ե�','Ů','ͼ�����Ա','����ʡ�����в���');
INSERT INTO Reader VALUES(123457,'������ѧ','���','��','��ʦ','����ʡ�����в���');

INSERT INTO Borrow VALUES(123456,1,'2021-11-2');
INSERT INTO Borrow VALUES(123456,2,'2021-11-2');
INSERT INTO Borrow VALUES(123456,3,'2012-11-2');
/*
����������²�����
1���ֱ����3�����е��������ݣ�
2����ѯ�����ߡ��Ե������ĵ�����ͼ���������
3���������۴���30Ԫ�������ͳ��浥λ��
4����ѯ��ͼ�顱�����������������ݿ⡱�����۲�����40Ԫ��ͼ����Ϣ��
5������ְ��Ϊ����ʦ�������ж�����Ϣ��
6����ѯ ��ͼ�顱����"�ߵȽ���������"�����ͼ�����߼ۡ���ͼۺ�ƽ���ۡ�
7������ÿ���������ͼ���ƽ���۸񣬽���������浥λ��ƽ���۸񣬼�¼��ƽ���۸������С�
8������ͳ�Ƴ�2014�����ǰ���ĵġ���������������3���Ľ����������ͽ���������
9��������2014��12��31���Ժ����ͼ������ж��ߵ������Ͳ������ƣ�����������ظ���¼��
10������SQL������ݽ��ı���һ����ͼV_DAY��ͳ�Ƴ���ĿǰΪֹͼ���Ѿ����ĵ���������ͼ�а��� ������֤�š��ܱ�ź������������ֶΣ���
11����ͼ����Ϣ���� 13010011��,��301��,��������Ӿ������������������廪��ѧ�����硯��35�����뵽ͼ����С�
*/
--1
SELECT * FROM Book;
SELECT * FROM Borrow;
SELECT * FROM dbo.Reader;

--2
SELECT Bname �Ե������ FROM Book WHERE Bno IN(SELECT Bno FROM Borrow WHERE Rno=(SELECT Rno FROM Reader WHERE Rname = '�Ե�'));

--3
SELECT Bname,BpublishingUnit FROM Book WHERE BunitPrice > 30;

--4
SELECT * FROM Book WHERE Bname LIKE '%���ݿ�%';

--5
SELECT * FROM Reader WHERE Rtitle = '��ʦ';

--6
SELECT MAX(BunitPrice) ��߼�,MIN(BunitPrice) ��ͼ�,AVG(BunitPrice) ƽ���� FROM Book WHERE BpublishingUnit = '�ߵȽ���������';

--7
SELECT BpublishingUnit ������,AVG(BunitPrice) ƽ���۸� FROM Book GROUP BY BpublishingUnit ORDER BY AVG(BunitPrice) DESC;
--8
SELECT Rname ����, COUNT(*) �������� FROM Reader a , Borrow b WHERE a.Rno = b.Rno AND b.Bdate <= '2014-12-31' AND COUNT(*) >= 3 GROUP BY a.Rname;

--9
SELECT DISTINCT a.Rname ����, a.Rtitle �������� FROM Reader a , Borrow b WHERE a.Rno = b.Rno AND b.Bdate >= '2014-12-31';

--10
CREATE VIEW V_DAY AS SELECT Rno ����֤��,Bno �ܱ��,DATEDIFF(DAY,Bdate,'2022-3-31') ���� FROM Borrow;

--11
INSERT INTO Book VALUES(13010011,301,'������Ӿ�','����','�廪��ѧ������',35);