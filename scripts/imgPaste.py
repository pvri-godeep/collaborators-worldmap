from PIL import Image
import os

imageWidth=600
imageHeight=(230+46)

dirname = os.path.dirname(__file__)
img1 = os.path.join(dirname, '../target/wolrdMap.png')
img2 = os.path.join(dirname, '../target/legend.png')

imgNew = Image.new("RGB", (imageWidth, imageHeight))

imgPart1 = Image.open(img1)
imgPart2 = Image.open(img2)


imgNew.paste(imgPart1, (0,0))
imgNew.paste(imgPart2, (0,230))
imgNew.save(img1)