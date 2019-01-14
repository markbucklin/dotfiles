#!/bin/bash




git config --global alias.ignore '!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi'
npm i -g add-gitignore