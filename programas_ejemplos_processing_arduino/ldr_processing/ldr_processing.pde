import processing.serial.*;

Serial puerto;
int luz=0;
float luzrepresentada;
float tiempo;
float tiemporepresentado=0;
int ciclo=0;//indica el nº de veces que recorre el gráfico el ancho

void setup() {
  background (64);
  puerto=new Serial (this, Serial.list()[0], 9600);
  size (600, 500);
}


void draw() {

  float tiempo=millis()/1000;
  if (puerto.available()>0) {
    luz=puerto.read();
  }
  luzrepresentada= map (luz, 197, 109, height, 0);//escala la variable recibida de arduino
  tiemporepresentado=tiempo-(width*ciclo);
  if (luzrepresentada<0) {
    luzrepresentada=0;
  }
  if (luzrepresentada>height) {
    luzrepresentada=height;
  }
  if (tiemporepresentado>width) {
    tiemporepresentado=0; 
    background(64);
    ciclo++;
  }
  stroke (255, 0, 0);
  strokeWeight(2);
  point (tiemporepresentado, luzrepresentada);//representa los puntos
  fill (64);
  noStroke();
  rect (450, 300, 550, 450);
  fill (255);
  text (tiempo, 500, 400);
  text (luzrepresentada, 500, 350);
}