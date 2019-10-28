-- Delete alternatenames of geoname entries that have uninteresting featurecodes or a population < 100
DELETE alternatename
FROM alternatename
LEFT JOIN
    geoname ON geoname.geonameid = alternatename.geonameid
WHERE
    geoname.population < 100 or geoname.population is NULL or geoname.fcode IN (
         'BLDG'
        ,'ADMF'
        ,'AGRC'
        ,'AGRF'
        ,'AIRB'
        ,'AIRF'
        ,'AIRP'
        ,'AMUS'
        ,'ANS'
        ,'BAR'
        ,'BAY'
        ,'BDG'
        ,'BLDA'
        ,'BLDO'
        ,'BTL'
        ,'CH'
        ,'CHN'
        ,'CMN'
        ,'CMP'
        ,'CMPMN'
        ,'CMTY'
        ,'CNS'
        ,'COMC'
        ,'CRTR'
        ,'CST'
        ,'CSTL'
        ,'CSTM'
        ,'CTRB'
        ,'CTRCM'
        ,'CULT'
        ,'DAM'
        ,'DEVH'
        ,'DLTA'
        ,'EST'
        ,'FCL'
        ,'FJD'
        ,'FLD'
        ,'FRM'
        ,'FRMS'
        ,'FRST'
        ,'HLL'
        ,'HMSD'
        ,'HSE'
        ,'HSEC'
        ,'HSP'
        ,'HSTS'
        ,'HTL'
        ,'INSM'
        ,'LCTY'
        ,'LK'
        ,'LTER'
        ,'MALL'
        ,'MAR'
        ,'MFG'
        ,'MILB'
        ,'MKT'
        ,'MLSW'
        ,'MNC'
        ,'MSQE'
        ,'MT'
        ,'MTS'
        ,'PEN'
        ,'PGDA'
        ,'PK'
        ,'PKLT'
        ,'PKS'
        ,'PND'
        ,'PO'
        ,'PRK'
        ,'PRN'
        ,'PRSH'
        ,'PT'
        ,'RD'
        ,'RDGE'
        ,'RECG'
        ,'REST'
        ,'RESV'
        ,'RESW'
        ,'RGNH'
        ,'RHSE'
        ,'RK'
        ,'RNCH'
        ,'RR'
        ,'RSRT'
        ,'RSTN'
        ,'RSTP'
        ,'RSV'
        ,'RUIN'
        ,'SAND'
        ,'SCH'
        ,'SCHC'
        ,'SCHL'
        ,'SCHT'
        ,'SEA'
        ,'SHSE'
        ,'SNOW'
        ,'SQR'
        ,'ST'
        ,'STBL'
        ,'STDM'
        ,'STM'
        ,'STMI'
        ,'STNM'
        ,'STNR'
        ,'STRT'
        ,'SWMP'
        ,'THTR'
        ,'TMPL'
        ,'TOWR'
        ,'TREE'
        ,'TRIG'
        ,'TWO'
        ,'UNIV'
        ,'USGE'
        ,'VAL'
    );

-- Delete hierarchy entries of geoname entries that have uninteresting featurecodes or a population < 100
DELETE geonames.hierarchy
FROM geonames.hierarchy 
LEFT JOIN
    geonames.geoname AS g ON g.geonameid = geonames.hierarchy.parentId
WHERE
	g.geonameid IS NULl;

-- Delete hierarchy entries of geoname entries that have uninteresting featurecodes or a population < 100
DELETE geonames.hierarchy
FROM geonames.hierarchy 
LEFT JOIN
    geonames.geoname AS g ON g.geonameid = geonames.hierarchy.childId
WHERE
	g.geonameid IS NULl;

-- Delete entries that have uninteresting featurecodes or a population < 100
DELETE geoname
FROM geoname
WHERE
    geoname.population < 100 or geoname.population is NULL or geoname.fcode IN (
         'BLDG'
        ,'ADMF'
        ,'AGRC'
        ,'AGRF'
        ,'AIRB'
        ,'AIRF'
        ,'AIRP'
        ,'AMUS'
        ,'ANS'
        ,'BAR'
        ,'BAY'
        ,'BDG'
        ,'BLDA'
        ,'BLDO'
        ,'BTL'
        ,'CH'
        ,'CHN'
        ,'CMN'
        ,'CMP'
        ,'CMPMN'
        ,'CMTY'
        ,'CNS'
        ,'COMC'
        ,'CRTR'
        ,'CST'
        ,'CSTL'
        ,'CSTM'
        ,'CTRB'
        ,'CTRCM'
        ,'CULT'
        ,'DAM'
        ,'DEVH'
        ,'DLTA'
        ,'EST'
        ,'FCL'
        ,'FJD'
        ,'FLD'
        ,'FRM'
        ,'FRMS'
        ,'FRST'
        ,'HLL'
        ,'HMSD'
        ,'HSE'
        ,'HSEC'
        ,'HSP'
        ,'HSTS'
        ,'HTL'
        ,'INSM'
        ,'LCTY'
        ,'LK'
        ,'LTER'
        ,'MALL'
        ,'MAR'
        ,'MFG'
        ,'MILB'
        ,'MKT'
        ,'MLSW'
        ,'MNC'
        ,'MSQE'
        ,'MT'
        ,'MTS'
        ,'PEN'
        ,'PGDA'
        ,'PK'
        ,'PKLT'
        ,'PKS'
        ,'PND'
        ,'PO'
        ,'PRK'
        ,'PRN'
        ,'PRSH'
        ,'PT'
        ,'RD'
        ,'RDGE'
        ,'RECG'
        ,'REST'
        ,'RESV'
        ,'RESW'
        ,'RGNH'
        ,'RHSE'
        ,'RK'
        ,'RNCH'
        ,'RR'
        ,'RSRT'
        ,'RSTN'
        ,'RSTP'
        ,'RSV'
        ,'RUIN'
        ,'SAND'
        ,'SCH'
        ,'SCHC'
        ,'SCHL'
        ,'SCHT'
        ,'SEA'
        ,'SHSE'
        ,'SNOW'
        ,'SQR'
        ,'ST'
        ,'STBL'
        ,'STDM'
        ,'STM'
        ,'STMI'
        ,'STNM'
        ,'STNR'
        ,'STRT'
        ,'SWMP'
        ,'THTR'
        ,'TMPL'
        ,'TOWR'
        ,'TREE'
        ,'TRIG'
        ,'TWO'
        ,'UNIV'
        ,'USGE'
        ,'VAL'
    );

-- Delete those featurecodes that are not associated with any entries anymore
DELETE 
FROM geonames.featureCodes as fc
WHERE fc.code in (
    SELECT DISTINCT
        fcode
    FROM (
            SELECT
                f.code as fcode,
                g.geonameid as geonameid
            FROM
                geonames.featureCodes as f
            LEFT JOIN
                geonames.geoname as g
            on
                CONCAT(g.fclass,'.',g.fcode) = f.code
          ) as temp0
            WHERE temp0.geonameid is null
);

-- This a wrongly named region 
UPDATE geonames.alternatename SET alternateName = "Australien und Neuseeland" WHERE isoLanguage = 'de' AND alternateName = 'Austral Anden Nev Zealand';

-- THESE ARE GERMAN NAMES THAT MISS THE isShortName Attribute
UPDATE geonames.alternatename SET isShortName = 1 WHERE alternatenameId IN (
     1563766
    ,2727971
    ,617790
    ,1561488
    ,1554487
    ,1561881
    ,1619327
    ,1555855
    ,1563581
    ,1562791
    ,2422318
    ,1561708
);

