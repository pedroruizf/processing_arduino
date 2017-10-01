import processing.serial.*;

Serial puerto;
int luz1=0;
int luz2=0;
int tiempo1=0;
int tiempo2=0;
int luzrepresentada1=0;
int luzrepresentada2=0;
int tiemporepresentado1=0;
int tiemporepresentado2=0;
int ciclo=0;
int punto=1;

void setup() {
  puerto=new Serial (this, Serial.list()[0], 9600);
  size (600, 500);
  background (0);
  stroke (255);
  strokeWeight(2);
}


void draw() {
  //background (64);  
  if (puerto.available()>0 && punto==1) {

    luz1=puerto.read();
    int tiempo1=millis()/1000;
    luzrepresentada1=int( map (luz1, 197, 109, height, 0));
    tiemporepresentado1=tiempo1-(width*ciclo);
    if (luzrepresentada1<0) {
      luzrepresentada1=0;
    }
    if (luzrepresentada1>height) {
      luzrepresentada1=height;
    }
    if (tiemporepresentado1>width) {
      tiemporepresentado1=0; 
      ciclo++;
    }
    punto++;
  }

  if (puerto.available()>0 && punto==2) {

    luz2=puerto.read();
    int tiempo2=millis()/1000;
    luzrepresentada2=int( map (luz2, 197, 109, height, 0));
    tiemporepresentado2=tiempo2-(width*ciclo);
    if (luzrepresentada2<0) {
      luzrepresentada2=0;
    }
    if (luzrepresentada2>height) {
      luzrepresentada2=height;
    }
    if (tiemporepresentado2>width) {
      tiemporepresentado2=0; 
      ciclo++;
    }
    punto--;
  }

  line (tiemporepresentado1, luzrepresentada1, tiemporepresentado2, luzrepresentada2);

  println ("tiempo (s):"+ millis()/1000);
  println ("luz:"+ luzrepresentada1);
  //println (Serial.list());
}