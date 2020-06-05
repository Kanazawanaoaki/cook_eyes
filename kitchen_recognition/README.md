# kitchen recognition
I will implement recognitions necessary  for kitchen work.  

## Table Top
We can use tabletop recognition for kitchentop　object recognition on in 3D Vision.  

### how to run sample

```
roscore
```
```
cd ~/Desktop/codes/in_jsk/my_dataset/rosbag/record-test/
rosbag play tomato-and-onion-2020-05-20-16-19-40.bag -l
```
```
source ~/ros/jsk_demo_ws/devel/setup.bash
roslaunch kitchen_recognition tabletop_test.launch
```

## PointPoseExtractor
We can use [PointPoseExtractor](https://jsk-docs.readthedocs.io/projects/jsk_recognition/en/latest/jsk_perception/nodes/point_pose_extractor.html) for
template matching using SIFT features

### sample with video
curry roux sample

#### setup
```
cd catkin_ws/src
git clone https://github.com/ros-drivers/video_stream_opencv.git
catkin build video_stream_opencv
```

#### run sample
PointPoseExtractor launch for curry roux
```
roslaunch kitchen_recognition roux_point_pose_extractor.launch
```
video launch
```
roslaunch kitchen_recognition roux_video.launch
```

play rosbag for camera info
```
cd ~/Desktop/rosbags/
rosbag play compressed_long_test.bag -l
```

### sample with rosbag
PointPoseExtractor launch
```
roslaunch kitchen_recognition point_pose_extractor.launch
```
decompress launch
```
roslaunch kitchen_recognition depth2ptcloud.launch
```
play rosbag
```
rosbag play switch.bag -l
```
