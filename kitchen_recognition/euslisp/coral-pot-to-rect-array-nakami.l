#!/usr/bin/env roseus


(defclass class-rects-synchronizer
  :super exact-time-message-filter)

(defmethod class-rects-synchronizer
  (:callback (class rects)
             ;; (print (list class rects))
             ;; (print (send-all (list class rects) :header :stamp))
             (class-cb class)
             (rects-cb rects)
             ))

(ros::roseus "coral_pot_to_rect_array_test" :anonymous t)
(ros::load-ros-package "jsk_recognition_msgs")

(setq *target-label-num* 11) ;; 11 pot 
(setq *target-label-name* "pot") ;; 11 pot 
(setq *target-label-index* nil)

(setq *class-msg* "/edgetpu_object_detector/output/class")
(setq *rects-msg* "/edgetpu_object_detector/output/rects")
(setq *pub-msg* "/coral_pot_to_rect_array/output")

(ros::advertise *pub-msg* jsk_recognition_msgs::RectArray 1)


(defun nakami (rect)
  (let ((x (send rect :x))
        (y (send rect :y))
        (width (send rect :width))
        (height (send rect :height)))
    
    (setq x (+ x (/ width 5)))
    (setq height (* (/ height 5) 3))
    (setq width (/ width 2))
    
    (send rect :x x)
    (send rect :y y)
    (send rect :width width)
    (send rect :height height)
    )
  rect
  )



(defun class-cb (msg)
  (when msg
    (setq name-lists (send msg :label_names))
    (print name-lists)
    (dotimes (i (length name-lists)) ;; 現状は複数認識された時のことを考えていない
      (if (equal *target-label-name* (elt name-lists i))
          (progn
            (setq *target-label-index* i)
            (format t "target index is ~A ~%" i)
            )
        )
      )
    ))

(defun rects-cb (msg)
  (when msg
    (setq rect-lists (send msg :rects))
    (when *target-label-index*
      (setq *target-rect* (elt rect-lists *target-label-index*))
      ;; (print *target-rect*)
      (setq pub-msg (instance jsk_recognition_msgs::RectArray :init))
      (send pub-msg :header (send msg :header))
      ;; (send pub-msg :rects (list *target-rect-nakami*))
      (send pub-msg :rects (list (nakami *target-rect*)))
      (ros::ros-info "msg [~A]" (send pub-msg :rects))      
      (ros::publish *pub-msg* pub-msg)
      (ros::sleep)
      )
    ))


;; test
(setq hoge (instance class-rects-synchronizer :init
                     (list (list *class-msg* jsk_recognition_msgs::ClassificationResult)
                           (list *rects-msg* jsk_recognition_msgs::RectArray))))
(ros::spin)

