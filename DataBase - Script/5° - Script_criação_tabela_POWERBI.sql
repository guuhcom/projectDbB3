/*
* AUTOR: DIOGO FERREIRA; GUSTAVO GUIMARÃES
* DATA : 06/06/2022
* DESC : SCRIPT DE CRIAÇÃO DA TABLELA COM O FILTOS DAS COTAS E DAS EMPRESAS .
* OBS  : TABELA USA PARA O USO DO POWER BI.
*/
SELECT
NOMEMP_EMP AS 'NOME EMPRESA',
CODNEG_COT AS 'CODIGO NEGOCIAÇÃO',
CODISI_COT AS 'CODIGO INTERNO',
ESPECI_COT AS 'ESPECIFICAÇÃO DO PAPEL',
DESSEG_SEG AS SEGMENTO,
DESSET_SET AS SETOR,
DESSSE_SSE AS SUBSETOR,
PREABE_COT AS 'PREÇO ABERTURA(R$)',
PREMIN_COT AS 'PREÇO MINIMO(R$)',
PREMED_COT AS 'PREÇO MEDIO(R$)',
PREMAX_COT AS 'PREÇO MAXIMO(R$)',
PREULT_COT AS 'ULTIMO PREÇO NEGOCIADO(R$)',
PREOFC_COT AS 'MELHOR PREÇO DE COMPRA(R$)',
PREOFV_COT AS 'MELHOR PREÇO DE VENDA(R$)',
TOTNEG_COT AS 'TOTAL NEG EFETUADO NO PREG�O',
QUATOT_COT AS 'QTD TOTAL NEGOCIADO',
VOLTOT_COT AS 'VOLUME TOTAL NEGOCIADO',
FATCOT_COT AS 'FATOR DE CORREÇÃO',
PTOEXE_COT AS 'PREÇO DE EXERCICIO P/ OPÇOES',
DISMES_COT AS 'N DE DISTRIBUIÇÃO',
CODBDI_COT AS 'CODIGO BDI',
PRAZOT_COT AS 'PRAZO DE TERMINO (D)',
DTPREG_COT AS 'DATA DO PREGAO',
TXSELI_SEL AS 'TAXA SELIC'
INTO TB_COTA_FILTROS
FROM TB_COTA(NOLOCK)
INNER JOIN TB_COTA_TB_EMPRESA(NOLOCK) ON IDCOTA_CCE = IDCOTA_COT
INNER JOIN TB_EMPRESA(NOLOCK) ON IDEMPR_EMP = IDEMPR_CCE
INNER JOIN TB_SETOR(NOLOCK) ON IDSETO_SET = IDSETO_EMP
INNER JOIN TB_SUBSETOR(NOLOCK) ON IDSSET_SSE = IDSSET_EMP
INNER JOIN TB_SEGMENTO(NOLOCK) ON IDSEGM_SEG = IDSEGM_EMP
LEFT JOIN TB_SELIC(NOLOCK) ON DTSELI_SEL = DTPREG_COT
WHERE CODEMP_EMP LIKE '%BBDC%' 
OR CODEMP_EMP LIKE '%ITUB%' 
OR CODEMP_EMP LIKE '%BBAS%'
AND PREABE_COT > 0
AND PREMIN_COT > 0
AND PREMED_COT > 0
AND PREMAX_COT > 0 
AND VOLTOT_COT > 0
GO