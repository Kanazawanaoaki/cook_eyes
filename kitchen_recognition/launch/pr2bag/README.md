# pr2bag
PR2のrosbag  

## rosbag
rosbagを撮る．  
```
roslaunch kitchen_recognition rosbag_record_test.launch rosbag:=/home/kanazawa/Desktop/rosbags/PR2/20200706_kanazawa_kitchen/202007061723_kitchen_01
```
rosbagを再生する．  
```
roslaunch kitchen_recognition rosbag_play.launch rosbag:=/home/kanazawa/Desktop/rosbags/PR2/20200910_kanazawa_kitchen/20200910_kitchen_01.bag gui:=true
```

## data collection server
```
source ~/ros/jsk_demo_ws/devel/setup.bash
roslaunch kitchen_recognition pr2_data_collection_server_test.launch
```
`/kinect_head/rgb/image_rect_color`をpngに保存する．
```
rosservice call /after_stow_data_collection/save_request "{}"
```
