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
roslaunch kitchen_recognition tabletop_test.launch
```
