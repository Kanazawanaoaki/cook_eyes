#!/usr/bin/env roseus

(load "package://pr2eus/pr2-interface.l")
(pr2-init)

(ros::roseus-add-msgs "geometry_msgs")
(ros::roseus "pr2-end-coords")
;; (ros::advertise "/pr2_end_coords/right" geometry_msgs::PoseStamped 1)
(ros::advertise "/pr2_end_pose/right" geometry_msgs::Pose 1)
(ros::rate 100)
(while (ros::ok)
  (send *pr2* :angle-vector (send *ri* :state :potentio-vector))
  (setq msg (instance geometry_msgs::PoseStamped :init))
  (send msg :pose :position (send (send *pr2* :rarm :end-coords) :worldpos))
  (ros::publish "/pr2_end_pose/right" msg)
  (ros::sleep)
  )
