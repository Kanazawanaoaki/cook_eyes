#!/usr/bin/env roseus
(ros::roseus-add-msgs "geometry_msgs")

(ros::roseus "wrench_listener" :anonymous t)

;; callback
(defun callback (msg)
  (setq *msg* msg)
  (let ((z nil))
    (setq z (send msg :wrench :force :z))
    (if (< z -1)
	(format t "OK!! ~A ~%" z)
      (format t "~A ~%" z))
    ))

(ros::subscribe "/right_endeffector/wrench" geometry_msgs::WrenchStamped #'callback)
(ros::spin)
