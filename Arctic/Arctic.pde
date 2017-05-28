import fisica.*;
import java.util.*;
  
  FWorld world;
  FBox bear;
  ArrayList<FBox> platforms;
  FBox frontPlat;
  int platCount;
  FBox lastPlat;
  
  Random r = new Random();
  
  void setup(){
    lastPlat = null;
    size(852,480);
    smooth();
    platforms = new ArrayList<FBox>();
    Fisica.init(this);
    world = new FWorld();
    world.setGravity(0, 800);
    world.setEdges();
    world.remove(world.right);
    world.remove(world.bottom);
    world.setEdgesRestitution(0.5);
    
    FBox platform = new FBox(100,10);
    platform.setPosition(200,height-100);
    platform.setStatic(true);
    platform.setGrabbable(false);
    world.add(platform);
    platforms.add(platform);
    frontPlat = platform;
    
    FBox platform2 = new FBox(200,10);
    platform2.setPosition(450,height-80);
    platform2.setStatic(true);
    platform2.setGrabbable(false);
    world.add(platform2);
    platforms.add(platform2);
    
    FBox platform3 = new FBox(150,10);
    platform3.setPosition(650,height-150);
    platform3.setStatic(true);
    platform3.setGrabbable(false);
    world.add(platform3);
    platforms.add(platform3);
    
    bear = new FBox(50,80);
    bear.setFill(1000,10);
    PImage img;
    img = loadImage("polarbear.png");
    bear.attachImage(img);
    bear.setPosition(200,height-150);
    bear.setGrabbable(false);
    bear.setRotatable(false);
    bear.setFriction(20);
    world.add(bear);
    
    platCount = platforms.size();

  }
  
  void draw(){
    PImage img;
    img = loadImage("snow.jpg");
    background(img);
    world.step();
    world.draw();
    
    if(bear.getY() > height){
      textSize(32);
      text("game over, press r to restart", 10, 30); 
      //exit();
    }
    
    if(platforms.get(platforms.size()-1).getX() < 700){///
    int widthr = r.nextInt(150);
    int lengthr = r.nextInt(100);
    int size = 100 + r.nextInt(100);
    
      FBox platform = new FBox(size,10);
      platform.setPosition(width+widthr,height-(100+lengthr));
      platform.setStatic(true);
      platform.setGrabbable(false);
       
         if(platCount == 10){
            platform.setFill(0,100,20);
            lastPlat = platform;
            world.add(platform);
           platforms.add(platform);
          }
          
          if(platCount <10){
          world.add(platform);
          platforms.add(platform);
          frontPlat = platforms.get(0);
          }
         
         
         if(bear.isTouchingBody(lastPlat)){
            textSize(32);
            text("You won!!!!!", 10, 30); 
            delay(20000);
            exit();
         }
    }

    if(frontPlat.getX() < -frontPlat.getWidth()){///
    
         world.remove(platforms.get(0));

    }
    
     platCount = platforms.size();
  
 
  }
    
  void keyPressed(){
      if(key == 'd' || key == 'D'){
        bear.adjustVelocity(10,0);
        for(FBox plat:platforms){
          plat.adjustPosition(-10,0);
        }
      }
      if(key == 'a' || key == 'A'){
        bear.adjustVelocity(-10,0);
        for(FBox plat:platforms){
          plat.adjustPosition(10,0);
        }
      }
      if(key == 'w' || key == 'W'){
        bear.setVelocity(0,-300);
      }
      if(key == 'r' || key == 'R'){
        setup();
      }
  }
  
    

  
  