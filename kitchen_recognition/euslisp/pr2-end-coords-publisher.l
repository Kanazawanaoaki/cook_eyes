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
  (setq msg (instance geometry_msgs::Pose :init))

  (setq *coords* (send *pr2* :rarm :end-coords))
  (setq *pose* (ros::coords->tf-pose *coords*))
  (setq msg *pose*)

  (ros::publish "/pr2_end_pose/right" msg)
  )
