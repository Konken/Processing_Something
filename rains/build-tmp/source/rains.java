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

public class rains extends PApplet {

ArrayList<Raindrop> r= new ArrayList<Raindrop>();
public void setup(){
	
	for(int i=0;i<30;i++){
		r.add(new Raindrop(random(-width/2,width/2),random(-height/2,height/2),random(500),100));
	}
}

public void draw() {
	background(0);
	translate(width/2,height/2);
	rotateX(radians(60));
	fill(255,20);
	//box(500);
	for(int i=0;i<r.size();i++){
		if(r.get(i).draw()){
			r.remove(i);
			r.add(new Raindrop(random(-width/2,width/2),random(-height/2,height/2),500,50));
		}
	}
}

class Raindrop{
	float x,y,z;
	float rad;
	float nowRad=0;
	Raindrop(float x,float y,float z,float rad){
		this.x=x;
		this.y=y;
		this.z=z;
		this.rad=rad;
	}
	public boolean draw(){
		boolean b=false;
		z++;
		beginShape();
		stroke(255);
		vertex(x,y,z);
		vertex(x,y,z+200);
		endShape();
		if(height/2+200<z){
			b=ripple();
		}
		return b;
	}
	public boolean ripple(){
		boolean b=false;
		beginShape();
		stroke(255,255-nowRad*5);
		noFill();
		for(int i=0;i<360;i++){
			vertex(x+nowRad*cos(radians(i)),y+nowRad*sin(radians(i)),0);
		}
		endShape();
		nowRad+=1.5f;
		if(rad<nowRad){
			b=true;
		}
		return b;
	}
}
  public void settings() { 	fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rains" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
