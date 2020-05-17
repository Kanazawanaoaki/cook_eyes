# foodstuff detector
食材の物体検出を行う


## How to make dataset
labelmeを使ってアノテーションを行う。
```
labelme --labels labels.txt PATH_TO_IMAGE
```
でアノテーションを行うことが出来る。以下のようなアノテーションされたディレクトリを作る
```
annotated_datasets
|-- train  # train dataset
|   |-- TRAIN_IMAGE_01.jpg
|   |-- TRAIN_IMAGE_01.json
|   |-- TRAIN_IMAGE_02.jpg
|   |-- TRAIN_IMAGE_02.json
|   |-- TRAIN_IMAGE_03.jpg
|   |-- TRAIN_IMAGE_03.json
|   `-- ...
`-- test   # test dataset
    |-- TEST_IMAGE_01.jpg
    |-- TEST_IMAGE_01.json
    |-- TEST_IMAGE_02.jpg
    |-- TEST_IMAGE_02.json
    |-- TEST_IMAGE_03.jpg
    |-- TEST_IMAGE_03.json
    `-- ...
```

以下のようにしてVOC形式のデータセットに変換する。
```
wget https://raw.githubusercontent.com/wkentaro/labelme/master/examples/instance_segmentation/labelme2voc.py
python3 ./labelme2voc.py PATH_TO_ANOTATED_DATASET PATH_TO_VOC_DATASET --labels labels.txt
```
以下のようなtrainとtestのデータセットのディレクトリを作る。
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
visualise with tensorboard
```
# after ssh
bash ./run.sh ./DATASET_NAME tensorboard
```
### SSH中に確認できるDLBOXの使用状況
dockerのポートの使用状況、6006が使われてる場合は`--port 6007`などにして./run.shする
```
docker ps
```
GPUの状況、0が使われている場合は`--gpu 1`などにして./run.shする
```
ndvidia-smi
```

## dataset check
https://gist.github.com/Kanazawanaoaki/fd3a876a152e9554e2432d1abe45dab9
```
python3 create_tf_record.py --data_dir=/PATH_TO_VOC_DATASETS --output_dir=/
```
