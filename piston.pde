//import processing.sound.*;

//SoundFile   file = new SoundFile(this, "//Users/xewe//Documents//Programming//Processing//engineSim//data//valve.wav"); 

class Piston {

  float takt = 0;
  float x, y, w, h;
 
  public Piston (float x, float y, float w, float h, float takt) {

    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h - 20;
    this.takt = takt;
    
  }


  public void show() {


    float pPos;

    if ((takt > 1 && takt < 2) || (takt > 3 && takt < 4))
      pPos = y + (float) (h - (takt % 1) * h) + 5;

    else
      pPos = y + (float) ((takt % 1) * h) + 5;


    //head
    strokeWeight(1);
    stroke(100);
    fill(100);
    rect(x + 2, pPos, w - 4, 15);


    //rings
    stroke(138, 114, 50);
    strokeWeight(2);
    line(x, pPos + 4, x + w, pPos + 4);
    line(x, pPos + 8, x + w, pPos + 8);
    line(x, pPos + 12, x + w, pPos + 12);


    //shafts
    strokeWeight(1);
    stroke(100);
    fill(100);    
    rect(x + w / 2 - 6, pPos + 15, 12, (y + h) - pPos + 5);


    //kotel
    strokeWeight(2);
    stroke(140);
    noFill();
    rect(x, y, w, h + 20);



    //infuel
    noStroke();
    if (takt < 1)//mix intake
      fill(betCol(240, 254, 255, 94, 244, 255, takt % 1));

    else if (takt >= 1 && takt < 2)
      fill(betCol(94, 244, 255, 177, 255, 94, takt % 1));

    else if (takt >= 2 && takt < 3)
      fill(betCol(255, 71, 10, 150, 142, 96, takt % 1));

    else if (takt >= 3 && takt <= 4)
      fill(betCol(150, 142, 96, 128, 127, 122, takt % 1));

    rect(x + 1, y + 1, w - 1, pPos - y);   


    //spark
    strokeWeight(1);
    noStroke();
    fill(255);    
    rect(x + w / 2 - 3, y - 15, 6, 15);
    fill(200);
    rect(x + w / 2 - 2, y - 20, 4, 5);
    rect(x + w / 2 - 2, y, 4, 4);

    stroke(50);
    line(x + w / 2 - 3, y - 12, x + w / 2 + 3, y - 12); 
    line(x + w / 2 - 3, y - 9, x + w / 2 + 3, y - 9); 
    line(x + w / 2 - 3, y - 6, x + w / 2 + 3, y - 6); 

    if (takt >= 1.95 && takt <= 2.05) {

      fill(31, 233, 240);
      rect(x + w / 2 - 2, y, 4, 4);
    }
    
    
    //exhaust valve
    
    strokeWeight(2);
    stroke(0);
    
    float valvePos = 0;
    
    
    if(takt >= 3 && takt < 3.1){
      
      valvePos = (takt % 1) * 20;
      //file.play();
    }
    
    else if(takt >= 3.1 && takt < 3.9)
      valvePos = 2;
      
    else if(takt >= 3.9)
      valvePos = 2 - (takt - 3.9) * 20;

    line(x + w - 12, y + 2 + valvePos, x + w - 2, y + 2 + valvePos);
    
    
    
    
    //input valve
    
    valvePos = 0;
    
    if(takt < 0.1)
      valvePos = takt * 20;
    
    else if(takt >= 0.1 && takt < 0.9)
      valvePos = 2;
      
    else if(takt >= 0.9 && takt < 1)
      valvePos = 2 - (takt - 0.9) * 20;

    line(x + 2, y + 2 + valvePos, x + 12, y + 2 + valvePos);
  }

  void updateTakt(double val) {

    takt += val;

    if (takt >= 4)
      takt -= 4;
  }





  color betCol(int r1, int g1, int b1, int r2, int g2, int b2, float prog) {

    color c3 = color(r1 * (1 - prog) + r2 * prog, g1 * (1 - prog) + g2 * prog, b1 * (1 - prog) + b2 * prog);
    return c3;
  }
}
