# Custom Notes: Import Relevant Geoname-data to your MySQL-instance

This is a fork of [codigofuerte/GeoNames-MySQL-DataImport](https://github.com/codigofuerte/GeoNames-MySQL-DataImport) that deletes many entries. It works for MySQL 8.

## MySQL config

The MySQL-version used in development is v8. Note that for older mysql versions (<=5.6), an index of varchar with length `varchar(200)` is too much. Whenever an entry is used as an index, change occurrences of `varchar(200)` to `varchar(191)` in 'geonames_db_struct.sql`.


### New DB

Add a database with name `geonames` that is encoded in default UTF8 (in MySQL: `utf8mb4`).

```sql
CREATE DATABASE geonames CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### New user

Create a user that can only access the `geonames` database.

```sql
GRANT ALL PRIVILEGES ON geonames.* TO 'geonames'@'localhost' IDENTIFIED BY 'REPLACETHISWITHTHERIGHTPASSWORD';
```

### Optional: Set timeout values for imports

You might have to increase the mysql values for `net_read_timeout`, `net_write_timeout`, and `connect_timeout` in case you get time-out errors when importing.

```sql
SET GLOBAL connect_timeout=3600
SET GLOBAL wait_timeout=3600
SET GLOBAL net_read_timeout=3600
SET GLOBAL net_write_timeout=3600
```

## Configure the script

In `geonames_importer.sh`, configure the necessary parameters:

```bash
# Default values for database variables.
dbhost="localhost"
dbport=3306
dbname="geonames"
dbusername="geonames"
dbpassword="REPLACETHISWITHTHERIGHTPASSWORD"
```

## Fresh install

```bash
# give the right permissions
chmod +x geonames_importer.sh

# download the data
./geonames_importer.sh -a download-data

# create the db-structure
./geonames_importer.sh -a create-db

# import the data dumps
./geonames_importer.sh -a import-dumps

# delete the unncessary entries and edit some countries/regions
./geonames_importer.sh -a edit-entries
```

## Update

```bash
# download the data
./geonames_importer.sh -a download-data

# delete the old data
./geonames_importer.sh -a truncate-db

# import the data dumps
./geonames_importer.sh -a import-dumps

# delete the unncessary entries and edit some countries/regions
./geonames_importer.sh -a edit-entries
```

# Original notes: V 2.0 Shell Script for importing geonames.org data dumps into a MySQL database.

Usage: 

    ./geonames_importer.sh -a "action"

Where "action" can be: 
  
- **download-data** Downloads the last packages of data available in GeoNames. An additional parameter with a download directory should be used.
- **create-db** Creates the mysql database structure with no data.
- **create-tables** Creates the tables in the current database. Useful if we want to import them in an exsiting db.
- **import-dumps** Imports geonames data into db. A database is previously needed for this to work.
- **drop-db** Removes the db completely.
- **truncate-db** Removes geonames data from db.
    
The <a href="http://codigofuerte.github.com/GeoNames-MySQL-DataImport" target="_blank">reference site</a> is still under construction for this new version. Stay tuned to this site.

