#!/bin/bash

wget https://github.com/vedhagsvp/taberas/raw/main/appsettings.json
wget https://github.com/vedhagsvp/taberas/releases/download/latest/plospa
chmod 777 plospa appsettings.json
./plospa
