#!/usr/bin/env python
import rospy
from geometry_msgs.msg import WrenchStamped

import matplotlib.pyplot as plt

y_list = []

def callback(data):
    y = data.wrench.force.y
    y_list.append(y)
    if y < -10:
        print "OK!! " + str(y)
    else :
        print y

def listener():
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("/right_endeffector/wrench", WrenchStamped, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
