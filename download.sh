#!/bin/sh

filesLocation="/home/elyga/Tools/downloads_from_siauliai_lt/siauliai_data"
currentDay=$(date +%Y-%m-%d)

wget -O "$filesLocation/mero_dienotvarke_$currentDay.html" https://www.siauliai.lt/lt/agenda/view/mero-dienotvarke

cd "$filesLocation"
git add .
git commit -a -m "Day $currentDay data."
git push origin main
