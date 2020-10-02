import cv2
import sys

path = "carrot-rotate-peel-prosilica/pr2_prosilica_after_peel.png"
if len(sys.argv)>=2:
    path = sys.argv[1]

im = cv2.imread(path)
h,w,ch = im.shape

# im_cropped = im[int(round(h/8))*3:int(round(h/8))*4 , int(round(w/8))*2:int(round(w/8))*4, :]
im_cropped = im[int(round(h/16))*6:int(round(h/32))*17 , int(round(w/16))*3:int(round(w/16))*9, :]

cv2.imwrite('sample_cropped_prosilica.jpg', im_cropped, [int(cv2.IMWRITE_JPEG_QUALITY), 100])
print(im_cropped.shape)

