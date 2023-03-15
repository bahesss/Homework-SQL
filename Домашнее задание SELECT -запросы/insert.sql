INSERT INTO public.genre (id, name) VALUES (1, 'metal');
INSERT INTO public.genre (id, name) VALUES (2, 'pop');
INSERT INTO public.genre (id, name) VALUES (3, 'rock');
INSERT INTO public.genre (id, name) VALUES (4, 'hip hop');
INSERT INTO public.genre (id, name) VALUES (5, 'Dance/Electronic');


INSERT INTO public.artist (id, name) VALUES (1, 'Slayer');
INSERT INTO public.artist (id, name) VALUES (2, 'Metallica');
INSERT INTO public.artist (id, name) VALUES (4, 'AC/DC');
INSERT INTO public.artist (id, name) VALUES (8, 'Pantera');
INSERT INTO public.artist (id, name) VALUES (3, 'Eminem');
INSERT INTO public.artist (id, name) VALUES (6, 'Red Hot Chili Peppers');
INSERT INTO public.artist (id, name) VALUES (5, 'Madonna');
INSERT INTO public.artist (id, name) VALUES (7, 'Daft Punk');


INSERT INTO public.album (id, name, year) VALUES (1, 'Reign in Blood', 1986);
INSERT INTO public.album (id, name, year) VALUES (2, '...And Justice for All', 1988);
INSERT INTO public.album (id, name, year) VALUES (3, 'Back in Black', 1980);
INSERT INTO public.album (id, name, year) VALUES (4, 'Cowboys from Hell', 1990);
INSERT INTO public.album (id, name, year) VALUES (5, 'The Eminem Show', 2002);
INSERT INTO public.album (id, name, year) VALUES (6, 'Californication', 1999);
INSERT INTO public.album (id, name, year) VALUES (7, 'Like a Prayer', 1989);
INSERT INTO public.album (id, name, year) VALUES (8, 'Discovery', 2001);


INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (1, 1, 1);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (2, 1, 2);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (3, 4, 3);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (4, 3, 4);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (5, 2, 5);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (6, 3, 6);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (7, 5, 7);
INSERT INTO public.genres_artists (id, genre_id, artist_id) VALUES (8, 1, 8);


INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (1, 1, 1);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (2, 2, 2);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (3, 3, 3);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (4, 4, 4);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (5, 5, 5);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (6, 6, 6);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (7, 7, 7);
INSERT INTO public.artists_albums (id, artist_id, album_id) VALUES (8, 8, 8);


INSERT INTO public.collection (id, name, year) VALUES (1, 'Soundtrack to the Apocalypse', 2003);
INSERT INTO public.collection (id, name, year) VALUES (2, 'Garage Inc.', 1998);
INSERT INTO public.collection (id, name, year) VALUES (3, 'Backtracks', 2009);
INSERT INTO public.collection (id, name, year) VALUES (4, 'The Best of Pantera', 2003);
INSERT INTO public.collection (id, name, year) VALUES (5, 'Curtain Call: The Hits', 2005);
INSERT INTO public.collection (id, name, year) VALUES (6, 'Greatest Hits', 2002);
INSERT INTO public.collection (id, name, year) VALUES (7, 'Celebration ', 2009);
INSERT INTO public.collection (id, name, year) VALUES (8, 'The Complete Studio Albums', 2008);


INSERT INTO public.track (id, name, duration, album_id) VALUES (1, 'Angel Of Death', 4.52, 1);
INSERT INTO public.track (id, name, duration, album_id) VALUES (2, 'Postmortem', 3.28, 1);
INSERT INTO public.track (id, name, duration, album_id) VALUES (3, 'Eye Of The Beholder', 6.31, 2);
INSERT INTO public.track (id, name, duration, album_id) VALUES (4, 'The Shortest Straw', 6.36, 2);
INSERT INTO public.track (id, name, duration, album_id) VALUES (5, 'Hell Bells', 5.1, 3);
INSERT INTO public.track (id, name, duration, album_id) VALUES (6, 'Givin the Dog a Bone', 3.32, 3);
INSERT INTO public.track (id, name, duration, album_id) VALUES (7, 'Primal Concrete Slidge', 2.14, 4);
INSERT INTO public.track (id, name, duration, album_id) VALUES (8, 'Heresy', 4.47, 4);
INSERT INTO public.track (id, name, duration, album_id) VALUES (9, 'White Americe', 5.25, 5);
INSERT INTO public.track (id, name, duration, album_id) VALUES (10, 'Business', 4.12, 5);


INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (1, 1, 1);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (2, 1, 2);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (3, 2, 3);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (4, 2, 4);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (5, 3, 5);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (6, 3, 6);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (7, 4, 7);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (8, 4, 8);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (9, 5, 9);
INSERT INTO public.track_collection (id, collection_id, track_id) VALUES (10, 5, 10);

