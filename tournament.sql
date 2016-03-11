-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- remove any old database (if available)
DROP DATABASE IF EXISTS tournament;

-- create the database
CREATE DATABASE tournament;

-- connect to database
\c tournament;


-- players table contains ids and names for all players
--| id | name |--

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- matches table contains information about played matches
--| id | player1 | opponent2 | winner |--

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  player1 INTEGER REFERENCES players(id) ON DELETE CASCADE,
  player2 INTEGER REFERENCES players(id) ON DELETE CASCADE,
  winner INTEGER REFERENCES players(id) ON DELETE CASCADE
);


-- players_matches: number of matches played by each player
-- | id | name | matches |--

CREATE VIEW players_matches AS
  SELECT players.id as id, players.name as name, COUNT(matches) as matches
  FROM players LEFT OUTER JOIN matches
  ON players.id = matches.player1 OR players.id = matches.player2
  GROUP BY players.id;


-- players_wins: number of wins for each player
--| id | name | wins |--

CREATE VIEW players_wins AS
  SELECT players.id as id, players.name as name, COUNT(matches) as wins
  FROM players LEFT OUTER JOIN matches
  ON players.id = matches.winner
  GROUP BY players.id
  ORDER BY wins DESC;


-- players_standings: number of wins and matches played for each player
--| id | name | wins | matches|--

CREATE VIEW players_standings AS
  SELECT players.id as id, players.name as name, players_wins.wins as wins, players_matches.matches as matches
  FROM players, players_wins, players_matches
  WHERE players.id = players_wins.id and players_wins.id = players_matches.id;
