#!/usr/bin/env python

from __future__ import print_function

import argparse
import glob
import json
import os
import os.path as osp
import sys

import imgviz
import numpy as np
import PIL.Image

import labelme


label_file =  "annotated/382076.json"
# label_file = "annotated/IMG_5765.json"

out_img_file = "hoge_instance.jpg"
# out_img_file = "hogehoge_instance.jpg"

with open(label_file) as f:
    data = json.load(f)
    img_file = osp.join(osp.dirname(label_file), data['imagePath'])
    img = np.asarray(PIL.Image.open(img_file))
    PIL.Image.fromarray(img).save(out_img_file)


