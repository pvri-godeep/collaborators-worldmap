import os

dirname = os.path.dirname(__file__)

img = os.path.join(dirname, '../target/legend.png')

os.remove(img) 
