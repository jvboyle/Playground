import os
from PIL import Image

source_folder = './photos'
dest_folder = './photos/OutPut'

# List all images from source
files = os.scandir(source_folder)
for file in files:
    if (file.name.endswith('.jpg')):
        # Load the image
        img = Image.open(file.path)
        # Convert the image to grayscale
        #img_gray = img.convert('L')
        img_gray = img.convert('RGB')
        # Threshold the image to create a mask
        threshold = 100
        mask = img_gray.point(lambda x: x < threshold and 255)
        # Find the bounding box of the object
        bbox = mask.getbbox()
        # Crop the image
        cropped_img = img.crop(bbox)
        # Save the cropped image
        cropped_img.save('{}/{}'.format(dest_folder, file.name))

