int adval = 0; //ADC データ用変数
float sensor_r; // センサ抵抗値用変数

void setup() {
 Serial.begin(115200);
 pinMode(A0, OUTPUT); //PULSE ピンを出力に設定
}

void loop() {
 digitalWrite(A0, HIGH); //PULSE ピン HIGH
 delay(1); //OUT が安定するまでの待ち
 adval = analogRead(A1); //ADC 取り込み
 delay(1); // 時間調整
 digitalWrite(A0, LOW); //PULSE ピンを HIGH
 if (adval != 0) {
  //((3.0 / (adval * 5.0 / 1024.0)) - 1)*10k ohm
  sensor_r = 6144.0 / adval - 10;
  Serial.println(sensor_r, 1);
 }
 else Serial.println("div 0 ");
 delay(998); // 時間調整
}
