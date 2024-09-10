#!/bin/sh

INKSCAPE_BIN=$INKSCAPE_HOME

set -e

# make sure target directory exists
mkdir -p /var/build/target

# get current date
d=$(date "+%Y%m%d")

# retrieve lat/lon for all participating hospital cities
python /var/build/geocoding.py

# remove previous latest output image if existing. date tagged copies will remain.
rm -f /var/build/target/worldmap-latest.svg
rm -f /var/build/target/worldmap-web-latest.svg
rm -f /var/build/target/worldmap-latest-800.png

# generate the worldmap as SVG
"$R_HOME"/bin/Rscript --no-save --no-restore /var/build/worldmap-svg.R

# copy result to date tagged file
cp -f /var/build/target/worldmap-latest.svg /var/build/target/"$d"_worldmap.svg

# render SVG to cropped pixel images for presentations and web

"$INKSCAPE_BIN" --batch-process --export-filename=/var/build/target/worldmap-latest-800.png --export-height=800 --export-area=70:135:800:445 /var/build/target/worldmap-latest.svg
cp -f /var/build/target/worldmap-latest-800.png /var/build/target/"$d"_worldmap-800.png

"$INKSCAPE_BIN" --batch-process --export-filename=/var/build/target/worldmap-web-latest-800.png --export-width=800 --export-area=70:135:800:445 /var/build/target/worldmap-web-latest.svg
cp -f /var/build/target/worldmap-web-latest-800.png /var/build/target/"$d"_worldmap-web-800.png
