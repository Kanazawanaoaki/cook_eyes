#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image 
from cv_bridge import CvBridge
import cv2
import numpy

def subtract_cb(msg):
    try:
        bridge = CvBridge()
        # orig = bridge.imgmsg_to_cv2(msg, "bgr8")
        img = bridge.imgmsg_to_cv2(msg, "bgr8")
        fgmask = fgbg.apply(img)
        cv2.imshow('image', img)
        cv2.imshow('frame', fgmask)
        # print(img.shape)
        # print(fgmask.shape)
        # mergeImg = numpy.vstack((img, fgmask))
        # cv2.imshow('frame', mergeImg)
        cv2.waitKey(1)
    except Exception as err:
        print err


def listener():
    rospy.init_node('subtractor',anonymous=True)
    rospy.Subscriber("/kinect_head/rgb/image_rect_color", Image, subtract_cb)
    rospy.spin()


if __name__ == '__main__':
    fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()
    listener()

    
    # img_src1 = cv2.imread("/mnt/hdd0/20210417/20210417_09_bag_images/left0058.jpg", 1)
    # img_src2 = cv2.imread("/mnt/hdd0/20210417/20210417_09_bag_images/left0059.jpg", 1)

    # fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()

    # fgmask = fgbg.apply(img_src1)
    # fgmask = fgbg.apply(img_src2)

    # cv2.imshow('frame',fgmask)

    # bg_diff_path  = './diff.jpg'
    # cv2.imwrite(bg_diff_path,fgmask)

    # cv2.waitKey(0)
    # cv2.destroyAllWindows()
