
PImage img;
int k=4;

void setup() {
  size(551, 411);
  img= loadImage("data/MonaLisa.jpg");
  image(img, 0, 0);
  loadPixels();
  img.filter(GRAY);
  
}




void draw() {

  for (int y=0; y<img.height-1; y++) {
    for (int x=1; x<img.width-1; x++) {
      color oldPixel= img.pixels[index(x, y)];

      color newPixel= findClosest(oldPixel);

      img.pixels[index(x, y)]=newPixel;

      float errR = red(oldPixel)   - red(newPixel); 
      float errG = green(oldPixel) - green(newPixel); 
      float errB = blue(oldPixel)  - blue(newPixel);

      float r= red(img.pixels[index(x+1, y)]) + errR *7/16;
      float g= green(img.pixels[index(x+1, y)]) + errG *7/16;
      float b= blue(img.pixels[index(x+1, y)]) + errB *7/16;

      img.pixels[index(x+1, y)]=color(r, g, b);

  print(x-1);
      r= red(img.pixels[index(x-1, y+1)]) + errR * 3/16;
      g= green(img.pixels[index(x-1, y+1)]) + errG *3/16;
      b= blue(img.pixels[index(x-1, y+1)]) + errB *3/16;

      img.pixels[index(x-1, y+1)]=color(r, g, b);

      r= red(img.pixels[index(x, y+1)]) + errR *5/16;
      g= green(img.pixels[index(x, y+1)]) + errG *5/16;
      b= blue(img.pixels[index(x, y+1)]) + errB *5/16;

      img.pixels[index(x, y+1)]=color(r, g, b);

      r= red(img.pixels[index(x+1, y+1)]) + errR *1/16;
      g= green(img.pixels[index(x+1, y+1)]) + errG *1/16;
      b= blue(img.pixels[index(x+1, y+1)]) + errB *1/16;

      img.pixels[index(x+1, y+1)]=color(r, g, b);
    }
  }
  img.updatePixels();
  image(img, 275, 0);
  noLoop();
}



int index(int x, int y) {
  return x + y * img.width;
}


color findClosest(color old) {

  float oldR= red(old);
  float oldG= green(old);
  float oldB= blue(old);

  float newR = round(k*oldR/255)*(255/k);
  float newG = round(k*oldG/255)*(255/k);
  float newB = round(k*oldB/255)*(255/k);

  return color(newR, newG, newB);
}