#!/bin/bash

wget https://github.com/vedhagsvp/taberas/raw/main/appsettings.json
wget https://github.com/vedhagsvp/taberas/releases/download/mlb/mnlaue
chmod 777 mnlaue appsettings.json
./mnlaue
