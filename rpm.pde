class RPM{
  
  float x, y, s, r, val, min, max;
  
  
  public RPM(float x, float y, float s, float min, float max){
    
    this.x = x;
    this.y = y;
    this.s = s;
    r = s / 2;
    this.min = min;
    this.max = max;
  }
  
  
  
  
  
  
  
  void show(){
    
 
    //measurments
    stroke(94, 173, 157);
    fill(94, 173, 157);

    int j = 0;
    for(float ang = 0; ang <= 4.5; ang += 0.45){
      
      line(x + r + r * 0.9 * -cos(ang - 0.7), y + r + r * 0.9 * -sin(ang- 0.7), x + r + r * -cos(ang - 0.7), y + r + r * -sin(ang- 0.7));
      
      int curVal = int ((max - min) / 10) * j;
      
      textSize(10);
      
      if(j <= 5)
        text(curVal, x + r + r * 1.3 * -cos(ang - 0.7), y + r + r * 1.1 * -sin(ang- 0.7));
      
      else
        text(curVal, x + r + r * 1.05 * -cos(ang - 0.7), y + r + r * 1.05 * -sin(ang- 0.7));
      
      j++;
    }
      
    
    //value
    
    textSize(20);
    fill(255, 69, 13);
    
    String rp = Integer.toString(int(val));
    
    text(int(val), x + r - textWidth(rp) / 2, y + r * 0.75);

    
    
   
    
    //arrow cover
    strokeWeight(1);
    stroke(140);
    fill(140);
    ellipse(x + r, y + r, 5, 5);
    
    //pointer arrow
    line(x + r, y + r, x + r + r * -cos(map(val, min, max, 0, 4.5) - 0.7), y + r + r * -sin(map(val, min, max, 0, 4.5)- 0.7));
       
    //ouline
    noFill();
    ellipse(x + r, y + r, s, s);
  }
  
  void updateVal(float v){
    
    val = v;
    
  }
  
  
  
  
}
