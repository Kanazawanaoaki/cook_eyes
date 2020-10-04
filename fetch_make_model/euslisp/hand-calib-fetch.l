(load "package://fetcheus/fetch-interface.l")
(fetch-init)

(send *fetch* :reset-pose)

(load "models/arrow-object.l")
(setq *arrow* (arrow))
(send *arrow* :newcoords (make-coords :pos #f(600 0 800)))
(send *arrow* :rotate (deg2rad -90) :z)
(objects (list *fetch*))

(send *fetch* :inverse-kinematics *arrow*)
(send *ri* :angle-vector (send *fetch* :angle-vector))
(send *ri* :wait-interpolation)

(send *fetch* :head :look-at (send *arrow* :worldpos))
(send *ri* :angle-vector (send *fetch* :angle-vector))
