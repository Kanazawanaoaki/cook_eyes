#!/usr/bin/env python
import rospy
from geometry_msgs.msg import WrenchStamped

def callback(data):
    print data.wrench.force.z

def listener():
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("/right_endeffector/wrench", WrenchStamped, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
