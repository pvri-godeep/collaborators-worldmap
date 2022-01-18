# Worldmap ReadMe

## Allgemeiner Aufbau
Das Repository beinhaltet drei zwei Ordner für die Inputs (input) und die Skripte (scripts). Der Input-Ordner beinhaltet alle Städte des Projekts und mithilfe der Skripte im Skript-Ordner entsteht eine Liste mit den Koordinaten der jeweiligen Standorte und eine schöne Karte.  
### Wichtig
Der User muss ein Ordner mit dem Namen *target* erstellen. Hier werden alle Erzeugnisse, wie die Weltkarte, abgelegt.

  
## Input
Der Ordner beinhaltet eine csv-Datei, die alle Standorte des Projekts enthält.  
### Wichtig 
Wenn ein neuer Standort hinzukommt, bitte folgendes Format in die neue Zelle 
übertragen: Land, Stadt


## Erstellung der Karte
### Vorbereitung
Einige Python-Erweiterungen müssen installiert werden.

#### geopy
Installation 
```
pip3 install geopy
```
Nachlesen: https://www.thepythoncode.com/article/get-geolocation-in-python

#### Pillow
Installation
```
pip3 install Pillow
```

### Ausführung
Lediglich das Shell-Skript ausführen: process.sh  
Dieses Skript führt nacheinander folgende Skripte aus:

#### geocoding.py (Python)
Hiermit werden Koordinaten für die Standorte aus Input erstellt und in einer
neuen CSV-Datei in target ausgegeben.

#### worldMap.R (R)
Hiermit wird, mithilfe der Koordinaten, eine Weltkarte, inklusive markierter Strandorte, erstellt.

#### legend.R (R)
Hiermit wird eine Legende für die Weltkarte erstellt.

#### imgCrop.py (Python)
Hiermit werden die beiden erstellten Bilder passend zugeschnitten.

#### imgPaste.py (Python)
Hiermit werden die beiden zugeschnittenen Bilder zusammengefügt.

#### imgDel.py (Python)
Hiermit wird das Bild mit der Legende gelöscht, weil dieses Bild nicht mehr notwendig ist.

