# Worldmap ReadMe

## Allgemeiner Aufbau
Das Repository beinhaltet nur den Ordner für die Skripte (scripts). Die Inputs erfolgen über *collections-metadata.csv* aus dem reporting-Repository. Die Datei beinhaltet alle Städte des Projekts und mithilfe der Skripte im Skript-Ordner entsteht eine Liste mit den Koordinaten der jeweiligen Standorte und eine schöne Karte. Das entsprechende Repository muss demnach im gleichen Ordner geklont werden, wie dieses Repository.   

### Wichtig
Der User muss ein Ordner mit dem Namen *target* erstellen. Hier werden alle Erzeugnisse, wie die Weltkarte, abgelegt.


## TODO Automatisierung
https://brettops.io/blog/inkscape-container/



## Erstellung der Karte
### Vorbereitung
Sicherstellen, dass die Umgebungsvariablen R_HOME und INKSCAPE_HOME definiert sind. Inkscape wird in einer Version >= 1.2 benötigt.
z.B. mit Windows 11
```
R_HOME="/c/Program Files/R/R-4.1.2"
export R_HOME

INKSCAPE_BIN="/c/Program Files/Inkscape/bin/inkscape"
export INKSCAPE_BIN
```
bei MacOS müssen die Pfade entsprechend angepasst werden
z.B. `INKSCAPE_BIN="/Applications/Inkscape.app/Contents/MacOS/inkscape"`


Python-Erweiterung geopy muss installiert werden.

```
pip3 install geopy
```
Nachlesen: https://www.thepythoncode.com/article/get-geolocation-in-python


### Ausführung
Lediglich das Shell-Skript ausführen: process.sh  
Dieses Skript führt nacheinander folgende Skripte aus:

#### geocoding.py (Python)
Hiermit werden Koordinaten für die Standorte aus Input erstellt und in einer
neuen CSV-Datei in target ausgegeben.

#### worldmap-svg.R (R)
Hiermit wird, mithilfe der Koordinaten, eine Weltkarte, inklusive markierter Strandorte, erstellt.

Das shellscript führt anschließend Inkscape aus, um den relevanten Bereich vergrößert zu exportieren.

#### for docker 
#### Ensure Docker is installed and running on your machine
#### The command should be run in a terminal.
#### The below first command will Remove Existing Docker Image and Build New Docker Image
#### It is typically executed in the root directory of your project or in a directory where the collaborators-worldmap folder is accessible.
docker image rm -f godeep_collaborators_worldmap || true && \
docker build -t godeep_collaborators_worldmap -f collaborators-worldmap/docker/Dockerfile .

#### The Docker image godeep_collaborators_worldmap must be built before running this command.
docker run --rm \
  -v $(pwd)/reporting/collections-metadata.tsv:/var/build/reporting/collections-metadata.tsv \
  -v $(pwd)/collaborators-worldmap/target:/var/build/target/ \
  godeep_collaborators_worldmap
