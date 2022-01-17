NOCH NICHT FERTIG


Innerhalb des Input-Ordners kann eine Liste mit allen Städten des Projekts
gepflegt werden. 
Milhilfe der Scribte in scribts ensteht eine Liste mit den Koordinaten der 
Standorte und eine schöne Karte.

Input
Die csv-Datei beinhaltet alle Standorte des Projekts.
Wenn ein neuer Standort hinzukommt, bitte folgendes Vormat in die neue Zelle 
übertragen:
Land, Stadt


Erstellung der Karte
Vorbereitung
Einige Pythonerweiterungen müssen installiert werden.
geopy
Installation -> pip3 install geopy
Nachlesen https://www.thepythoncode.com/article/get-geolocation-in-python
Pillow
Installation -> pip3 install Pillow

Ausführung
Lediglich das Shell-Script ausführen: process.sh

Ausführung im Detail
Folgende Skripte werden nacheinander ausgeführt:

geocoding.py (Python)
Hiermit werden Koordinaten für die Standorte aus Input erstellt und in einer
neuen CSV-Datei in target ausgegeben.

worldMap.R (R)
Hiermit wird, mithilfe der Koordinaten, eine Weltkarte, inklusive markierter Strandorte, erstellt.

legend.R (R)
Hiermit wird eine Legende für die Weltkarte erstellt.

imgCrop.py (Python)
Hiermit werden die beiden erstellten Bilder passent zugeschnitten.

imgPaste.py (Python)
Hiermit werden die beiden zugeschnittenen Bilder zusammengefügt.

imgDel.py (Python)
Hiermit wird das Bild mit der Legende gelöscht, weil dieses Bild nicht mehr notwendig ist.
