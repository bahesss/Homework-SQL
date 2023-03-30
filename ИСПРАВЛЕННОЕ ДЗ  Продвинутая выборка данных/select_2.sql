SELECT
	g."name",
	count(genres_artists.artist_id)
from genre g
inner join genres_artists
	ON genres_artists.genre_id = g.id
group by g."name";

/*---------------------------------------------------------*/

SELECT
	count(track.id) as count_tracks
from album
inner join track 
ON track.album_id = album.id
and album."year" BETWEEN 2019 and 2020;

/*---------------------------------------------------------*/

SELECT
	album."name",
	round( CAST(avg(track.duration) as numeric), 2) as avg_duration
from album
inner join track 
ON track.album_id = album.id
group by album."name";

/*---------------------------------------------------------*/

SELECT
	artist."name"
from artist
where artist.id not in (SELECT
							artists_albums.artist_id
						from album
						inner join artists_albums
						ON artists_albums.album_id = album.id
						and album."year" = 2020);

/*---------------------------------------------------------*/

SELECT
	collection.name
from collection
inner join track_collection
ON track_collection.collection_id = collection.id
inner join track
ON track.id = track_collection.track_id
inner join album 
ON album.id = track.album_id
inner join artists_albums
ON artists_albums.album_id = album.id
inner join artist 
ON artist.id = artists_albums.artist_id
and artist."name" = 'Metallica';

/*---------------------------------------------------------*/

SELECT
	album."name"
from album 
inner join artists_albums
ON artists_albums.album_id = album.id
inner join artist 
ON artist.id = artists_albums.artist_id
inner join genres_artists 
ON genres_artists.artist_id = artist.id
inner join genre
ON genre.id = genres_artists.genre_id
group by album."name"
having count(DISTINCT genre."name") > 1;

/*---------------------------------------------------------*/

SELECT
	track.name
from collection
right join track_collection
ON track_collection.collection_id = collection.id
right join track
ON track.id = track_collection.track_id
where collection.id is null;
					
/*---------------------------------------------------------*/

SELECT
	artist."name"
from track
inner join album 
ON album.id = track.album_id
and track.duration = (SELECT
							min(track.duration)
						from track)
inner join artists_albums
ON artists_albums.album_id = album.id
inner join artist 
ON artist.id = artists_albums.artist_id;

/*---------------------------------------------------------*/

SELECT
	album."name"
from album 
inner join track
ON track.album_id = album.id
group by album."name"
having count(track.id) = (SELECT
								count(track.id) as count_tracks
							from album 
							inner join track
							ON track.album_id = album.id
							group by album."name"
						    order by count_tracks
						    limit 1
						 );

/*---------------------------------------------------------*/