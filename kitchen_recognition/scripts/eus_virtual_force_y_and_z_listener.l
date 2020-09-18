#!/usr/bin/env roseus
;; トピックなどを定義
(defvar *topic-name* "/right_endeffector/wrench")

;; ros init
(ros::roseus "wrench_listener" :anonymous t)
(ros::load-ros-manifest "geometry_msgs")
(setq *cb-flag* nil)


;; callback
(defun wrench-y-cb (msg)
  (when msg
    (let ((y nil))
      (setq y (send msg :wrench :force :y))
      (if (< y -15)
          (progn 
            (setq *cb-flag* t)
            (format t "OK!! y: ~A ~%" y)
            )
        (format t "y: ~A ~%" y))
      )))

(defun wrench-z-cb (msg)
  (when msg
    (let ((z nil))
      (setq z (send msg :wrench :force :z))
      (if (< z -15)
          (progn 
            (setq *cb-flag* t)
            (format t "OK!! z: ~A ~%" z)
            )
        (format t "z: ~A ~%" z))
      )))


(setq *cb-flag* nil)
(ros::subscribe "/right_endeffector/wrench" geometry_msgs::WrenchStamped #'wrench-y-cb)

(until *cb-flag*
       (ros::spin-once)
       (ros::sleep)
       )


(setq *cb-flag* nil)
(ros::subscribe "/right_endeffector/wrench" geometry_msgs::WrenchStamped #'wrench-z-cb)

(until *cb-flag*
       (ros::spin-once)
       (ros::sleep)
       )

(ros::spin)
