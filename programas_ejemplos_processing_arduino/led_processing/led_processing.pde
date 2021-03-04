import processing.serial.*;

int led=0;
Serial serial;

void setup() {
  serial=new Serial (this, Serial.list()[32], 9600); //define el objeto serial como puerto serie
  size (500, 400); 
  //dibuja los botones
  fill (255, 0, 0);
  ellipse (150, height/2, 100, 100);
  fill (0, 255, 0);
  ellipse (350, height/2, 100, 100);
}

void draw () {
}

void mousePressed() {//si se presiona el ratón

  if (mouseX>=100 && mouseX<=200 && mouseY>=150 && mouseY<=250) {//comprueba que está en el botón rojo
    led=0; 
    serial.write (led);//la variable led la pone a 0 y la envía
  }

  if (mouseX>=300 && mouseX<=400 && mouseY>=150 && mouseY<=250) {//comprueba que está en el botón verde
    led=1; 
    serial.write (led);//la variable led la pone a 1 y la envía
  }
}
