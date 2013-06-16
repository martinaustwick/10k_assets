/*
  Written by Martin Austwick in 2013
*/


import processing.video.*;

int alphaVal = 255;
boolean invert = true;
Blade cl;
ArrayList<Blade> bl;
boolean moon = false;

MovieMaker mm;
boolean movie = false;

void setup()
{
    size(1280, 720);
    smooth();
    mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
    
    cl = new Blade();
    bl = new ArrayList<Blade>();
    for(int i = 0; i<1000; i++)
    {
        bl.add(new Blade());
    }
    
}

void draw()
{
    float t = TWO_PI*frameCount/3000;
    background(255);
    
    fill(0);
    
    translate(0, height);
    scale(2);
    for(int i = 0; i<bl.size(); i++)
    {
        bl.get(i).display();
        translate(2,0);
    }
    if(movie) mm.addFrame();
    if(frameCount>1000) {
      mm.finish();
      movie = false;
      println("movie finished");
    }
}

class Blade
{
    PVector p, v;
    float len = 50;
    
    PVector c1, c2, c3, c4, c5;
    float rx;
    float phase, w;
    
    
    Blade()
    {
        p = new PVector(0,0);
        len*=random(0.4,1);
        rx = 0.01*len;
        c1 = new PVector(random(-rx,rx), random(rx,rx));
        c2 = new PVector(random(-rx,rx), random(rx,rx));
        c3 = new PVector(random(-rx,rx), random(rx,rx));
        c4 = new PVector(random(-rx,rx), random(rx,rx));
        c5 = new PVector(random(-rx,rx), random(rx,rx));
        
        p =  new PVector(0.05*len + c3.x, c3.y-len);
        
        phase = random(TWO_PI);
        w = random(0.01, 0.1);
    }
    
    void display()
    {
       
        noStroke();
        fill(0,0,0, alphaVal);
        float amp = 0.1*len;
        PVector pt = new PVector((amp*cos(phase + frameCount*w)), 0.2*(amp*sin(phase + frameCount*w)));
        
        beginShape();
          vertex(-0.1*len, 0);
          bezierVertex(c1.x-0.01*len,c1.y-0.5*len,  c2.x-0.05*len,  c2.y-0.8*len, p.x + pt.x, p.y + pt.y);
          bezierVertex( c4.x-0.03*len,  c4.y-0.7*len,  + c5.x+0.02*len,  c5.y-0.5*len, 0*len, 0);
        endShape(CLOSE);

    }
}
