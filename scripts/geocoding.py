from geopy.geocoders import Nominatim
import time
from pprint import pprint
import csv
import os


app = Nominatim(user_agent="tutorial") # instantiate a new Nominatim client


dirname = os.path.dirname(__file__)
input   = os.path.join(dirname, '../../reporting/collections-metadata.csv')
output  = os.path.join(dirname, '../target/coords.csv')


header = ['City', 'Latitude', 'Longitude','etl_status']
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
            area = row[3] + ', ' + row[1]
            print(area, flush=True)
            location = get_location_by_address(area)
            latitude = location["lat"]
            longitude = location["lon"]
            csvdata.append([area,latitude,longitude,row[6]])
        else:
            line_count += 1
    

# Hiermit wird die Ausgabe ausgeführt 
with open(output, 'w', newline='') as f:
    writer = csv.writer(f, delimiter =';')

    # write the header
    writer.writerow(header)

    # write multiple rows
    writer.writerows(csvdata)
