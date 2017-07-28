void setup() {
  Serial.begin (9600);
}

void loop() {
  int luz = analogRead (A1);
  Serial.write (luz);
  delay (100);
}
