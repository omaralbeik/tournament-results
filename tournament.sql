-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- remove any old database (if available)
DROP DATABASE IF EXISTS tournament;

-- drop any old tables
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS matches;

-- create the database
CREATE DATABASE tournament;

-- players table
CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT
)

-- matches table
CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players (id) ON DELETE CASCADE,
  opponent_id INTEGER REFERENCES players (id) ON DELETE CASCADE,
  winner_id INTEGER REFERENCES players (id) ON DELETE CASCADE
)

-- connect to database
\c tournament;
