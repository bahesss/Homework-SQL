CREATE TABLE IF NOT EXISTS public.album
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    year integer,
    CONSTRAINT album_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.album
    OWNER to postgres;
	

/*---------------------------------------------------------------------*/
	

CREATE TABLE IF NOT EXISTS public.genre
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT genre_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genre
    OWNER to postgres;
	
	
/*---------------------------------------------------------------------*/
	

CREATE TABLE IF NOT EXISTS public.artist
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT artist_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.artist
    OWNER to postgres;


/*---------------------------------------------------------------------*/

	
CREATE TABLE IF NOT EXISTS public.track
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    duration double precision,
    album_id integer,
    CONSTRAINT track_pkey PRIMARY KEY (id),
    CONSTRAINT album_id_fk FOREIGN KEY (album_id)
        REFERENCES public.album (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.track
    OWNER to postgres;
	
	
/*---------------------------------------------------------------------*/	
	
	
CREATE TABLE IF NOT EXISTS public.collection
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    year integer,
    CONSTRAINT collection_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.collection
    OWNER to postgres;
	
	
/*---------------------------------------------------------------------*/


CREATE TABLE IF NOT EXISTS public.artists_albums
(
    id integer NOT NULL,
    artist_id integer,
    album_id integer,
    CONSTRAINT artists_albums_pkey PRIMARY KEY (id),
    CONSTRAINT album_id_fk FOREIGN KEY (album_id)
        REFERENCES public.album (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT artist_id_fk FOREIGN KEY (artist_id)
        REFERENCES public.artist (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.artists_albums
    OWNER to postgres;


/*---------------------------------------------------------------------*/

	
CREATE TABLE IF NOT EXISTS public.genres_artists
(
    id integer NOT NULL,
    genre_id integer,
    artist_id integer,
    CONSTRAINT genres_artists_pkey PRIMARY KEY (id),
    CONSTRAINT artist_id_fk FOREIGN KEY (artist_id)
        REFERENCES public.artist (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT genre_id_fk FOREIGN KEY (genre_id)
        REFERENCES public.genre (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genres_artists
    OWNER to postgres;
	
	
/*---------------------------------------------------------------------*/


CREATE TABLE IF NOT EXISTS public.track_collection
(
    id integer NOT NULL,
    collection_id integer,
    track_id integer,
    CONSTRAINT track_collection_pkey PRIMARY KEY (id),
    CONSTRAINT collection_id_fk FOREIGN KEY (collection_id)
        REFERENCES public.collection (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT track_id_fk FOREIGN KEY (track_id)
        REFERENCES public.track (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.track_collection
    OWNER to postgres;
