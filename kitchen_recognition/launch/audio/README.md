# audio関連メモ

ビットdepthを16にするためにbitrateを256に上げておいた方が良さそう．フォーマットをwaveにする必要がある．
```
roslaunch audio_capture capture.launch bitrate:=256 format:=wave
```
で/audio/audioのrostopicをpublishすることができる
```
roslaunch audio_play play.launch format:=wave
```
でトピックを聞く  


rosbagをとるのは  
```
rosbag record /audio/audio /audio/audio_info -o onsa_wave
```

スペクトル，スペクトログラム  
音声の波をフーリエ変換して周波数成分にしたものがスペクトル．さらにその周波数成分が時間とともにどう変化したのかを見るのがスペクトログラム．
```
roslaunch audio_to_spectrogram audio_to_spectrogram.launch launch_audio_capture:=false audio_topic:=/audio/audio mic_sampling_rate:=16000 bitdepth:=16
```