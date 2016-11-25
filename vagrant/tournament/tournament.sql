-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

CREATE TABLE Players (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE Matches (
  id SERIAL PRIMARY KEY,
  winner INTEGER REFERENCES Players(id),
  loser INTEGER REFERENCES Players(id)
);

CREATE VIEW PlayerWins AS
SELECT Players.id, COUNT(Matches.winner) AS wins
FROM Players LEFT JOIN Matches
ON Players.id = Matches.winner
GROUP BY Players.id;

CREATE VIEW PlayerMatches AS
SELECT Players.id, COUNT(Matches.id) AS Matches
FROM Players LEFT JOIN Matches
ON Players.id = Matches.winner
OR Players.id = Matches.loser
GROUP BY Players.id;

CREATE VIEW PlayerStandings AS
SELECT Players.id, Players.name, PlayerWins.wins, PlayerMatches.matches
FROM Players
JOIN PlayerWins
ON Players.id = PlayerWins.id
JOIN PlayerMatches
ON Players.id = PlayerMatches.id
ORDER BY PlayerWins.wins DESC;
