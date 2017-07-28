#include <Servo.h>


Servo miservo;// crea un objeto tipo servo para controlar el servo
int pos = 0; // variable para almacenar la posición del servo

void setup() {
  miservo.attach(7);// En EduBasica el servo se conecta al pin 7
  Serial.begin(9600);
  miservo.write(0); //llevamos al servomotor a 0 grados
}

void loop()
{

  if (Serial.available() > 0) {//si recibimos datos de processing
    int dato = Serial.read(); //asignamos a dato lo leido por el puerto serie
    miservo.write (dato);//envia al servomotor los grados estipulados en processing
    delay (50);
  }

}

