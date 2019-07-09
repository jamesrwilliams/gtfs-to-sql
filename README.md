# GTFS to SQL

A SQL load script for importing General Transit Feed Specification (GTFS) files into an SQL database.

## Before you start

**Edit the file to ensure the database name and file locations are correct.**

The script by default expects the script to be run along side a `/data` directory with the GTFS text files inside. This path can be changed in the various `LOAD DATA LOCAL INFILE` lines at the bottom of the SQL script.

## Running the loader

Example usage: 

```bash
cat load-gtfs.sql | mysql -p -u root
``` 

## Useful Links

- [GTFS Static Overview](https://developers.google.com/transit/gtfs/)
- [GTFS File Types](https://developers.google.com/transit/gtfs/reference/)
