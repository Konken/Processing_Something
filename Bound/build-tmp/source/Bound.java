import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Bound extends PApplet {

final float gravity=9.8f;
Ball b=new Ball(random(width),0,10,10);
public void setup() {
	
}

public void draw() {
	b.update();
}

class Ball{
	float x,y,size,spy;
	Ball(float x,float y,float size,float spy){
		this.x=x;
		this.y=y;
		this.size=size;
		this.spy=spy;
	}
	public void update(){
		ellipse(x, y,10,10);
		spy+=gravity/60;
		y+=spy;
	}
}
  public void settings() { 	fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Bound" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
