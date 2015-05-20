- mocities.sql
--
--   This script creates the spatial table.
--
--   Execute this script before attempting to use SQL*Loader
--   to load the mocities.ctl file.
--
--   This script will also populate the USER_SDO_GEOM_METADATA table.
--   Loading the .ctl file will populate the MOCITIES table.
--
--   To load the .ctl file, run SQL*Loader as follows
--   substituting appropriate values:
--       sqlldr username/password mocities.ctl
--
--   After the data is loaded in the MOCITIES table, you should
--   migrate polygon data and create the spatial index 
--
-- Creation Date : Fri Apr 17 12:37:03 2015
-- Copyright 1999, 2004 Oracle Corporation
-- All rights reserved
--
DROP TABLE MOCITIES;

CREATE TABLE MOCITIES (
  CITY 	VARCHAR2(14), 
  LAT 	NUMBER, 
  LON 	NUMBER, 
  LOCATION 	MDSYS.SDO_GEOMETRY);

DELETE FROM USER_SDO_GEOM_METADATA 
  WHERE TABLE_NAME = 'MOCITIES' AND COLUMN_NAME = 'LOCATION' ;

INSERT INTO USER_SDO_GEOM_METADATA (TABLE_NAME, COLUMN_NAME, DIMINFO, SRID) 
  VALUES ('MOCITIES', 'LOCATION', 
    MDSYS.SDO_DIM_ARRAY 
      (MDSYS.SDO_DIM_ELEMENT('X', -180.000000000, 180.000000000, 0.005000000), 
       MDSYS.SDO_DIM_ELEMENT('Y', -90.000000000, 90.000000000, 0.005000000)  
     ), 
     8307); 
COMMIT;
