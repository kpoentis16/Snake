#include <MeggyJrSimple.h>

//create instance varibales for playerX, playerY
int xcoord = 0;
int ycoord = 0;

//create a direction varibale, create an int that is equal to 0, 90, 180, 360
int direction = 0;

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
  DrawWalls();
  
  DrawPx(xcoord,ycoord,Blue);
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
  
    
//if the direction is 0, add 1 to y
//if the direction is 90, add 1 to x
//if the direction is 180, decrease 1 from y
//if the direction is 270, decrease 1 from x
  if(direction==0)
    if(ReadPx(xcoord,ycoord+1)!=Red)
    ycoord=ycoord+1;
  if(direction==90)
    if(ReadPx(xcoord+1,ycoord)!=Red)
    xcoord=xcoord+1;
  if(direction==180)
    if(ReadPx(xcoord,ycoord-1)!=Red)
    ycoord=ycoord-1;
  if(direction==270)
    if(ReadPx(xcoord-1,ycoord)!=Red)
    xcoord=xcoord-1;
  
 //Draw the player and display the slate, delay, clear slate
  DisplaySlate();
  delay(150);
  ClearSlate();
 
 //adjust (or correct) the values to wrap the coordinates
  if(xcoord>7)
    xcoord=0;
 if(xcoord<0)
    xcoord=7;
  if(ycoord>7)
    ycoord=0;
  if(ycoord<0)
    ycoord=7;
}

//obstacles/walls
void DrawWalls()
  {
    DrawPx(1,1,Red);             
    DrawPx(1,2,Red);
    DrawPx(1,6,Red);
    DrawPx(2,6,Red);
    DrawPx(3,6,Red);
    DrawPx(4,6,Red);
    DrawPx(6,6,Red);
    DrawPx(6,5,Red);
    DrawPx(6,4,Red);
    DrawPx(6,2,Red);
    DrawPx(6,1,Red);
    DrawPx(5,1,Red);
    DrawPx(4,1,Red);
    DrawPx(3,1,Red);
    DrawPx(3,2,Red);
    DrawPx(3,4,Red);
    DrawPx(4,4,Red);
  
  }
