#!/bin/sh 

set -e

# get date
d=$(date "+%Y%m%d")

python geocoding.py

# remove previous latest output image. date tagged copies will remain.
rm ../target/worldmap-latest.svg
rm ../target/worldmap-web-latest.svg
rm ../target/worldmap-latest-800.png

"$R_HOME"/bin/Rscript --no-save --no-restore worldmap-svg.R
cp -f ../target/worldmap-latest.svg ../target/"$d"_worldmap.svg

"$INKSCAPE_BIN" --batch-process --export-filename=../target/worldmap-latest-800.png --export-height=800 --export-area=70:135:800:445 ../target/worldmap-latest.svg
cp -f ../target/worldmap-latest-800.png ../target/"$d"_worldmap-800.png 

"$INKSCAPE_BIN" --batch-process --export-filename=../target/worldmap-web-latest-800.png --export-width=800 --export-area=70:135:800:445 ../target/worldmap-web-latest.svg
cp -f ../target/worldmap-web-latest-800.png ../target/"$d"_worldmap-web-800.png 