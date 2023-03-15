SELECT
	name,
	YEAR
from album
where "year" = 2018;

/*---------------------------------------------------------------------*/

SELECT
	name,
	duration
from track
where duration = (
					SELECT
						max(duration)
					from track
				);
				
/*---------------------------------------------------------------------*/

SELECT
	name
from track
where duration >= 3.5;

/*---------------------------------------------------------------------*/

SELECT
	name
from collection
where year between 2018 and 2020;

/*---------------------------------------------------------------------*/

SELECT
	name
from artist
where name not like '% %';

/*---------------------------------------------------------------------*/

SELECT
	name
from track
where lower(name) LIKE '%my%'
or lower(name) LIKE '%мой%';

/*---------------------------------------------------------------------*/
