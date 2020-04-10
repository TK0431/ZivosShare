--POP

-- 1.工单管理
-- 2.
-- 3.
-- 4.

-- 5.现场考勤
	-- 5.1 上班打卡
	   -- 5.1.1考勤
	   -- (无数据)此卡尚未绑定，请联系管理！(POP_UserCardIDBind添加数据)
	   -- (IntCol1 = 1)您今日的考勤数据已提交，无法打卡！
	   -- (StrCol5 = "")已打过上班卡，无需重复打卡！
	   -- (StrCol8 != "" AND StrCol8 < Now)您的上岗证({0})已过期，禁止考勤！
	   -- (StrCol8 != "" AND StrCol8 - 7天 < Now)您的上岗证({0})即将过期，请知晓！
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

	   -- 5.1.2岗位判断
	   -- (无数据)未配置岗位信息，请联系管理！
	   -- (数据 > 1 件)岗位选择对话框
SELECT B.UserLoginName StrCol1,B.UserName StrCol2,B.CardID StrCol3,A.LineCode StrCol4,C.LineName StrCol5,A.OneLevelPostCode StrCol6,D.OneLevelPostName StrCol7,A.PostCode StrCol8,E.PostName StrCol9
FROM MDM_PostEquipHR A
LEFT JOIN POP_UserCardIDBind B ON B.UserLoginName = A.Code
LEFT JOIN MDM_Line C ON A.LineCode = C.LineCode
LEFT JOIN MDM_OneLevelPost D ON A.OneLevelPostCode = D.OneLevelPostCode
LEFT JOIN MDM_Post E ON A.PostCode = E.PostCode
WHERE A.Delflag = 0  AND A.OneLevelPostCode = 'SC' 
AND B.CardID IN ('1153267382')


		-- 5.1.3添加打卡记录
--SET XACT_ABORT ON
--INSERT INTO Line_KaoQinHis(LineCode,UserID,CardID,CardDateTime,CardType,IsCommit,Delflag,CreateTime,Creator,ModifiedTime,Modifier,OneLevelPostCode, PostCode)
--VALUES('{0}','{1}','{2}',GETDATE(),{3},0,0,GETDATE(),'{1}',GETDATE(),'{1}','{4}','{5}')
select * from Line_KaoQinHis

		-- 5.1.X 自用
select * from Line_KaoQinHis where Delflag = 0 AND CardType =0 AND CreateTime BETWEEN [dbo].[GetGDDDateTime](GETDATE(),1) AND [dbo].[GetGDDDateTime](GETDATE(),2)
--delete from Line_KaoQinHis where CreateTime BETWEEN [dbo].[GetGDDDateTime](GETDATE(),1) AND [dbo].[GetGDDDateTime](GETDATE(),2) AND CardID = '1153267382'

	-- 5.2 下班打卡

-- 6.
-- 7.胸卡绑定
  -- 7.1(无数据)此设备尚未配置产线信息，请联系管理员！
SELECT LineCode Code,LineName Name FROM dbo.MDM_Line WHERE Delflag = 0 

  -- 7.2用户存在判断
  -- (无数据)无效用户名({0})！
SELECT * FROM SYS_UserInfo WHERE LoginName = 'GD090245' AND Delflag = 0 

  -- 7.3此用户({0})已绑定！
SELECT * FROM POP_UserCardIDBind WHERE UserLoginName = 'ywx' AND Delflag = 0 

  -- 7.4您的胸卡已被绑定过，请联系管理员！
SELECT * FROM POP_UserCardIDBind WHERE UserLoginName = 'ywx' AND CardID = '1153267382' AND Delflag = 0 

  -- 7.5胸卡绑定成功，可以正常使用啦。
  -- (Insert 失败)胸卡绑定失败，请联系管理员！
--INSERT INTO POP_UserCardIDBind
SELECT * FROM POP_UserCardIDBind 