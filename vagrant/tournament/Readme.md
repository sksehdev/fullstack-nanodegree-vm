Project 2 for the Udacity Full Stack Nanodegree

The Project contains three files in tournament folder

1) tournament.py : This file has python code for running the server code and interacting with tournament database

2) tournament.sql: This file has sql statements for the creation of database,creation of tables and view
                   There are two tables created :
                   One is Player table : database of all the players registeres
                   one is matches table : database of all the matched reported
                   There are three views
                   one for all the players with their wins , one for their loses and one for wins and loses
3) tournament_test.py : This is same file provided and it contains unit test for testing the python server code

To run the project,these are the steps below:
1) ssh into the vagrant VM by "vagrant ssh" command from vagrant directory
2) Inside the vagrant , go to the shared directory which shared with the host machine by cd /vagrant then cd tournament
3) Once inside the tournament directory in the vagrant ,type psql ,this command you will be inside postgres terminal
   where you can access database information and type in sql statements
4) In the postgres terminal type in \i tournament.sql
   this command will go to tournament.sql file and create new database named tournament and two tables Players and Matches
   and views mentioned above in the tournament.sql description
5) Once tables and views are created,we can test code in tournament.py by using unit tests tournament_test.py
6) tournament.py has 8 function and below is the brief description of those function
  a) connect() : This function is used connect to the PostgreSQL database.  Returns a database connection.
  b)deleteMatches(): This function is used to delete all the entries from the matches table in the database
  c) deletePlayers(): This function is used to delete all the players from the players table
  d)countPlayers(): Returns the number of players currently registered.
  e) registerPlayer(name):Adds a player to the tournament database.
  f)playerStandings():Returns a list of the players and their win records, sorted by wins.
  g) reportMatch(winner, loser):Records the outcome of a single match between two players.
  h) swissPairings():Returns a list of pairs of players for the next round of a match.



