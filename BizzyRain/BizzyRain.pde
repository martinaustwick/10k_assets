/*
  Written by Martin Austwick, 2013
*/

//import processing.video.*;

//MovieMaker mm;
boolean movie = false;

ArrayList<Raindrop> drops;

PVector speed;
//use cursor keys to change background transparency
int bgAlpha = 1;

void setup()
{
    
    size(1280, 720);
    smooth();
    //strokeWeight(10);
    speed = new PVector(0, 5);
    drops = new ArrayList<Raindrop>();
    for(int i = 0; i<2; i++)
    { 
      drops.add(new Raindrop());
    }
    

  //mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
  background(255);
}

void draw()
{
    scale(1);
    fill(255, 255, 255, bgAlpha);
    noStroke();
    rect(0,0,width, height);
    
    repel(drops);
    for(int i = 0; i<drops.size(); i++)
    {
        Raindrop r = drops.get(i);
        if(r!=null)
        {
          r.move();
          r.display();
          if(r.p.y>height || random(1)<0.001) 
          {
            drops.remove(i);
            drops.add(i, new Raindrop());
          }
        }
        
        if(random(1)<0.01) 
        {
          Raindrop newR = new Raindrop();
          newR.p = r.p.get();
          drops.add(newR);
          
        }
    }
    
   
    //if(drops.size()<20 && random(1)<0.01) drops.add(new Raindrop());
    
    //if(movie) mm.addFrame();
}

void repel(ArrayList<Raindrop> drops)
{
    for(Raindrop d1: drops)
    {
        for(Raindrop d2: drops)
        {
            if(d1!=d2)
            {
                PVector diff = PVector.sub(d2.p,d1.p);
                d1.v.add(PVector.mult(diff,-1/diff.mag()));
            }
        }
       d1.v.add(new PVector(0,3*drops.size()));
       d1.v.normalize();
       //d1.v.mult(10);
    }
}

class Raindrop
{  
    float len = 50;
    PVector p,v;
    float x1, x2;
    float sc = 1;
    
    Raindrop()
    {
        p = new PVector((width/2) + random(-10,10), -len+100);
        x1 = random(-0.2, 0.2);
        x2  =random(-0.2, 0.2);
        //sc = pow(random(0.5, 1), 3);
        //sc = random(0.1, 1);
        v = speed.get();
    }
    
    
    void move()
    {
        //v = speed.get();
       // v.mult(sqrt(sc));
        p.add(v);
    }
    
    void display()
    {
        //noStroke();
        //fill(0,0,0,150);
        stroke(0);
        x1+=random(-0.01, 0.01);
        x2+=random(-0.01, 0.01);
        pushMatrix();
        translate(p.x, p.y);
          point(0,0);
          //rotate(atan2(speed.y, speed.x));
          //rotate(-PI/2);
          //scale(sc);
          //beginShape();
          //  vertex(0,0);
          //  bezierVertex(len*(0.8+x1), len, -len*(0.8+x2), len, 0, 0);
          //endShape(CLOSE);
        popMatrix();
    }
}