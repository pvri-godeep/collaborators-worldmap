# Worldmap ReadMe

## Allgemeiner Aufbau
Das Repository beinhaltet nur den Ordner für die Skripte (scripts). Die Inputs erfolgen über *collections-metadata.csv* aus dem reporting-Repository. Die Datei beinhaltet alle Städte des Projekts und mithilfe der Skripte im Skript-Ordner entsteht eine Liste mit den Koordinaten der jeweiligen Standorte und eine schöne Karte. Das entsprechende Repository muss demnach im gleichen Ordner geklont werden, wie dieses Repository.   

### Wichtig
Der User muss ein Ordner mit dem Namen *target* erstellen. Hier werden alle Erzeugnisse, wie die Weltkarte, abgelegt.

  



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

