#!/usr/bin/env python
import rospy
from geometry_msgs.msg import WrenchStamped

import matplotlib.pyplot as plt

z_list = []


def callback(data):
    z = data.wrench.force.z

    z_list.append(z)
    f = open('wrench_z_list.txt', 'w')
    for x in z_list:
        f.write(str(x) + "\n")
    f.close()
    
    if z > -5:
        print "OK!! " + str(z)
    else :
        print z

def listener():
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("/right_endeffector/wrench", WrenchStamped, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
