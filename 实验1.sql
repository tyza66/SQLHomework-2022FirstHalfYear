USE ʵ��1;
/*Student��ѧ��Sno������Sname���Ա�Ssex������Sage������ԺϵSdept��*/
CREATE TABLE Student(Sno CHAR(9) PRIMARY KEY,Sname CHAR(10) UNIQUE,Ssex CHAR(2),Sage INT,Sdept CHAR(30));/*Course���γ̺�Cno���γ���Cname�����޿γ̺� Cpno ��ѧ��Ccredit��*/CREATE TABLE Course(Cno CHAR(2) PRIMARY KEY,Cname CHAR(30) UNIQUE,Cpon CHAR(2),Ccredit INT);/*SC��ѧ��Sno���γ̺�Cno���ɼ�Grade��*/CREATE TABLE SC(Sno CHAR(9) PRIMARY KEY,Cno CHAR(8) ,Grade INT);/*��Student����Ӽ�¼*/INSERT INTO Student VALUES('200212128','�ŵ�','Ů',18,'�������ѧ�뼼��');INSERT INTO Student VALUES('200215122','�ϼ','Ů',20,'��ѧ');INSERT INTO Student VALUES('200212129','����','Ů',19,'�������ѧ�뼼��');
INSERT INTO Student VALUES('200212130','����','��',18,'ͨ�Ź���');
INSERT INTO Student VALUES('200212131','����','��',21,'ͨ�Ź���');
INSERT INTO Student VALUES('200215123','�ֺ�','Ů',21,'�������');
INSERT INTO Student VALUES('200215126','�ź���','��',19,'�������');
INSERT INTO Student VALUES('200215127','����','Ů',22,'�������');
INSERT INTO Student VALUES('200212132','���','��',21,'��ѧ');
/*��Course����Ӽ�¼*/
INSERT INTO Course VALUES('1','���������',null,3);
INSERT INTO Course VALUES('2','C���Գ������','1',4);
INSERT INTO Course VALUES('3','��ѧ',null,2);
INSERT INTO Course VALUES('4','��Ϣϵͳ',null,4);
INSERT INTO Course VALUES('5','���ݿ�','2',4);
INSERT INTO Course VALUES('6',' ����ϵͳ','1',3);
INSERT INTO Course VALUES('7','���ݽṹ','2',4);
/*��SC����Ӽ�¼*/
INSERT INTO SC VALUES('200212131','1',70);
INSERT INTO SC VALUES('200215123','1',84);
INSERT INTO SC VALUES('200215127','4',95);
INSERT INTO SC VALUES('200215128','1',40);
INSERT INTO SC VALUES('200212129','1',59);
INSERT INTO SC VALUES('200212130','1',60);
INSERT INTO SC VALUES('200212168','2',94);
INSERT INTO SC VALUES('200215121','2',92);    
INSERT INTO SC VALUES('200215122','2',85);