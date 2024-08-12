from geopy.geocoders import Nominatim
import time
from pprint import pprint
import csv
import os


app = Nominatim(user_agent="tutorial") # instantiate a new Nominatim client


dirname = os.path.dirname(__file__)
input   = os.path.join(dirname, 'reporting/collections-metadata.tsv')
output  = os.path.join(dirname, 'target/coords.csv')

header = ['City', 'Latitude', 'Longitude','etl_status']

# Cache coordinates previously written to output
coordcache = {}
try:
    with open(output, newline='') as csvfile:
        reader = csv.DictReader(csvfile, delimiter=';')
        for row in reader:
            coordcache[row[header[0]]] = (row[header[1]],row[header[2]])
except FileNotFoundError:
    print("Coordinate cache not found. All coordinates will be loaded.")

csvdata = []

# This function returns a location as raw from an address will repeat until success
def get_location_by_address(address):
    # before any internet calls, check cache first
    if address in coordcache:
        latlon = coordcache[address]
        return {'lat':latlon[0], 'lon':latlon[1]}
    
    time.sleep(1) # needed because of rate limiting of the public address lookup API
    try:
        return app.geocode(address).raw
    except:
        return get_location_by_address(address)


# Hiermit werden die Koordianten mit hilfe des IMputs erstellt und für die Ausgabe vorbereitet
with open(input) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter='\t')
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
    

# overwrite coordinate cache/output file. this will be used for generating the map via R.
with open(output, 'w', newline='') as f:
    writer = csv.writer(f, delimiter =';')

    # write the header
    writer.writerow(header)

    # write multiple rows
    writer.writerows(csvdata)
