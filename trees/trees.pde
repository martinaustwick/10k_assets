/*
  The structure of this code was largely
  based on work by Alasdair Turner.
  
  Other bits by Martin Austwick, 2013.
*/



import processing.video.*;
MovieMaker mm;
boolean moving = true;
boolean movie = false;
int movieFrame = 0;
int time = 0;
float moviePeriod = 100;

Branch parent;

void setup()
{
    size(500, 500);
    smooth();
    strokeWeight(5);
    parent = new Branch(0);
    mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() + second() +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);

}

void draw()
{
    background(255); 
    if(moving) time++;
    
    
    noFill();
    stroke(0);
    translate(width/2, height);
    parent.display();
    if(movie && time<moviePeriod)
    {
        mm.addFrame();
        movieFrame++;
    }
    else if(movie)
    {     
        mm.finish();
        movie = false;
        println("movie finished");
    }
    
}
