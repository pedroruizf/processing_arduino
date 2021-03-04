void setup() {
  Serial.begin (9600);
  pinMode (13, OUTPUT);

}

void loop() {
  if (Serial.available() > 0) {//comprueba si llegan datos por el puerto serie
    int dato = Serial.read();//si llega lo guarda en la variable dato

    if (dato == 0) {//si dato vale 0 apaga el led
      digitalWrite (13, LOW);

    }

    if (dato == 1) {//si dato vale 1 enciende el led

      digitalWrite (13, HIGH);
    }
  }

}
