void keyPressed()
{  
    if(key=='r') setup();
    //if(key=='m') 
    //{
    //  if(movie)
    //  {
    //      mm.finish();
    //      println("movie finished");
    //  }
    //  else
    //  {
    //      time = 0;
    //      mm = new MovieMaker(this, width, height, "movies/" + year() + month() + day() + hour() + minute() + second()  +".mov", 25, MovieMaker.ANIMATION, MovieMaker.LOW);
    //      println("movie");
    //  }
      
    //  movie = !movie;
    //}
    
    if(key=='p') saveFrame("screengrabs/pic-######.png"); 
    if(key=='m') moving = !moving;
    
    //change params
    if(keyCode==UP) langle*=1.1;
    if(keyCode==DOWN) langle/=1.1;
    if(keyCode==LEFT) bangle/=1.1;
    if(keyCode==RIGHT) bangle*=1.1;
    
   
    
    if(key=='w') scaling*=1.05;
    if(key=='s') scaling/=1.05;
    if(key=='d') maxDepth++;
    if(key=='a') maxDepth--;
    
    println(".....params.....");
    println("langle: " + langle*57);
    println("bangle: " + bangle*57);
    println("scaling: " + scaling);
    println("maxDepth: " + maxDepth);
}