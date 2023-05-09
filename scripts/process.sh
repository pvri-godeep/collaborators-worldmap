#!/bin/sh 

set -e

inkscape="bin/inkscape.exe"

python geocoding.py

"$R_HOME"/bin/Rscript --no-save --no-restore worldmap-svg.R

"$INKSCAPE_HOME"/bin/inkscape --batch-process --export-filename=../target/worldmap-latest-800.png --export-height=800 --export-area=70:135:800:445 ../target/worldmap-latest.svg
