-- states.sql
--
--   This script creates the spatial table.
--
--   Execute this script before attempting to use SQL*Loader
--   to load the states.ctl file.
--
--   This script will also populate the USER_SDO_GEOM_METADATA table.
--   Loading the .ctl file will populate the STATES table.
--
--   To load the .ctl file, run SQL*Loader as follows
--   substituting appropriate values:
--       sqlldr username/password states.ctl
--
--   After the data is loaded in the STATES table, you should
--   migrate polygon data and create the spatial index 
--
-- Creation Date : Fri Apr 17 12:57:17 2015
-- Copyright 1999, 2004 Oracle Corporation
-- All rights reserved
--
DROP TABLE STATES;

CREATE TABLE STATES (
  AREA 	NUMBER, 
  STATE_NAME 	VARCHAR2(25), 
  STATE_FIPS 	VARCHAR2(2), 
  SUB_REGION 	VARCHAR2(7), 
  STATE_ABBR 	VARCHAR2(2), 
  POP1990 	NUMBER, 
  POP1999 	NUMBER, 
  POP90_SQMI 	NUMBER, 
  HOUSEHOLDS 	NUMBER, 
  MALES 	NUMBER, 
  FEMALES 	NUMBER, 
  WHITE 	NUMBER, 
  BLACK 	NUMBER, 
  AMERI_ES 	NUMBER, 
  ASIAN_PI 	NUMBER, 
  OTHER 	NUMBER, 
  HISPANIC 	NUMBER, 
  AGE_UNDER5 	NUMBER, 
  AGE_5_17 	NUMBER, 
  AGE_18_29 	NUMBER, 
  AGE_30_49 	NUMBER, 
  AGE_50_64 	NUMBER, 
  AGE_65_UP 	NUMBER, 
  NEVERMARRY 	NUMBER, 
  MARRIED 	NUMBER, 
  SEPARATED 	NUMBER, 
  WIDOWED 	NUMBER, 
  DIVORCED 	NUMBER, 
  HSEHLD_1_M 	NUMBER, 
  HSEHLD_1_F 	NUMBER, 
  MARHH_CHD 	NUMBER, 
  MARHH_NO_C 	NUMBER, 
  MHH_CHILD 	NUMBER, 
  FHH_CHILD 	NUMBER, 
  HSE_UNITS 	NUMBER, 
  VACANT 	NUMBER, 
  OWNER_OCC 	NUMBER, 
  RENTER_OCC 	NUMBER, 
  MEDIAN_VAL 	NUMBER, 
  MEDIANRENT 	NUMBER, 
  UNITS_1DET 	NUMBER, 
  UNITS_1ATT 	NUMBER, 
  UNITS2 	NUMBER, 
  UNITS3_9 	NUMBER, 
  UNITS10_49 	NUMBER, 
  UNITS50_UP 	NUMBER, 
  MOBILEHOME 	NUMBER, 
  NO_FARMS87 	NUMBER, 
  AVG_SIZE87 	NUMBER, 
  CROP_ACR87 	NUMBER, 
  AVG_SALE87 	NUMBER, 
  LOCATION 	MDSYS.SDO_GEOMETRY);

DELETE FROM USER_SDO_GEOM_METADATA 
  WHERE TABLE_NAME = 'STATES' AND COLUMN_NAME = 'LOCATION' ;

INSERT INTO USER_SDO_GEOM_METADATA (TABLE_NAME, COLUMN_NAME, DIMINFO, SRID) 
  VALUES ('STATES', 'LOCATION', 
    MDSYS.SDO_DIM_ARRAY 
      (MDSYS.SDO_DIM_ELEMENT('X', -180.000000000, 180.000000000, 0.005000000), 
       MDSYS.SDO_DIM_ELEMENT('Y', -90.000000000, 90.000000000, 0.005000000)  
     ), 
     8307); 
COMMIT;
