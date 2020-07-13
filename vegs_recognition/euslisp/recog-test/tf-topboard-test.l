#!/usr/bin/env roseus

(defun init ()
  (load "../model/my-room73b2-scene.l")
  (setq *room* (room73b2))

  (load "models/room73b2-kitchen-object.l")
  (setq *kitchen* (room73b2-kitchen))
  ;; (send *kitchen* :transform (make-coords :pos (float-vector 305.0 2175.0 0.0) :rot #2f((1.0 2.449294e-16 0.0) (-2.449294e-16 1.0 0.0) (0.0 0.0 1.0))))
  (send *kitchen* :transform (make-coords :pos (float-vector 305.0 2175.0 20.0) :rot #2f((1.0 2.449294e-16 0.0) (-2.449294e-16 1.0 0.0) (0.0 0.0 1.0))))

  (load "package://pr2eus/pr2-interface.l")
  ;; (pr2-init)
  (pr2)


  ;; set まな板
  (load "../model/cutting-board.l")
  (setq *cutting-board* (cutting-board))
  (send *cutting-board* :transform (make-coords :pos (float-vector 480.0 1950.0 820.0) :rot #2f((1.0 2.449294e-16 0.0) (-2.449294e-16 1.0 0.0) (0.0 0.0 1.0))))

  ;; set objects
  (load "../model/peeler.l")
  (load "../model/my-knife.l")
  (load "models/arrow-object.l")
  (setq *arrow* (arrow))

  ;; set spots
  (setq *cook-spot* (send *room73b2* :spot "cook-spot"))
  (setq *sink-spot* (make-coords :pos #f(1055 2600 0) :rpy #f(3.14 0 0))) 
  (setq *kitchen-spot* (send *room73b2* :spot "kitchen-spot"))


  ;; キッチンの場所まで移動 (初期値)
  (defun move-to-kitchen-irt ()
    (send *pr2* :move-to *kitchen-spot* :world)
    )
  (move-to-kitchen-irt)
  (send *pr2* :reset-manip-pose)
  (send *pr2* :torso_lift_joint :joint-angle 325)
  ;; (send *ri* :angle-vector (send *pr2* :angle-vector) 4000)

  (objects (list *pr2* *cutting-board* *kitchen*))

  ;; def global values
  (setq s-time 4)

  ;; set potato
  (load "../model/potato-test-model.l")

  (setq width 90)
  (setq length 60)
  (setq height 60)
  )

(init)

;; WIP!!!!!!!!!!!!!!!!!!!!!!!!!!!


;; トピックなどを定義

;; ros init
(ros::roseus "tf-topboard-test" :anonymous t)

(setq *b* (instance ros::transform-broadcaster :init))

;; (setq obj-coord (make-coords :pos (float-vector 620 50 820)))
;; (setq obj-coord (make-coords :pos (float-vector 620 50 830)))
(setq obj-coord (make-coords :pos (float-vector 620 50 840)))
;; (setq obj-coord (make-coords :pos (float-vector 620 50 850)))
;; (setq obj-coord (make-coords :pos (float-vector 647 10 899)))


(load "models/arrow-object.l")
(setq *arrow* (arrow))
(send *arrow* :newcoords (send (send *pr2* :copy-worldcoords) :transform (send obj-coord :copy-worldcoords)))

(objects (list *arrow* *pr2* *kitchen* *cutting-board*))


(setq found-obj nil)
(do-until-key ;;
;; (until found-obj
  (print 4)

  ;;Rvizに表示をする。
  (setq tm (ros::time-now))
  (send *b* :send-transform obj-coord "base_footprint" "kettle" tm)
  ;; (send *b* :send-transform obj-coord "base_link" "kettle" tm)
  
  (x::window-main-one) ;; IRT viewerの視点を変えられる。見にくければ変えよう
  )


;; ikを解く


