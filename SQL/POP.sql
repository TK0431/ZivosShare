--POP

-- 1.��������
-- 2.
-- 3.
-- 4.

-- 5.�ֳ�����
	-- 5.1 �ϰ��
	   -- 5.1.1����
	   -- (������)�˿���δ�󶨣�����ϵ����(POP_UserCardIDBind�������)
	   -- (IntCol1 = 1)�����յĿ����������ύ���޷��򿨣�
	   -- (StrCol5 = "")�Ѵ���ϰ࿨�������ظ��򿨣�
	   -- (StrCol8 != "" AND StrCol8 < Now)�����ϸ�֤({0})�ѹ��ڣ���ֹ���ڣ�
	   -- (StrCol8 != "" AND StrCol8 - 7�� < Now)�����ϸ�֤({0})�������ڣ���֪����
SELECT A.UserLoginName StrCol1,A.UserName StrCol2,A.CardID StrCol3,A.LineCode StrCol4,B.UserID StrCol5,
A.LineName StrCol6,D.C98801 StrCol7,D.C98804 StrCol8, ISNULL(B.IsCommit,0) IntCol1 
FROM POP_UserCardIDBind A
LEFT JOIN (SELECT  * FROM Line_KaoQinHis 
		   WHERE Delflag = 0 AND CardType =0 
		   AND CreateTime BETWEEN [dbo].[GetGDDDateTime](GETDATE(),1) AND [dbo].[GetGDDDateTime](GETDATE(),2)
		   ) B ON A.CardID = B.CardID
LEFT JOIN [EHRUserInfo] C ON C.A0190 = A.UserLoginName
LEFT JOIN [EHRUserCertificate] D ON D.A0188 = C.A0188
WHERE A.Delflag = 0 
AND A.CardID IN ('1153267382')

	   -- 5.1.2��λ�ж�
	   -- (������)δ���ø�λ��Ϣ������ϵ����
	   -- (���� > 1 ��)��λѡ��Ի���
SELECT B.UserLoginName StrCol1,B.UserName StrCol2,B.CardID StrCol3,A.LineCode StrCol4,C.LineName StrCol5,A.OneLevelPostCode StrCol6,D.OneLevelPostName StrCol7,A.PostCode StrCol8,E.PostName StrCol9
FROM MDM_PostEquipHR A
LEFT JOIN POP_UserCardIDBind B ON B.UserLoginName = A.Code
LEFT JOIN MDM_Line C ON A.LineCode = C.LineCode
LEFT JOIN MDM_OneLevelPost D ON A.OneLevelPostCode = D.OneLevelPostCode
LEFT JOIN MDM_Post E ON A.PostCode = E.PostCode
WHERE A.Delflag = 0  AND A.OneLevelPostCode = 'SC' 
AND B.CardID IN ('1153267382')


		-- 5.1.3��Ӵ򿨼�¼
--SET XACT_ABORT ON
--INSERT INTO Line_KaoQinHis(LineCode,UserID,CardID,CardDateTime,CardType,IsCommit,Delflag,CreateTime,Creator,ModifiedTime,Modifier,OneLevelPostCode, PostCode)
--VALUES('{0}','{1}','{2}',GETDATE(),{3},0,0,GETDATE(),'{1}',GETDATE(),'{1}','{4}','{5}')
select * from Line_KaoQinHis

		-- 5.1.X ����
select * from Line_KaoQinHis where Delflag = 0 AND CardType =0 AND CreateTime BETWEEN [dbo].[GetGDDDateTime](GETDATE(),1) AND [dbo].[GetGDDDateTime](GETDATE(),2)
--delete from Line_KaoQinHis where CreateTime BETWEEN [dbo].[GetGDDDateTime](GETDATE(),1) AND [dbo].[GetGDDDateTime](GETDATE(),2) AND CardID = '1153267382'

	-- 5.2 �°��

-- 6.
-- 7.�ؿ���
  -- 7.1(������)���豸��δ���ò�����Ϣ������ϵ����Ա��
SELECT LineCode Code,LineName Name FROM dbo.MDM_Line WHERE Delflag = 0 

  -- 7.2�û������ж�
  -- (������)��Ч�û���({0})��
SELECT * FROM SYS_UserInfo WHERE LoginName = 'GD090245' AND Delflag = 0 

  -- 7.3���û�({0})�Ѱ󶨣�
SELECT * FROM POP_UserCardIDBind WHERE UserLoginName = 'ywx' AND Delflag = 0 

  -- 7.4�����ؿ��ѱ��󶨹�������ϵ����Ա��
SELECT * FROM POP_UserCardIDBind WHERE UserLoginName = 'ywx' AND CardID = '1153267382' AND Delflag = 0 

  -- 7.5�ؿ��󶨳ɹ�����������ʹ������
  -- (Insert ʧ��)�ؿ���ʧ�ܣ�����ϵ����Ա��
--INSERT INTO POP_UserCardIDBind
SELECT * FROM POP_UserCardIDBind 