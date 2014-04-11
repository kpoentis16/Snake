#include <MeggyJrSimple.h>

//create instance varibales for playerX, playerY
int xcoord = 0;
int ycoord = 0;


//create a direction varibale, create an int that is equal to 0, 90, 180, 360
int direction = 0;

//create variable for apple 
int xapple = 0;
int yapple = 0;

//create a boolean statement for eating apples
boolean ateApple = true;

//create a speed variable
int speed = 630;

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
//draw the snake
  DrawPx(xcoord,ycoord,Green);
 
//draw apple
   DrawPx(xapple,yapple,Red);
   
//check buttons
  //each time through the loop check if button is pressed
  CheckButtonsPress();
  if(Button_Up)
  direction=0;
    
  if(Button_Right)
  direction=90;
  
  if(Button_Down)
  direction=180;
 
  if(Button_Left)
  direction=270;
 
  
//move the snake  
  //if the direction is 0, add 1 to y
  //if the direction is 90, add 1 to x
  //if the direction is 180, decrease 1 from y
  //if the direction is 270, decrease 1 from x
  if(direction==0)
    ycoord=ycoord+1;
  if(direction==90)
    xcoord=xcoord+1;
  if(direction==180)
    ycoord=ycoord-1;
  if(direction==270)
    xcoord=xcoord-1;
    
  //adjust (or correct) the values to wrap the coordinates
  if(xcoord>7)
    xcoord=0;
  if(xcoord<0)
    xcoord=7;
  if(ycoord>7)
    ycoord=0;
  if(ycoord<0)
    ycoord=7;
  
 //Display the slate, delay, clear slate
  DisplaySlate();
  delay(speed);
  ClearSlate();

//check if ate apple
  if(xcoord == xapple && ycoord == yapple)
  ateApple=true;
 
//If snake eats apple, beep, move new apple
  if(ateApple)
  {
    xapple = random (8);
    yapple = random(8);
    ateApple = false;
    
    Tone_Start(18182,50);  
  
    speed=speed-10;  
  }
  
}


