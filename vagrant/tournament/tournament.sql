-- Table definitions for the tournament project.
-- Create database "tournament" and connect to that database before creating tables
\c vagrant
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Create Players table to store all the Players

CREATE TABLE Players(Player_ID serial,Name text,primary key(Player_ID));

-- Create Matches table to store all the Matches between Players

CREATE TABLE Matches(Match_ID serial , Winner int References Players(Player_ID),
	                 Loser int References Players(Player_ID),
	                 primary key(Match_ID));



--View to see all players and their number of wins
CREATE VIEW v_winners as select player_id as winner_id,name as
                         winner_name,count(matches.winner) as wins from
                         Players left join Matches on Players.player_id = Matches.winner
                         group by player_id;

--View to see all players and their number of losses
CREATE VIEW v_losers as select player_id as loser_id,name as
                        loser_name,count(matches.loser) as loses from Players left join Matches on
                        Players.player_id = Matches.loser group by player_id;



--View to see all players (ID and name) and their wins and losses.
CREATE VIEW v_matches as select winner_id,winner_name,wins,loses from
                         v_winners join v_losers on
                         v_winners.winner_id = v_losers.loser_id;

--View to see all players standings

CREATE VIEW v_players as select winner_id,winner_name,wins,wins+loses as
                         matches from v_matches order by wins desc;


