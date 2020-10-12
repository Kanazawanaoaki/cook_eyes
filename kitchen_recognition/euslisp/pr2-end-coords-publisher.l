#!/usr/bin/env roseus

(load "package://pr2eus/pr2-interface.l")
(pr2-init)

(ros::roseus-add-msgs "geometry_msgs")
(ros::roseus "pr2-end-coords")
(ros::advertise "/pr2_end_coords/right" geometry_msgs::PoseStamped 1)
(ros::rate 100)
(while (ros::ok)
  (setq msg (instance geometry_msgs::PoseStamped :init))
  
  )
