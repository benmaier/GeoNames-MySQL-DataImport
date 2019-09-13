### V 2.0 Shell Script for importing geonames.org data dumps into a MySQL database.

Usage: geonames_importer.sh -a "action"

Where "action" can be: 
  
- **download-data** Downloads the last packages of data available in GeoNames. An additional parameter with a download directory should be used.
- **create-db** Creates the mysql database structure with no data.
- **create-tables** Creates the tables in the current database. Useful if we want to import them in an exsiting db.
- **import-dumps** Imports geonames data into db. A database is previously needed for this to work.
- **drop-db** Removes the db completely.
- **truncate-db** Removes geonames data from db.
    
The <a href="http://codigofuerte.github.com/GeoNames-MySQL-DataImport" target="_blank">reference site</a> is still under construction for this new version. Stay tuned to this site.

### BFM notes

Don't forget to add the password in `geonames_importer.sh`.

An additional command `./geonames_importer.sh -a delete-unneccessary` was added. This command removes entries with population numbers < 100 and buildings (featue code BLDG).

Before updating, make sure to truncate the existing data. Then import again and delete unncessary.

Note that for older mysql versions, an index of varchar with length `varchar(200)` is too much. Whenever an entry is used as an index, change occurrences of `varchar(200)` to `varchar(191)`.

Maybe increase the mysql values for `net_read_timeout`, `net_write_timeout` and `connection_timeout` in case you get errors in that regard.
