/*
  Written by Martin Austwick, 2013
*/

import processing.video.*;

MovieMaker mm;
boolean movie = false;

ArrayList<Raindrop> drops;

PVector speed;
//use cursor keys to change background transparency
int bgAlpha = 200;

void setup()
{
    
    size(1280, 720);
    smooth();
    drops = new ArrayList<Raindrop>();
    drops.add(new Raindrop());
    speed = new PVector(0, 5);

  mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
  background(255);
}

void draw()
{
    scale(1);
    fill(255, 255, 255, bgAlpha);
    noStroke();
    rect(0,0,width, height);
    
    for(int i = 0; i<drops.size(); i++)
    {
        Raindrop r = drops.get(i);
        if(r!=null)
        {
          r.move();
          r.display();
          if(r.p.y>height) 
          {
            drops.remove(i);
            drops.add(i, new Raindrop());
          }
        }
    }
    
    if(drops.size()<500) drops.add(new Raindrop());
    
    if(movie) mm.addFrame();
}

class Raindrop
{  
    float len = 50;
    PVector p;
    float x1, x2;
    float sc = 1;
    
    Raindrop()
    {
        p = new PVector(random(width), -len);
        x1 = random(-0.2, 0.2);
        x2  =random(-0.2, 0.2);
        sc = pow(random(0.5, 1), 3);
        //sc = random(0.1, 1);
    }
    
    void move()
    {
        PVector v = speed.get();
        v.mult(sqrt(sc));
        p.add(v);
    }
    
    void display()
    {
        noStroke();
        fill(0,0,0,150);
        x1+=random(-0.01, 0.01);
        x2+=random(-0.01, 0.01);
        pushMatrix();
        translate(p.x, p.y);
          rotate(atan2(speed.y, speed.x));
          rotate(-PI/2);
          scale(sc);
          beginShape();
            vertex(0,0);
            bezierVertex(len*(0.8+x1), len, -len*(0.8+x2), len, 0, 0);
          endShape(CLOSE);
        popMatrix();
    }
}


