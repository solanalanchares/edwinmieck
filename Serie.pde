class Serie {
  float x, y, t, ang, dist;
  int cant;
  float ampAmortiguado;
  color[] paleta;
  Serie() {
    cant = 20;
    ang = radians(0);
    dist = 0;
    x = dist *cos(ang);
    y = dist *sin(ang);
    t = width/cant;
    
    paleta = new color[] {color(#9D70C2), color(#B594D1), color(#CEB8E0), color(#E7DBF0)};
  }

  void dibujar() {
    for (int i = 0; i < cant; i++) {
      for (int j = 0; j < cant; j++) {

        /*float p = constrain(map(amp, 20, 90, 0.0, (float)paleta.length-1.0) * (pow(abs(i-j)*2-1, 2.0)), 0, paleta.length-1.0001);
         
         float p1 = constrain(map(pitch, umbral, 90, 0.0, (float)paleta.length-1.0), 0, paleta.length-1.0001);
         
         color a_b = lerpColor(paleta[(int) p], paleta[(int) p+1], p-(int) p);
         
         color b_a = lerpColor(paleta[(int) p1], paleta[(int) p1+1], p1-(int) p1);*/

        float p = map(amp, umbralAmp, 90, 0,1);
        float p1 = map(pitch, umbralAmp, 90, 0, 1);
        ampAmortiguado = map(amp, umbralAmp, 90, 0.1, 0.99);
        //el map de la interpolacion, donde se hace i*j, se puede cambiar por otra operacion ej: i+j,i-j,(i%4), etc. y cambia un poco la forma 
        a_b = lerpColor(paleta[0], paleta[1], map(i*j, 0, cant, 0, p) * ampAmortiguado);
        b_a = lerpColor(paleta[1], paleta[0], map(j*i, 0, cant, 0, p1));

       /* println("AMP P: " + p);
        println("PITCH P1: " +p1);*/

        // cuadrante inferior der
        fill(a_b);
        ellipse(x+(i*t)-t/2, y+(j*t)-t/2, t, t);
        fill(b_a);
        rect(x+(i*t)-t/2, y+(j*t)-t/2, t, t);

        // cuadrante inferior izq
        fill(a_b);
        ellipse(x-(i*t)-t/2, y+(j*t)-t/2, t, t);
        fill(b_a);
        rect((x-t)-(i*t)-t/2, y+(j*t)-t/2, t, t);

        // cuadrante superior der
        fill(a_b);
        ellipse(x+(i*t)-t/2, y-(j*t)-t/2, t, t);
        fill(b_a);
        rect(x+(i*t)-t/2, (y-t)-(j*t)-t/2, t, t);

        // cuadrante superior izq
        fill(a_b);
        ellipse(x-(i*t)-t/2, y-(j*t)-t/2, t, t);
        fill(b_a);
        rect((x-t)-(i*t)-t/2, (y-t)-(j*t)-t/2, t, t);
      }
    }
  }
}
