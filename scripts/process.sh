#!/bin/sh 

set -e

# get date
d=$(date "+%Y%m%d")

inkscape="bin/inkscape.exe"

python geocoding.py

# remove previous latest output image. date tagged copies will remain.
rm ../target/worldmap-latest.svg
rm ../target/worldmap-latest-800.png

"$R_HOME"/bin/Rscript --no-save --no-restore worldmap-svg.R
cp -f ../target/worldmap-latest.svg ../target/"$d"_worldmap.svg

"$INKSCAPE_HOME"/bin/inkscape --batch-process --export-filename=../target/worldmap-latest-800.png --export-height=800 --export-area=70:135:800:445 ../target/worldmap-latest.svg
cp -f ../target/worldmap-latest-800.png ../target/"$d"_worldmap-800.png 