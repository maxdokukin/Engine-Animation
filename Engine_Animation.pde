Piston p1, p2, p3, p4;
RPM rpm, fuel;

Piston pistons[];

int pistonNum = 16;
float speed = 0.01;

void setup(){
  
  size(850, 550);
  
  frameRate(60);
  
  pixelDensity(2);
  
  pistons = new Piston[pistonNum];
  //Cadillac V16 engine
  //'35-'37 1-8-9-14-3-6-11-2-15-10-7-4-13-12-5-16
  pistons[0] = new Piston(50, 50, 50, 100, 2);
  pistons[1] = new Piston(150, 50, 50, 100, 0.25);
  pistons[2] = new Piston(250, 50, 50, 100, 1);
  pistons[3] = new Piston(350, 50, 50, 100, 3.25);
  pistons[4] = new Piston(450, 50, 50, 100, 2.5);
  pistons[5] = new Piston(550, 50, 50, 100, 0.75);
  pistons[6] = new Piston(650, 50, 50, 100, 3.5);
  pistons[7] = new Piston(750, 50, 50, 100, 1.75);
  pistons[8] = new Piston(50, 200, 50, 100, 1.5);
  pistons[9] = new Piston(150, 200, 50, 100, 3.75);
  pistons[10] = new Piston(250, 200, 50, 100, 0.5);
  pistons[11] = new Piston(350, 200, 50, 100, 2.75);
  pistons[12] = new Piston(450, 200, 50, 100, 3);
  pistons[13] = new Piston(550, 200, 50, 100, 1.25);
  pistons[14] = new Piston(650, 200, 50, 100, 0);
  pistons[15] = new Piston(750, 200, 50, 100, 2.25);
  
  //Caterpillar 3516
  //1-2-5-6-3-4-9-10-15-16-11-12-13-14-7-8  
  //pistons[0] = new Piston(50, 50, 50, 100, 2);
  //pistons[1] = new Piston(150, 50, 50, 100, 1.75);
  //pistons[2] = new Piston(250, 50, 50, 100, 1);
  //pistons[3] = new Piston(350, 50, 50, 100, 0.75);
  //pistons[4] = new Piston(450, 50, 50, 100, 1.5);
  //pistons[5] = new Piston(550, 50, 50, 100, 1.25);
  //pistons[6] = new Piston(650, 50, 50, 100, 2.5);
  //pistons[7] = new Piston(750, 50, 50, 100, 2.25);
  //pistons[8] = new Piston(50, 200, 50, 100, 0.5);
  //pistons[9] = new Piston(150, 200, 50, 100, 0.25);
  //pistons[10] = new Piston(250, 200, 50, 100, 3.5);
  //pistons[11] = new Piston(350, 200, 50, 100, 3.25);
  //pistons[12] = new Piston(450, 200, 50, 100, 3);
  //pistons[13] = new Piston(550, 200, 50, 100, 2.75);
  //pistons[14] = new Piston(650, 200, 50, 100, 0);
  //pistons[15] = new Piston(750, 200, 50, 100, 3.75);

  //p1 = new Piston(100, 100, 50, 100, 0);
  //p2 = new Piston(200, 100, 50, 100, 1);
  //p3 = new Piston(300, 100, 50, 100, 2);
  //p4 = new Piston(400, 100, 50, 100, 3);
  
  rpm = new RPM(width / 2 - 100, height - 201, 200, 0, 5000);
  fuel = new RPM(20, height - 101, 100, 0, 2000);
  
  
  
  
}







void draw(){
  
  background(28, 39, 56);
  
  for(int i = 0; i < pistonNum; i++){
    
    pistons[i].show();
    pistons[i].updateTakt(speed);
  }
  
  
  rpm.show();
  rpm.updateVal(speed * 1800);


  fuel.show();
  fuel.updateVal(speed * pistonNum *28.125);
}


void mouseMoved(){
  
  speed = map(mouseX, 0, width, 0.005, 2.7815);
  
}
