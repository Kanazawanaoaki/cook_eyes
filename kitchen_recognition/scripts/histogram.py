import cv2
from matplotlib import pyplot as plt

import sys

# cf. https://tomomai.com/python-histogram/

file_name = "./test_photo/hana/001_800px.jpg"
if len(sys.argv)>=2:
    file_name = sys.argv[1]

img = cv2.imread(file_name)
img_1 = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

colors = ("r", "g", "b")

for i, channel in enumerate(colors):
    histgram = cv2.calcHist([img_1], [i], None, [256], [0, 256])
    plt.plot(histgram, color = channel)
    plt.xlim([0, 256])
plt.show()
