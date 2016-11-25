My solution for Udacity: Intro to Relational Databases
=============
A Simple Tournament Planner to to keep track of players and matches in a game tournament.

Install VM
=============
Git & VirtualBox & Vagrant installation please refer to [Vagrant VM Installation](https://udacity.atlassian.net/wiki/display/BENDH/Vagrant+VM+Installation)

Download codes and start VM
=============
1. ```git clone git@github.com:liangxibing/fullstack-nanodegree-vm.git```
2. ```cd ./fullstack/vagrant```
3. ```vagrant up```
4. ```vagrant ssh```

Initialize database
=============
1. ```cd /vagrant/tournament```
2. ```psql```
3. ```\i tournament.sql```

Run tournament program
=============
1. ```cd /vagrant/tournament```
2. ```python tournament_test.py```
