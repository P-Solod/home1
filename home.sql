CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
); 

CREATE TABLE IF NOT EXISTS Perfomers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresPerfomers(
	genres_id INTEGER REFERENCES Genres(id),
	perfomers_id INTEGER REFERENCES Perfomers(id),
	CONSTRAINT pk PRIMARY KEY (genres_id, perfomers_id)
);

CREATE TABLE IF NOT EXISTS Albums(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	released VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS PerfomersAlbums(
	perfomers_id INTEGER REFERENCES Perfomers(id),
	albums_id INTEGER REFERENCES Albums(id),
	CONSTRAINT fk PRIMARY KEY (perfomers_id, albums_id)
);

CREATE TABLE IF NOT EXISTS Songs(
	id SERIAL PRIMARY KEY,
	albums_id INTEGER NOT NULL REFERENCES Albums(id),
	name VARCHAR(60) NOT NULL,
	duration VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	released VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS SongsCompilation(
	songs_id INTEGER REFERENCES Songs(id),
	compilation_id INTEGER REFERENCES Compilation(id),
	CONSTRAINT vk PRIMARY KEY (songs_id, compilation_id)
);