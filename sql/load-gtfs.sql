/*
Updated script by James Williams <https://jamesrwilliams.ca>
Original script contributed by Michael Perkins
https://github.com/sbma44/py-gtfs-mysql/blob/master/sql_better/load.sql
*/

CREATE DATABASE IF NOT EXISTS gtfs_to_sql;

USE gtfs_to_sql

DROP TABLE IF EXISTS agency;

CREATE TABLE `agency` (
	agency_id VARCHAR(255),
	agency_name VARCHAR(255),
	agency_url VARCHAR(255),
	agency_timezone VARCHAR(255),
	agency_lang VARCHAR(255),
	agency_phone VARCHAR(255),
	agency_fare_url VARCHAR(255)
);

DROP TABLE IF EXISTS calendar_dates;

CREATE TABLE `calendar_dates` (
	service_id VARCHAR(255),
	`date` VARCHAR(255),
	exception_type VARCHAR(255)
);

DROP TABLE IF EXISTS fare_attributes;

CREATE TABLE `fare_attributes` (
	fare_id VARCHAR(255),
	price VARCHAR(255),
	currency_type VARCHAR(255),
	payment_method VARCHAR(255),
	transfers VARCHAR(255)
);

DROP TABLE IF EXISTS fare_rules;

CREATE TABLE `fare_rules` (
	fare_id VARCHAR(255),
	origin_id VARCHAR(255),
	destination_id VARCHAR(255)
);

DROP TABLE IF EXISTS feed_info;

CREATE TABLE `feed_info` (
    feed_publisher_name VARCHAR(255),
    feed_publisher_url VARCHAR(255),
    feed_lang VARCHAR(255),
    feed_start_date VARCHAR(255),
    feed_end_date VARCHAR(255),
    feed_version VARCHAR(255)
);

DROP TABLE IF EXISTS routes;

CREATE TABLE `routes` (
    route_id VARCHAR(255) PRIMARY KEY,
    agency_id VARCHAR(255),
    route_short_name VARCHAR(255),
    route_long_name VARCHAR(255),
    route_type VARCHAR(255),
    route_color VARCHAR(255),
    route_text_color VARCHAR(255)
);

DROP TABLE IF EXISTS shapes;

CREATE TABLE `shapes` (
    shape_id VARCHAR(255),
    shape_pt_lat VARCHAR(255),
    shape_pt_lon VARCHAR(255),
    shape_pt_sequence VARCHAR(255)
);

DROP TABLE IF EXISTS stop_amentities;

CREATE TABLE `stop_amentities` (
    stop_id VARCHAR(255),
    shelter VARCHAR(255),
    washroom VARCHAR(255),
    bike_rack VARCHAR(255),
    bench VARCHAR(255)
);

DROP TABLE IF EXISTS stop_times;

CREATE TABLE `stop_times` (
    trip_id VARCHAR(255),
    arrival_time VARCHAR(255),
    departure_time VARCHAR(255),
    stop_id VARCHAR(255),
    stop_sequence VARCHAR(255),
    pickup_type VARCHAR(255),
    drop_off_type VARCHAR(255),
    stop_headsign VARCHAR(255)
);

DROP TABLE IF EXISTS stops;

CREATE TABLE `stops` (
    stop_id VARCHAR(255),
    stop_name VARCHAR(255),
    stop_lat VARCHAR(255),
    stop_lon VARCHAR(255),
    zone_id VARCHAR(255),
    stop_url VARCHAR(255),
    location_type VARCHAR(255),
    parent_station VARCHAR(255),
    wheelchair_boarding VARCHAR(255)
);

DROP TABLE IF EXISTS transfers;

CREATE TABLE `transfers` (
    from_stop_id VARCHAR(255),
    to_stop_id VARCHAR(255),
    transfer_type VARCHAR(255),
    min_transfer_time VARCHAR(255)
);

DROP TABLE IF EXISTS trips;

CREATE TABLE `trips` (
    route_id VARCHAR(255),
    service_id VARCHAR(255),
    trip_id VARCHAR(255),
    trip_headsign VARCHAR(255),
    trip_short_name VARCHAR(255),
    direction_id VARCHAR(255),
    block_id VARCHAR(255),
    shape_id VARCHAR(255),
    wheelchair_accessible VARCHAR(255),
    bikes_allowed VARCHAR(255),
    route_variant VARCHAR(255)
);

LOAD DATA LOCAL INFILE 'data/agency.txt' INTO TABLE agency FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/calendar_dates.txt' INTO TABLE calendar_dates FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/fare_attributes.txt' INTO TABLE fare_attributes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/fare_rules.txt' INTO TABLE fare_rules FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/feed_info.txt' INTO TABLE feed_info FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/routes.txt' INTO TABLE routes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/shapes.txt' INTO TABLE shapes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/stop_amentities.txt' INTO TABLE stop_amentities FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/stop_times.txt' INTO TABLE stop_times FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/stops.txt' INTO TABLE stops FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/transfers.txt' INTO TABLE transfers FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'data/trips.txt' INTO TABLE trips FIELDS TERMINATED BY ',' IGNORE 1 LINES;
