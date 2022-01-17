from PIL import Image 
import os

dirname = os.path.dirname(__file__)

# -------------- World -------------------------------------------------- 

worldInputOutput = os.path.join(dirname, '../target/wolrdMap.png')

world = Image.open(worldInputOutput) 
  
croppedWorld = world.crop((0, 130, 600, 360)) 
  
croppedWorld.save(worldInputOutput) 


# -------------- Legend -------------------------------------------------

legendInputOutput = os.path.join(dirname, '../target/legend.png')

legend = Image.open(legendInputOutput) 
  
croppedLegend = legend.crop((0, 117, 600, 163)) 
  
croppedLegend.save(legendInputOutput) 