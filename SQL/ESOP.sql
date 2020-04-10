-- ESOP
-- 
SELECT A.LineCode,C.LineName,B.FileName,B.FileNO,B.FileMD5,B.FileContent FROM PLAN_WeekPlanWo A
                    LEFT JOIN MDM_StepProcR B ON A.LineCode = B.Line AND A.BopVersion = B.FlowCode
                    LEFT JOIN MDM_Line C ON A.LineCode = C.LineCode
                    WHERE A.Delflag  = 0 AND A.State = 3

SELECT A.LineCode,C.LineName,B.FileName,B.FileNO,B.FileMD5,B.FileContent FROM PLAN_WeekPlanWo A
                    LEFT JOIN MDM_StepProcR B ON A.LineCode = B.Line AND A.BopVersion = B.FlowCode
                    LEFT JOIN MDM_Line C ON A.LineCode = C.LineCode
                    WHERE A.Delflag  = 0 AND A.State = 3

SELECT A.LineCode,C.LineName,B.FileName,B.FileNO,B.FileMD5,B.FileContent FROM PLAN_WeekPlanWo A                     
LEFT JOIN MDM_StepProcR B ON A.LineCode = B.Line AND A.BopVersion = B.FlowCode                    
 LEFT JOIN MDM_Line C ON A.LineCode = C.LineCode                     
 WHERE A.Delflag  = 0 AND A.State = 3                                           
 AND   A.LineCode IN ('XTX','ZZX','TYTX','WCX','TZX','ZJX','BTX','GCX','QXX','KTX','HSX','QGX','XFLX','SFLX','QZX','SGX')


 select * from MDM_StepProcR