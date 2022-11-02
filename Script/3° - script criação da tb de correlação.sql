/*
* AUTOR: DIOGO FERREIRA; GUSTAVO GUIMARÃES
* DATA : 07/03/2022
* DESC : SCRIPT DE CRIAÇÃO DA TB_COTA_TB_EMPRESA
*/

----------------------------------------------------------------------------
/*INSERT DOS VALORES NA TB*/
----------------------------------------------------------------------------
--INSERT TB_COTA_TB_EMPRESA---------------------------------------------------------
INSERT INTO TB_COTA_TB_EMPRESA
SELECT
IDEMPR_EMP,
IDCOTA_COT
FROM TB_COTA(NOLOCK)
INNER JOIN TB_EMPRESA WITH(NOLOCK) ON NOMRES_COT = NOMEMP_EMP
WHERE NOT EXISTS(
	SELECT * FROM TB_COTA_TB_EMPRESA B WHERE B.IDCOTA_CCE = IDCOTA_COT
)
GO

