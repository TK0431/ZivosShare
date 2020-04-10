-- ESOP
-- 
SELECT A.LineCode,C.LineName,B.FileName,B.FileNO,B.FileMD5,B.FileContent FROM PLAN_WeekPlanWo A
                    LEFT JOIN MDM_StepProcR B ON A.LineCode = B.Line AND A.BopVersion = B.FlowCode
                    LEFT JOIN MDM_Line C ON A.LineCode = C.LineCode
                    WHERE A.Delflag  = 0 AND A.State = 3

select * from MDM_StepProcR