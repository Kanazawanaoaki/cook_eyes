#!/usr/bin/env python
import rospy
from geometry_msgs.msg import WrenchStamped

def callback(data):
    z = data.wrench.force.z
    if z < -1:
        print "OK!! " + str(z)
    else :
        print z

def listener():
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("/right_endeffector/wrench", WrenchStamped, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
