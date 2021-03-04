void setup() {
  Serial.begin (9600);
}

void loop() {
  int luz = analogRead (A1) / 4;
  //Serial.println(luz);
  Serial.write (luz);
  delay (1000);
}
