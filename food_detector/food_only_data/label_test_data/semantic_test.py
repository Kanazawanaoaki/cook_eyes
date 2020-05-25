import base64
import io
import json
import os.path as osp

import numpy as np
import PIL.Image

from labelme import __version__
from labelme.logger import logger
from labelme import PY2
from labelme import QT4
from labelme import utils


filename = "annotated/382076.json"
# filename = "annotated/IMG_5765.json"



with open(filename, 'rb' if PY2 else 'r') as f:
    data = json.load(f)

if data['imageData'] is not None:
    print("imagedata1")
    img = base64.b64decode(data['imageData'])
    if PY2 and QT4:
        print("imagedata2")
        img = utils.img_data_to_png_data(imageData)

else:
    print("in else")
    image_pil = PIL.Image.open(filename)
    image_pil = utils.apply_exif_orientation(image_pil)

    with io.BytesIO() as f:
        ext = osp.splitext(filename)[1].lower()
        if PY2 and QT4:
            format = 'PNG'
        elif ext in ['.jpg', '.jpeg']:
            format = 'JPEG'
        else:
            format = 'PNG'
        image_pil.save(f, format=format)
        f.seek(0)
        img = f.read()

out_img_file = "hoge_semantic.jpg"
# out_img_file = "hogehoge_semantic.jpg"

with open(out_img_file, 'wb') as f:
    f.write(img)
