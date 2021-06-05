#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image 
from cv_bridge import CvBridge
import cv2
import numpy as np

from std_msgs.msg import Int64

def subtract_cb(msg):
    try:
        bridge = CvBridge()
        img = bridge.imgmsg_to_cv2(msg, "bgr8")
        fgmask = fgbg.apply(img)
        cv2.imshow('image', img)
        cv2.imshow('frame', fgmask)
        x , y = np.where(fgmask > 200)
        num = x.size
        rospy.loginfo(num)
        pub.publish(num)
        cv2.waitKey(1)
    except Exception as err:
        print err


def listener():
    rospy.init_node('subtractor',anonymous=True)
    rospy.Subscriber("/kinect_head/rgb/image_rect_color", Image, subtract_cb)
    rospy.spin()


if __name__ == '__main__':
    pub = rospy.Publisher('subtractor_detection', Int64, queue_size=10)
    fgbg = cv2.bgsegm.createBackgroundSubtractorMOG()
    listener()

