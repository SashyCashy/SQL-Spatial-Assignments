set echo on;
spool lab1geo;
create type cityInfo as object (
cityName varchar2 (100),
latitude number,
longitude number,
member function getLongitude return varchar2,
pragma restrict_references(getLongitude,WNDS));
/

create type treasureInfo as object(
treasureName varchar2(150),
propertyDetails varchar2(1050));
/

create type treasureDetails as varray(10) of treasureInfo;
/

create or replace type body cityInfo as member function getLongitude return
varchar2 is result varchar2(100);

BEGIN
if(self.longitude < 0) THEN
result := Replace(to_char (self.longitude),'-' || 'W';
else
result := Replace(to_char (self.longitude),'-' || 'E';
end if;
return result;
end;
end;
/

show errors;

create table museum (museumId number,
musuemName varchar2(125),
country varchar2(120),
category varchar2(120),
city cityInfo,
treasures treasureDetails,
wlink varchar2(150),
primary key(museumId));

INSERT INTO museum VALUES(1,'Museo Nacional de Antropologia','Mexico', 'Archaeological and Anthropological Museum',
cityInfo('Mexico City',21.3114,-157.7964),
treasureDetails(treasureInfo('Pectoral Huasteca','Found in Ancient Tamuin'),
treasureInfo('Atlatl and Fisga','An ancient mexican weapon')),
'http://www.mna.inah.gob.mx/index.html');

INSERT INTO museum VALUES(2,'Rijksmuseum','Netherlands', 'Ancient Art',
cityInfo('Amsterdam',52.3667,4.9000),
treasureDetails(treasureInfo('Eight Stacked Beams','Carel Visser, 1964'),
treasureInfo('Children of the Sea','Jozef Israels, 1872'),
treasureInfo('Model of the William Rex','Cornelis Moesman, Adriaen de Vriend, 1698'),
treasureInfo('Wine fountain and cooler','attributed to Alger Mensma, 1731 - 1732'),
treasureInfo('Stadtholder’s chair','Gerrit Hutte, Pieter van Dijck, 1747')),
'https://www.rijksmuseum.nl/en/explore-the-collection');

INSERT INTO museum VALUES(3,'Heritage Museum','Russia', 'Modern Art',
cityInfo('Saint Petersburg',59.9500,30.3000),
ult := Replace(to_char (self.longitude),'-' || 'W';
else
result := Replace(to_char (self.longitude),'-' || 'E';
end if;
return result;
end;
end;
/

show errors;

create table museum (museumId number,
musuemName varchar2(125),
country varchar2(120),
category varchar2(120),
city cityInfo,
treasures treasureDetails,
wlink varchar2(150),
primary key(museumId));

@

reasureDetails(treasureInfo('Rubens and His Age','Catherine the Great''s son.')),
'http://www.hermitagemuseum.org/');

INSERT INTO museum VALUES(4,'Shaanxi History Museum','China', 'Modern Art',
cityInfo('Shaanxi',35.6000,108.4000),
treasureDetails(treasureInfo('Ox-Shaped Zun','Unearthed in 1967 '),
treasureInfo('Du Tige-Shapred Tally','Unearthed in 1957')),
'http://e.sxhm.com/');

INSERT INTO museum VALUES(5,'Vatican Musuem','Italy', 'Archaeological and Anthropological Museum',
cityInfo('Vatican City',41.9033, 12.4533),
treasureDetails(treasureInfo('Fresco of Mercury','-'),
treasureInfo('A Colossal Statue of Ceres','identified by grain in her hand.')),
'http://www.museivaticani.va/');

INSERT INTO museum VALUES(6,'Honolulu Museum of Art','United States', 'Ancient Art',
cityInfo('Honolulu',21.3114,-157.7964),
treasureDetails(treasureInfo(' 18,000 paintings, sculptures','from ancient times'),
treasureInfo('View of the Castel dellOvo, Naples','Carlo Bonavia'),
treasureInfo('Dancing Krishna idol','14th Century')),
'http://honolulumuseum.org/');

INSERT INTO museum VALUES(7,'Art Institute of Chicago','U.S.', 'Modern Art',
cityInfo('Chicago',41.8369, 87.6847),
treasureDetails(treasureInfo('Fragment of a Mosaic with the Apostle Andrew','Painted in 11th Century '),
treasureInfo('Head of Aphrodite','1st century A.D. Byzantine. Greece')),
'http://www.artic.edu/');

INSERT INTO museum VALUES(8,'The Acropolis Museum','Greece', 'Ancient Art',
cityInfo('Athens',37.9667, 23.7167),
treasureDetails(treasureInfo('The Archiac Gallery','Hekatompedon')
),
'http://www.theacropolismuseum.gr/');

INSERT INTO museum VALUES(9,'Smithsonian''s National Air and Space Museum','U.S.','Space Gallery',
cityInfo('Washington D.C.',38.8951, 77.0367),
treasureDetails(treasureInfo('Command Module, Apollo 11','first manned spacecraft'),
treasureInfo('Missile, Surface-to-Surface, Matador TM-61C','nuclear warhead')),
'http://airandspace.si.edu/');

INSERT INTO museum VALUES(10,'Brooklyn Museum','United States', 'Ancient Art',
cityInfo('New York',40.7127,- 74.0059),
treasureDetails(treasureInfo('Head of a Guardian','1185–1333'),
treasureInfo('S. Marco, Venice, Italy','1901'),
treasureInfo('Block Statue of Senwosret-senebefny','Middle Kingdom')),
'http://www.brooklynmuseum.org/home.php');

spool off;
