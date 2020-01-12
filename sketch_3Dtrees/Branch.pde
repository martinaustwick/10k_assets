//limb angle
float langle = PI*0.02;
//branch angle
float bangle = PI*0.2;
float scaling = 0.9;
int maxDepth = 15;
float wobbleAngle = 0.00;

class Branch
{
    Branch baby1, baby2;
    PVector p =new PVector(0,0,0);
    float angle = 0;
    float axial = 0;
    float scaler = 1;
    int lengthy = width/9;
    int depth;
    float cangle, phase;
    
    
    Branch(int depth)
    {     
        phase = random(PI);
        this.depth = depth;
        
        if(depth<maxDepth)
        {
            baby1 = new Branch(depth+1);
            PVector d = new PVector(sin(angle)*cos(axial), -cos(angle)*cos(axial), sin(axial));
            d.mult(baby1.scaler*lengthy);
            baby1.p = d.get();
            baby1.angle = random(-langle, langle);
            baby1.axial = random(TWO_PI);
            
            if(random(1)<(depth*0.15))
            {
              baby2 = new Branch(depth+1);
              PVector d2 = new PVector(sin(angle)*cos(axial), -cos(angle)*cos(axial), sin(axial));
              d2.mult(baby2.scaler*random(0.8*lengthy,0.5*lengthy));          
              baby2.p = d2.get();
              baby2.angle = random(-bangle, bangle);
              baby2.axial = random(TWO_PI);
            }

        }
    }
      
    
    void display()
    {
        cangle = angle + (wobbleAngle*sin((TWO_PI*time/moviePeriod) + phase));
        pushMatrix();
          translate(p.x, p.y);
          scale(scaling);
          rotate(cangle);
          line(0, 0, 0, -lengthy);  
          
          if(baby1!=null){
            stroke(0);
            noFill();
            baby1.display();
          }
          if(baby2!=null){
            stroke(0);
            noFill();
            baby2.display();
          }
          
        popMatrix();
    }
    
}