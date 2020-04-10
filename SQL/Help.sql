--USE EESDBV10Test
--USE GDDMESTest
USE MDMV10

SELECT B.name,C.value, D.name, B.max_length, B.precision,B.scale
FROM sys.tables AS A
INNER JOIN sys.columns AS B
ON A.object_id = B.object_id
LEFT JOIN sys.extended_properties AS C
ON A.object_id = C.major_id
AND B.column_id = C.minor_id
INNER JOIN sys.types AS D
ON B.system_type_id = D.system_type_id
WHERE A.name = 'IQC_Item_History'
ORDER BY B.column_id

-- µÇÂ¼SQL
SELECT DISTINCT A.[OPCode]
      ,A.[OPID]
      ,A.[Name]
      ,A.[DisplayOrder]
      ,A.[IconName]
      ,A.[BtnCss]
      ,A.[Description]
      ,A.[OPType]
      ,A.[Delflag]
      ,A.[CreateTime]
      ,A.[Creator]
      ,A.[ModifiedTime]
      ,A.[Modifier]
      ,A.[Comment]
      ,A.[RowVersion]
      ,A.[DataGroup]
  FROM [SYS_OPInfo] A
  INNER JOIN SYS_REL_RoleMenuOP B ON A.OPCode=B.OPCode
  INNER JOIN SYS_MenuInfo C ON B.MenuCode=C.MenuCode
  INNER JOIN SYS_REL_UserRole D ON B.RoleCode=D.RoleCode
  WHERE A.Delflag=0
  and A.OPCode in ('browser','wBrowser')
  and A.OPType = 0
  AND D.LoginName= 'ywx'

--Menu
select * from SYS_MenuInfo where ParentCode = '' and MenuType = 0
SELECT A.[ID]
      ,A.[RoleCode]
      ,A.[MenuCode]
      ,A.[OPCode]
  FROM [SYS_REL_RoleMenuOP] A
  INNER JOIN SYS_REL_UserRole B ON A.RoleCode=B.RoleCode
  INNER JOIN SYS_MenuInfo C ON A.MenuCode=C.MenuCode AND C.Delflag=0 AND C.Enable=1
  INNER JOIN SYS_OPInfo D ON A.OPCode=D.OPCode AND D.Delflag=0
  INNER JOIN SYS_REL_MenuOP E ON A.OPCode=E.OPCode AND A.MenuCode=E.MenuCode
  WHERE 1=1 AND B.LoginName = 'ywx'

    -- ´æ´¢¹ý³Ì
select * from sys.sql_modules
select * from [sys].[syscomments]

  