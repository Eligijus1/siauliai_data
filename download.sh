#!/bin/sh

filesLocation="/home/elyga/Tools/downloads_from_siauliai_lt/siauliai_data"
currentDay=$(date +%Y-%m-%d)

fileNameMeroDienotvarke="mero_dienotvarke_$currentDay.html"
fileNameMeroPavaduotojo1Darbotvarke="mero_pavaduotojo_1_darbotvarke_$currentDay.html"

wget -O "$filesLocation/$fileNameMeroDienotvarke" https://www.siauliai.lt/lt/agenda/view/mero-dienotvarke

cd "$filesLocation"

git add .
git commit -a -m "Day $currentDay data."
git push origin main

sed -i 's/\/dist\/siauliai.min.css/resources\/siauliai.min.css/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/moment.min.js/resources\/moment.min.js/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/vendor.min.js/resources\/vendor.min.js/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/core.min.js/resources\/core.min.js/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/app.min.js/resources\/app.min.js/' "$fileNameMeroDienotvarke"
sed -i 's/\/static\/img\/siauliai\/logo.png/resources\/logo.png/' "$fileNameMeroDienotvarke"
sed -i 's/\/static\/img\/siauliai\/city.png/resources\/city.png/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/fonts\/fa-brands-400.woff2/resources\/fa-brands-400.woff2/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/fonts\/fa-solid-900.woff2/resources\/fa-solid-900.woff2/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/fonts\/fa-brands-400.woff/resources\/fa-brands-400.woff/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/fonts\/fa-brands-400.ttf/resources\/fa-brands-400.ttf/' "$fileNameMeroDienotvarke"
sed -i 's/\/dist\/fonts\/fa-solid-900.ttf/resources\/fa-solid-900.ttf/' "$fileNameMeroDienotvarke"
sed -i 's/\/static\/manifest\/manifest.json/resources\/manifest.json/' "$fileNameMeroDienotvarke"
sed -i 's/\/static\/manifest\/favicon.ico/resources\/favicon.ico/' "$fileNameMeroDienotvarke"
sed -i 's/\/static\/manifest\/favicon-32x32.png/resources\/favicon-32x32.png/' "$fileNameMeroDienotvarke"
sed -i 's/\/static\/manifest\/favicon-16x16.png/resources\/favicon-16x16.png/' "$fileNameMeroDienotvarke"

git add .
git commit -a -m "Day $currentDay data updated."
git push origin main

