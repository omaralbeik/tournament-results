# Swiss Tournament Results
A database schema and application to store the game matches between players and determine the winners based on the swiss tournament style, using Python and PSQL

##Installation
####Prerequisites:
- Git [download](http://git-scm.com/downloads)
- Virtual Box [download](https://www.virtualbox.org/wiki/Downloads)
- Vagrant [download](https://www.vagrantup.com/downloads.html)

####How to Install:
1. Open terminal:
2. Move to your favorite parent directory
  - this directory will be used to store the entire project files
3. Clone the virtual machine configurations
  - Run: `git clone http://github.com/udacity/fullstack-nanodegree-vm tournament`
4. move to *vagrant* directory by entering `cd tournament/vagrant/`
5. Clone the project files
  - Run: `git clone https://github.com/omaralbeik/tournament-results.git tournament`
  - this will add the project to *tournament* inside the *vagrant* directory
6. Start Vagrant by entering: `vagrant up`

####How to Run:
Once all steps above are complete, you can connect to the virtual machine.

1. Log into Vagrant virtual machine:
  - Run `vagrant ssh`
2. Move to *tournament* directory:
  - Enter `cd /vagrant/tournament/`
3. Create the required database:
  - Run `psql -f tournament.sql`
4. Launch Python command line:
  - Run `python`
5. Import tournament:
  - Run `import tournament`

##### to register a new player:
```
tournament.registerPlayer(player name)
```

##### to report a match results:
```
tournament.reportMatch(winner, loser)
```

##### to get pairings:
```
tournament.swissPairings()
```

##### to delete all players:
```
tournament.deletePlayers()
```

##### to delete all matches:
```
tournament.deleteMatches()
```

##### to get a list of the players and their win records:
```
tournament.playerStandings()
```

##### delete the entire database ad start fress again:
  - exit python command line by entering `exit()`

```
psql -f tournament.sql
```
