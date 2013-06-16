void keyPressed()
{
    if(key=='r') setup();
    if(key=='i') invert = !invert;
    if(keyCode==UP) 
    {
      alphaVal+=10;
      if(alphaVal>255) alphaVal=255;
      //dark = color(0,0,0,alphaVal);
    }
    
    if(keyCode==DOWN) 
    {
      alphaVal-=10;
      if(alphaVal<0) alphaVal=0;
    }
    
    if(key=='m') 
    {
      if(movie)
      {
          mm.finish();
          println("movie finished");
      }
      else
      {
          mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() + second()  +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
          println("movie started");
      }
      
      movie = !movie;
    }
}
