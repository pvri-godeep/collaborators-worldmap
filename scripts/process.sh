#!/bin/sh 



python geocoding.py

"$R_HOME"/bin/Rscript --no-save --no-restore worldMap.R
"$R_HOME"/bin/Rscript --no-save --no-restore legend.R

python imgCrop.py
python imgPaste.py
python imgDel.py