import processing.serial.*;
Serial serial;// establecemos una variable llamada serial de Tipo Serial
int x=10;//tiempo inicial 
int tiempo=200;//tiempo de muestreo
int dx=0;//incremento de posición de x
int valor;//valor actual
int valorA;//valor antiguo


void setup() {
  size (600, 600);
  background(200);
  dx=(width*tiempo)/10000;//el ancho total son 10000 ms, calcula el ancho en función del tiempo de muestreo
  println(dx);
  println(Serial.list());//muestra todas las conexiones serie
  serial= new Serial (this, Serial.list()[32], 9600); 
  /* declaramos la variable serial con varias características: con Serial.list ()[32] cogemos el 33 elemento de conexión serie, en nuestro caso arduino, y establecemos una conexión a 9600 baudios*/
  stroke(0);
  textSize(32);
  fill (0);
}

void draw() {
  valorA=valor;
  if (serial.available()>0) {// si llega algún dato
    //println ("h");
    valor=serial.read(); //lo leemos y lo asignamos a la variable valor
  } else {
    //delay (tiempo);//aplica el tiempo de muestreo
  }
  delay (tiempo);//aplica el tiempo de muestreo
  println (valor);
  noStroke();
  fill (200);
  rect(width-300, 0, width-200, 200);//borra el rectángulo del texto
  fill (0);
  text ("Luz:"+valor, width-150, 100);
  pintaTrama (width, height, 10);//llama a función para pintar la trama
  stroke (0, 255, 0);//color de linea verde
  strokeWeight(2);
  line(x-dx, height-valorA, x, height-valor);//pinta la línea entre el valor antiguo y el actual 
  stroke (255, 0, 0);//color de punto rojo
  strokeWeight(5);
  point (x, height-valor);//pinta le punto del valor actual
  x=x+int(dx);//icrementa el valor de x lo que corresponde al tiempo de muestreo

  if (x>=width) {
    x=10;
    background(200);
    //text ("Luz:", width-150, 100);
  }
}

void pintaTrama(int ancho, int alto, int divisiones) {//función para pintar la trama
  strokeWeight (0);
  stroke (255);
  for (int x=0; x<=ancho; x=x+(ancho/divisiones)) {
    line (x, 0, x, alto);
  }

  for (int y=0; y<=alto; y=y+(alto/divisiones)) {
    line (0, y, ancho, y);
  }
}
