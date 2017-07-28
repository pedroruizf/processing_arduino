import processing.serial.*;

Serial puerto;

void setup() {
  size (500, 400);
  background (255);
  puerto=new Serial (this, Serial.list()[0], 9600);//definimos la variable puerto como tipo Serie, definimos el puerto serie
}


void draw() {
  background (255);
  fill (0);
  stroke (0, 255, 0);
  strokeWeight (10);
  float angulogrados=map (mouseX, 0, width, 0, 180);//escala la posición en X del ratón de 0 a 180
  if (angulogrados>180) {
    angulogrados=180;
  }
  float anguloradianes=radians (angulogrados); //pasa el angulo en grados a radianes
  arc (width/2, height/2, 300, 300, 0, anguloradianes);//dibuja el arco en función del desplzamiento de ratón
  text (angulogrados, 400, 300);//pone un texto con el ángulo en grados
  puerto.write (int(angulogrados));//envía por le puerto serie el ángulo en grados
}