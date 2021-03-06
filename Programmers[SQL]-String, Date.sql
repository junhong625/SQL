-- 1. 루시와 엘라 찾기
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE 
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty') 
ORDER BY ANIMAL_ID;

-- 2. 이름에 el이 들어가는 동물 찾기
SELECT ANIMAL_ID, NAME 
FROM ANIMAL_INS 
WHERE UPPER(NAME) LIKE '%EL%' AND ANIMAL_TYPE = 'Dog'
ORDER BY NAME;

-- 3. 중성화 여부 파악하기
SELECT ANIMAL_ID, NAME, 
case WHEN SEX_UPON_INTAKE LIKE 'Neutered %' or SEX_UPON_INTAKE LIKE 'Spayed %' 
THEN 'O' Else 'X' End as '중성화'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;

-- 4. 오랜 기간 보호한 동물(2)
SELECT INS.ANIMAL_ID, INS.NAME 
FROM ANIMAL_INS AS INS
LEFT OUTER JOIN ANIMAL_OUTS AS OUTS
ON INS.ANIMAL_ID = OUTS.ANIMAL_ID
WHERE OUTS.DATETIME IS NOT NULL
ORDER BY OUTS.DATETIME - INS.DATETIME DESC
LIMIT 2;

-- 5. DATETIME에서 DATE로 형 변환
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS '날짜' 
FROM ANIMAL_INS 
ORDER BY ANIMAL_ID