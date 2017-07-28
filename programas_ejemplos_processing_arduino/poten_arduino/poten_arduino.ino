
void setup() {
  Serial.begin (9600);//establece comunicación serie a 9600 baudios
}

void loop() {
  int poten = analogRead (A0) / 4;//crea la variable poten leyendo el valor del potenciómetro de edubasica y lo convierte a valor de 0 a 255
  Serial.write (poten);// escribe por el puerto serie el valor de poten
  delay (50); 
}
