DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS study_list;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS tag_assignments;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS resources;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY NOT NULL,
  	name VARCHAR(50) NOT NULL,
  	is_faculty BOOLEAN NOT NULL
);

CREATE TABLE resources (
	resource_id SERIAL PRIMARY KEY NOT NULL,
  	title VARCHAR NOT NULL,
  	description VARCHAR,
  	url VARCHAR NOT NULL UNIQUE,
  	origin VARCHAR,
  	author_id INTEGER NOT NULL,
  	creation_date TIMESTAMP DEFAULT current_timestamp,
  	content_type VARCHAR NOT NULL,
  	recommended_week VARCHAR,
  	evaluation VARCHAR,	
  	justification TEXT,
  	FOREIGN KEY (author_id) REFERENCES users(user_id)
);

CREATE TABLE tags(
	tag_id SERIAL PRIMARY KEY NOT NULL,
  	name VARCHAR UNIQUE NOT NULL
);

CREATE TABLE tag_assignments(
	tag_assignment_id SERIAL PRIMARY KEY NOT NULL,
	tag_id INTEGER,
	resource_id INTEGER,
	FOREIGN KEY (tag_id) REFERENCES tags(tag_id),
	FOREIGN KEY (resource_id) REFERENCES resources(resource_id)
);

CREATE TABLE comments(
	comment_id SERIAL PRIMARY KEY NOT NULL,
  	body TEXT NOT NULL,
  	author_id INTEGER,
  	resource_id INTEGER,
  	FOREIGN KEY (author_id) REFERENCES users(user_id),
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id)
);

CREATE TABLE study_list(
	study_list_id SERIAL PRIMARY KEY NOT NULL,
  	author_id INTEGER,
  	resource_id INTEGER,
  	FOREIGN KEY (author_id) REFERENCES users(user_id),
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id)
);

CREATE TABLE votes(
	vote_id SERIAL PRIMARY KEY NOT NULL,
	user_id INTEGER,
	resource_id INTEGER,
	is_upvote BOOLEAN NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (resource_id) REFERENCES users(user_id)
);










