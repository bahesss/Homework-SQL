SELECT
	g."name",
	count(artist."name")
from genre g
inner join genres_artists
	ON genres_artists.genre_id = g.id
inner join artist 
	ON artist.id = genres_artists.artist_id
group by g."name"

/*---------------------------------------------------------*/

SELECT
	count(track.id) as count_tracks
from album
inner join track 
ON track.album_id = album.id
and album."year" BETWEEN 2019 and 2020

/*---------------------------------------------------------*/

SELECT
	album."name",
	round( CAST(avg(track.duration) as numeric), 2) as avg_duration
from album
inner join track 
ON track.album_id = album.id
group by album."name"

/*---------------------------------------------------------*/

SELECT
	artist."name"
from album
inner join artists_albums
ON artists_albums.album_id = album.id
and album."year" <> 2020
inner join artist
ON artist.id = artists_albums.artist_id

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
and artist."name" = 'Metallica'

/*---------------------------------------------------------*/

SELECT
	t1.name
from (SELECT
		album."name",
		count(DISTINCT genre."name") as count_genre
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
	) t1
where t1.count_genre > 1

/*---------------------------------------------------------*/

SELECT
	name
from track
where name not in (SELECT
						track.name
					from collection
					inner join track_collection
					ON track_collection.collection_id = collection.id
					inner join track
					ON track.id = track_collection.track_id)
					
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
ON artist.id = artists_albums.artist_id

/*---------------------------------------------------------*/

SELECT
	t2.name
from (SELECT
	album."name",
	count(track.id) as count_tracks
from album 
inner join track
ON track.album_id = album.id
group by album."name") t2
where t2.count_tracks = (SELECT
							min(t1.count_tracks)
						from (SELECT
								album."name",
								count(track.id) as count_tracks
							from album 
							inner join track
							ON track.album_id = album.id
							group by album."name") t1)

/*---------------------------------------------------------*/