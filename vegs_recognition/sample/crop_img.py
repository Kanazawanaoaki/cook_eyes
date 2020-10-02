import cv2
import sys

path = "carrot-rotate-peel-kinect/pr2_kinect_after_peel.png"
if len(sys.argv)>=2:
    path = sys.argv[1]

im = cv2.imread(path)
h,w,ch = im.shape

im_cropped = im[int(round(h/8))*5:int(round(h/4))*3 , int(round(w/8))*3:int(round(w/8))*5, :]

cv2.imwrite('sample_cropped.jpg', im_cropped, [int(cv2.IMWRITE_JPEG_QUALITY), 100])
print(im_cropped.shape)

