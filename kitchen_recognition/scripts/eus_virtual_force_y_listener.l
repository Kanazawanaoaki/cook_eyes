#!/usr/bin/env roseus
(ros::roseus-add-msgs "geometry_msgs")

(ros::roseus "wrench_listener" :anonymous t)

;; callback
(defun callback (msg)
  (setq *msg* msg)
  (let ((y nil))
    (setq y (send msg :wrench :force :y))
    (if (< y -15)
	(format t "OK!! ~A ~%" y)
      (format t "~A ~%" y))
    ))

(ros::subscribe "/right_endeffector/wrench" geometry_msgs::WrenchStamped #'callback)
(ros::spin)
