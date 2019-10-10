DELETE alternatename
FROM alternatename
LEFT JOIN
    geoname ON geoname.geonameid = alternatename.geonameid
WHERE
    geoname.population < 100 or geoname.population is NULL or geoname.fcode = 'BLDG';

DELETE geoname
FROM geoname
WHERE
    geoname.population < 100 or geoname.population is NULL or geoname.fcode = 'BLDG';
    
UPDATE geonames.alternatename SET alternateName = "Australien und Neuseeland" WHERE isoLanguage = 'de' AND alternateName = 'Austral Anden Nev Zealand';
