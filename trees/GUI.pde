void keyPressed()
{  
    if(key=='r') setup();
    if(key=='m') 
    {
      if(movie)
      {
          mm.finish();
          println("movie finished");
      }
      else
      {
          time = 0;
          mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() + second()  +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
          println("movie");
      }
      
      movie = !movie;
    }
    
    if(key=='a') moving = !moving;
}
