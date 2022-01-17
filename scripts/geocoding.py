from geopy.geocoders import Nominatim
import time
from pprint import pprint
import csv
import os


app = Nominatim(user_agent="tutorial") # instantiate a new Nominatim client


dirname = os.path.dirname(__file__)
input   = os.path.join(dirname, '../input/cities.csv')
output  = os.path.join(dirname, '../target/coords.csv')


header = ['City', 'Latitude', 'Longitude']
csvdata = []


# This function returns a location as raw from an address will repeat until success
def get_location_by_address(address):
    time.sleep(1) # Wichtig - nicht löschen
    try:
        return app.geocode(address).raw
    except:
        return get_location_by_address(address)


# Hiermit werden die Koordianten mit hilfe des IMputs erstellt und für die Ausgabe vorbereitet
with open(input) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=';')
    line_count = 0
    for row in csv_reader:
        if line_count != 0:
            print(row[0])
            location = get_location_by_address(row[0])
            latitude = location["lat"]
            longitude = location["lon"]
            csvdata.append([row[0],latitude,longitude])
        else:
            line_count += 1
    

# Hiermit wird die Ausgabe ausgeführt 
with open(output, 'w', newline='') as f:
    writer = csv.writer(f, delimiter =';')

    # write the header
    writer.writerow(header)

    # write multiple rows
    writer.writerows(csvdata)
