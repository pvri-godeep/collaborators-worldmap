#!/bin/sh 

INKSCAPE_BIN="$INKSCAPE_HOME"/bin/inkscape.exe

set -e

# make sure target directory exists
mkdir -p ../target

# get current date
d=$(date "+%Y%m%d")

# retrieve lat/lon for all participating hospital cities
python geocoding.py

# remove previous latest output image if existing. date tagged copies will remain.
rm -f ../target/worldmap-latest.svg
rm -f ../target/worldmap-web-latest.svg
rm -f ../target/worldmap-latest-800.png

# generate the worldmap as SVG
"$R_HOME"/bin/Rscript --no-save --no-restore worldmap-svg.R

# copy result to date tagged file
cp -f ../target/worldmap-latest.svg ../target/"$d"_worldmap.svg

# render SVG to cropped pixel images for presentations and web

"$INKSCAPE_BIN" --batch-process --export-filename=../target/worldmap-latest-800.png --export-height=800 --export-area=70:135:800:445 ../target/worldmap-latest.svg
cp -f ../target/worldmap-latest-800.png ../target/"$d"_worldmap-800.png 

"$INKSCAPE_BIN" --batch-process --export-filename=../target/worldmap-web-latest-800.png --export-width=800 --export-area=70:135:800:445 ../target/worldmap-web-latest.svg
cp -f ../target/worldmap-web-latest-800.png ../target/"$d"_worldmap-web-800.png 

