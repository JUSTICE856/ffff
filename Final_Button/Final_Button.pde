import processing.serial.*;

Serial arduino; // Serial object for Arduino communication
Serial myPort;
PImage found;
PImage HaHa;
PImage NEWS;
PImage TVS;
PImage WATER;
PImage WATER2;
PImage Jail_g;
PImage tik;
PImage boat;
PImage winter;
PImage Music;
PImage Man;
PImage glass;
PImage beach;
PImage sun;
PImage where;
PImage camp;
PImage space;
PImage black;
PImage purple;
PImage santa;
PImage Present;
PImage Help;
PImage beachball;
PImage run;
PImage surf;
PImage balloonPop;
PImage bee;
PImage hive;
PImage night;
PImage all;
PImage pig;
PImage astro;
PImage Jail;
PImage img;
PImage menu;
int yVal;
int yPos;
int place=0;
int xPos=200;
int xDir=1;
int currentTime=0;
int savedTime=0; 
int xdirection = 1;  
int ydirection = 1;
int rad = 60; 
int[] dog;
float r1; /////random function that places items in diffrent places every time you reload the game
float r2; 
float y = 0;
int value = 0;
int num = 50;
int[] x = new int[num];
int[] y3 = new int[num];
float xpos, ypos;       
float xspeed = 1.8;  
float yspeed = 1.2;
float Y = 60;
float Y2 = 270;
float Y3 = 450;
float Y4 = 420;
String[] words;
boolean hasPopped=false;
int val=0;
void setup() {
  size(1940, 1090);
  arduino = new Serial(this, Serial.list()[1], 9600); // Initialize Serial communication with Arduino
  smooth();
  noCursor();
  place = 1;
  NEWS= loadImage("NEWS.png");
  HaHa= loadImage("HaHa.png");
 surf= loadImage("surf.png");
  WATER= loadImage("WATER.png");
  WATER2= loadImage("WATER2.png");
  Jail_g= loadImage("Jail_g.jpg");
  glass= loadImage("glass.png");
  found = loadImage("found.gif");
  Man= loadImage("Man.png");
  beach = loadImage("beach.jpg");
  sun = loadImage("sun.png");
  where = loadImage("where.png");
  TVS = loadImage("TVS.png");
  Music = loadImage("Music.png");
  winter = loadImage("winter.png");
  tik = loadImage("tik.png");
  balloonPop = loadImage("processingballoon2.png");
  camp= loadImage("camp.png");
  space= loadImage("space.png");
  purple= loadImage("purple.png");
   black= loadImage("black.png");
   santa= loadImage("santa.png");
   Present= loadImage("Present.png");
   Help= loadImage("Help.png");
   beachball= loadImage("beachball.png");
   bee= loadImage("bee.png");
   run= loadImage("run.png");
   hive= loadImage("hive.png");
   night= loadImage("night.png");
   all = loadImage("all.png");
   pig = loadImage("pig.png");
   astro = loadImage("astro.png");
   Jail = loadImage("Jail.png");
   menu = loadImage("menu.png");
  r1 = random(width); 
  r2 = random(height); 
  frameRate(30);
  xpos = width/2;
  ypos = height/2;
}

void draw() {

        if (arduino != null && arduino.available() > 0) {
    String data = arduino.readStringUntil('\n');  
    
    if (data != null) {
      data = data.trim();
      String[] values = split(data, ',');
      
      if (values.length == 2) {
        int xVal = int(values[0]);
        int yVal = int(values[1]);

        
        float xPos = map(xVal, 0, 1023, 0, width);
        float yPos = map(yVal, 0, 1023, 0, height);

    if (place == 1) {
    where.resize(1940, 1090);
    image(where, 0, 0);
    fill(245, 245, 220);
    rect(1484,890,328,140);
    textSize(128);
    text("Start", 1484, 875); 
    fill(0);
    textSize(48);
    text("(Press Enter)", 1520, 970);  
    textSize(28);
    text("Objective: To locate Laundry Man and send him to jail, look for unusual items in each scene  ", 700, 90);
    text(" and click and hold them with your mouse.", 696, 116);
    fill(245, 245, 220);
    text(" Note: To enter each scene, press the ENTER key.", 960, 166);
  mouseX = int(xPos);
        mouseY = int(yPos);
    
    
  }
    
    if (place == 3) {
    space.resize(1940, 1090);
    image(space, 0, 0);
    image(all,177,Y);
    Y++;
    if (Y > 480) {
    Y = 150;
  }
  textSize(48);
    text("(Hint: UFO)", 1500, 1020);
    image(glass,mouseX, mouseY, 100, 100);
     mouseX = int(xPos);
        mouseY = int(yPos);
    
if(hasPopped==true)image(pig, 1650, 495);
  else image(pig,1650,495);
  hive.resize(120, 160);}
  if(mouseX > 1650 && mouseX < (1650 + pig.width) && mouseY > 445 && mouseY < (445 + pig.height ))
    image(astro,1309,Y2);
    Y2++;
    if (Y2 > 420) {
    Y2 = 270;
    }
  
  if (place == 4) {
    camp.resize(1940, 1090);
    image(camp, 0, 0);
     fill(0);
     textSize(48);
    text("(Hint: Bzzzz)", 1500, 1020);
    xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  image(bee,xpos,ypos);
  bee.resize(30, 40);
  
  
  if(hasPopped==true)image(hive, 250, 200);
  else image(hive,250,200);
  hive.resize(120, 160);}
  
   image(glass,mouseX, mouseY, 100, 100);
    mouseX = int(xPos);
        mouseY = int(yPos);
  
  if(mouseX > 250 && mouseX < (250 + hive.width) && mouseY > 200 && mouseY < (200 + hive.height ))
    image(night,1260,340);
  }

  if (place == 5) {
    beach.resize(1940, 1090);
    image(beach, 0, 0);
    image(Man, 486, 707);
    sun.resize(240, 110);
    image(sun, 528, 700);
   surf.resize(650, 650);
   image(surf, xPos, 330);
   fill(0);
   textSize(48);
    text("(Hint: Inflateable)", 1500, 1020);
   xPos=xPos+xDir;
  if (xPos>width-10 || xPos<20)
  {
    xDir=-xDir;
  
  
  

  y = y + 1;

if(hasPopped==true)image(beachball, 70, 900);
    beachball.resize(120, 140);}
    else image(beachball,70,900);
    
    if(mouseX > 70 && mouseX < (70 + beachball.width) && mouseY > 800 && mouseY < (800 + beachball.height ))
    image(run,760,350);
     image(glass,mouseX, mouseY, 100, 100);
    mouseX = int(xPos);
        mouseY = int(yPos);
    
  }
  
 

  if (place == 2) {
    image(Music,0,0); 
    Music.resize(1940, 1090);
    fill(0);
    textSize(48);
    text("(Hint: Click an unusual note)", 1300, 1020);
    
if(hasPopped==true)image(tik, 686, 307);
else image(purple,r1,r2);
purple.resize(40, 60);}
 if (y > 100) {
    
    y = 100;
    

if(hasPopped==true)image(menu, 1707, -40);
menu.resize(90, 100);}
else image(menu,1707,-40);

if(mouseX > 1707 && mouseX < (1707 + menu.width) && mouseY > -40 && mouseY < (-40 + menu.height )) 
    place = 0;
    image(glass,mouseX, mouseY, 100, 100);

}
  
  if (place == 6) {
    winter.resize(1940, 1090);
    image(winter, 0, 0);
    fill(0);
    textSize(48);
    text("(Hint: You get this every christams)", 1200, 1020);
       
    
     
    if(hasPopped==true)image(Present, 977, 1005);
    else image(Present,977,1005);
    Present.resize(40, 60);}
    
    if(mouseX > 977 && mouseX < (977 + Present.width) && mouseY > 1005 && mouseY < (1005 + Present.height )) 
    image(santa,20,0);
        }
    
   if (place == 0) {
   
 
  Jail_g.resize(1940, 1090);
  image(Jail_g, 0, 0);
  TVS.resize(325, 260);
  image(TVS, 1603, 49);
  NEWS.resize(245, 154);
  image(NEWS, 1642, 93);
  HaHa.resize(345, 454);
  image(HaHa, 342, 303);
  textSize(89);
  fill(255);
  text("Thanks", 300, 175, -120);  // Specify a z-axis value
  text("for Playing!!!", 300, 280);
  fill(0);
  WATER.resize(25, 25);
  image(WATER, 1033, 450);
  image(WATER,1033,Y3);
    Y3++;
    if (Y3 > 480) {
    Y3 = 450;



  }
}


  

    

   if (arduino.available() > 0) {
    char receivedChar = (char)arduino.read(); // Read the character

    // Check the received character
     if (receivedChar == 'L') {
      // Navigate left
      if (place == 1) {
        place = 2;
      } else if (place == 2) {
        place = 6;
      } else if (place == 6) {
        place = 5;
      } else if (place == 5) {
        place = 4;
      } else if (place == 4) {
        place = 3;
      } else if (place == 3) {
        place = 0;
      }
    } else if (receivedChar == 'R') {
      // Navigate right
      if (place == 0) {
        place = 3;
      } else if (place == 3) {
        place = 4;
      } else if (place == 4) {
        place = 5;
      } else if (place == 5) {
        place = 6;
      } else if (place == 6) {
        place = 2;
      } else if (place == 2) {
        place = 1;
      }
    }
  }

    




  if (mouseX > r1  && mouseX < (r1 + tik.width) && mouseY > r2 && mouseY < (r2 + tik.height )) {
  


{hasPopped=true;

}
  }
}
  
