class Serie {
  float x, y, t, ang, dist;
  int cant;
  float ampAmortiguado;
  color[] paleta;
  color[] paleta_;
  boolean haySonido;
  color a, b, c, d, a_b, c_d;
  Serie() {
    cant = 20;
    ang = radians(0);
    dist = 0;
    x = dist *cos(ang);
    y = dist *sin(ang);
    t = width/cant;
    haySonido = false;
    paleta = new color[] {color(#F8FCDA), color(#E3E9C2), color(#F9FBB2), color(#7C6354),color(#A5ABAF)};
    paleta_ = new color[] {color(#320A28), color(#511730), color(#8E443D), color(#CB9173),color(#E0D68A)};
    a = color( paleta[ int( random(5) ) ] );
    b = color( paleta_[ int( random(5) ) ] );
    c = color( paleta_[ int( random(5) ) ] );
    d = color( paleta[ int( random(5) ) ] );
  }

  void dibujar() {
    if (amp >= 50) {
      haySonido = true;
    }
    if (haySonido) {
      for (int i = 0; i < cant; i++) {
        for (int j = 0; j < cant; j++) {

          /*float p = constrain(map(amp, 20, 90, 0.0, (float)paleta.length-1.0) * (pow(abs(i-j)*2-1, 2.0)), 0, paleta.length-1.0001);
           
           float p1 = constrain(map(pitch, umbral, 90, 0.0, (float)paleta.length-1.0), 0, paleta.length-1.0001);
           
           color a_b = lerpColor(paleta[(int) p], paleta[(int) p+1], p-(int) p);
           
           color b_a = lerpColor(paleta[(int) p1], paleta[(int) p1+1], p1-(int) p1);*/

          float p = map(amp, umbralAmp, 90, 0, 2.5);
          float p1 = map(pitch, umbralAmp, 90, 0, 1);
          ampAmortiguado = map(amp, umbralAmp, 90, 0.1,0.9);
          if(p1 > 0 && p1 <0.7) {
          a_b = lerpColor(a,b, map(i+j, 0, cant, 0, p)*ampAmortiguado);
          c_d = lerpColor(c,d, map(j+i, 0, cant, p,0));
          }
          if(p1 > 0.7 && p1 <1.5) {
          a_b = lerpColor(a,b, map(i*j, 0, cant, 0, p1)*ampAmortiguado);
          c_d = lerpColor(c,d, map(j*i, 0, cant, p1,0));
          }
          // println("AMP P: " + p);
           println("PITCH P1: " +p1);

          // cuadrante inferior der
          fill(a_b);
          ellipse(x+(i*t)-t/2, y+(j*t)-t/2, t, t);
          fill(c_d);
          rect(x+(i*t)-t/2, y+(j*t)-t/2, t, t);

          // cuadrante inferior izq
          fill(a_b);
          ellipse(x-(i*t)-t/2, y+(j*t)-t/2, t, t);
          fill(c_d);
          rect((x-t)-(i*t)-t/2, y+(j*t)-t/2, t, t);

          // cuadrante superior der
          fill(a_b);
          ellipse(x+(i*t)-t/2, y-(j*t)-t/2, t, t);
          fill(c_d);
          rect(x+(i*t)-t/2, (y-t)-(j*t)-t/2, t, t);

          // cuadrante superior izq
          fill(a_b);
          ellipse(x-(i*t)-t/2, y-(j*t)-t/2, t, t);
          fill(c_d);
          rect((x-t)-(i*t)-t/2, (y-t)-(j*t)-t/2, t, t);
        }
      }
    }
  }
}
