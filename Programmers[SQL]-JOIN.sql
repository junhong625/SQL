-- 1. 없어진 기록 찾기
SELECT OUTS.ANIMAL_ID, OUTS.NAME FROM ANIMAL_OUTS AS OUTS LEFT OUTER JOIN ANIMAL_INS AS INS ON OUTS.ANIMAL_ID = INS.ANIMAL_ID WHERE INS.ANIMAL_ID is NULL ORDER BY OUTS.ANIMAL_ID

-- 2. 있었는데요 없었습니다
SELECT INS.ANIMAL_ID, INS.NAME FROM ANIMAL_INS AS INS LEFT OUTER JOIN ANIMAL_OUTS AS OUTS ON OUTS.ANIMAL_ID = INS.ANIMAL_ID WHERE OUTS.DATETIME < INS.DATETIME ORDER BY INS.DATETIME;

-- 3. 오랜 기간 보호한 동물(1)
SELECT INS.NAME, INS.DATETIME FROM ANIMAL_INS AS INS LEFT OUTER JOIN ANIMAL_OUTS AS OUTS ON INS.ANIMAL_ID = OUTS.ANIMAL_ID WHERE OUTS.DATETIME is null ORDER BY INS.DATETIME LIMIT 3;

-- 4. 보호소에서 중성화한 동물
SELECT INS.ANIMAL_ID, INS.ANIMAL_TYPE, INS.NAME FROM (SELECT * FROM ANIMAL_INS WHERE SEX_UPON_INTAKE = 'Intact Male' or SEX_UPON_INTAKE = 'Intact Female') AS INS LEFT OUTER JOIN (SELECT * FROM ANIMAL_OUTS WHERE SEX_UPON_OUTCOME = 'Neutered Male' or SEX_UPON_OUTCOME = 'Spayed Female') AS OUTS ON INS.ANIMAL_ID = OUTS.ANIMAL_ID;