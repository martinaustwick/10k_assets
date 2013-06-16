void keyPressed()
{
    if(key=='r') setup();
    if(key=='m')
    {
        if(movie)
        {
            mm.finish();
            println("movie finished!");
        }
        else
        {
            mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
            println("movie started!");
        }
        movie = !movie;
    }
    
    if(keyCode==UP) 
    {
      bgAlpha+=10;
      if(bgAlpha>255) bgAlpha=255;
      //dark = color(0,0,0,alphaVal);
    }
    
    if(keyCode==DOWN) 
    {
      bgAlpha-=10;
      if(bgAlpha<0) bgAlpha=0;
    }
}
