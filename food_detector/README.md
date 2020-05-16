# foodstuff detector
食材の物体検出を行う


## How to make dataset
labelmeを使ってアノテーションを行う。

```
wget https://raw.githubusercontent.com/wkentaro/labelme/master/examples/instance_segmentation/labelme2voc.py
python3 ./labelme2voc.py PATH_TO_ANOTATED_DATASET PATH_TO_VOC_DATASET --labels labels.txt
```
以下のようなtrainとtestのデータセットのフォルダを作る。
```
voc_datasets
|-- train  # train dataset
|   |-- JPEGImages
|   |-- SegmentationClass
|   |-- SegmentationClassPNG
|   |-- SegmentationClassVisualization
|   |-- SegmentationObject
|   |-- SegmentationObjectPNG
|   |-- SegmentationObjectVisualization
|   `-- class_names.txt
`-- test   # test dataset
    |-- JPEGImages
    |-- SegmentationClass
    |-- SegmentationClassPNG
    |-- SegmentationClassVisualization
    |-- SegmentationObject
    |-- SegmentationObjectPNG
    |-- SegmentationObjectVisualization
    `-- class_names.txt
```

## How to Train
```
wget https://gist.githubusercontent.com/k-okada/bb65691bd58a6175b8f5f1c2a3c4caed/raw/0febe43740776051c2d4df6a11feaade9288320c/train_edgetpu_detection.sh
bash ./train_edgetpu_detection.sh ./PATH_TO_VOC_DATASETS
```
