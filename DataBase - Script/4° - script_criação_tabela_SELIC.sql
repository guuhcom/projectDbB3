/*
* AUTOR: DIOGO FERREIRA; GUSTAVO GUIMAR?ES
* DATA : 30/05/2022
* DESC : SCRIPT DE CRIA??O DA TABELA TB_SELIC
*/

--CRIANDO A TB_SETOR--------------------------------------------------------------------
IF OBJECT_ID('FILTROS.DBO.TB_SELIC') IS NULL
	BEGIN
		CREATE TABLE FILTROS.DBO.TB_SELIC (
			IDSELI_SEL INT IDENTITY(1,1) PRIMARY KEY,
			TXSELI_SEL FLOAT,
			DTSELI_SEL DATETIME
		);
	END
GO

IF NOT EXISTS(SELECT * FROM TB_CAMPO(NOLOCK) WHERE NOMCAM_CAM = 'IDSELI_SEL' OR NOMCAM_CAM = 'TXSELI_SEL' OR NOMCAM_CAM = 'DTSELI_SEL')
	BEGIN
		INSERT INTO TB_CAMPO (
		NOMCAM_CAM,
		TIPOCA_CAM,
		DESCCA_CAM,
		TBREFE_CAM,
		OBSERV_CAM)
		VALUES
		('IDSELI_SEL','INT','ID DE IDENTIFICA??O','TB_SELIC',''),
		('TXSELI_SEL','FLOAT','TAXA SELIC % a.d.','TB_SELIC',''),
		('DTSELI_SEL','DATETIME','DATA DA MARCA??O DA TAXA SELIC','TB_SELIC','');
	END
GO
-----------------------------------------------------------------------------------------