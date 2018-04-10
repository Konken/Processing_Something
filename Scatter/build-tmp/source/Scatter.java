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

public class Scatter extends PApplet {

Wave[]w;
int[]c=new int[4];
public void setup(){
	
	w=new Wave[4];
	c[0]=color(58, 64, 90);
	c[1]=color(179, 136, 235);
	c[2]=color(128, 147, 241);
	c[3]=color(114, 221, 247);
	for(int i=0;i<4;i++){
		w[i]=new Wave(c[i],height/5*i);
	}
}

public void draw() {
	background(255);
	for(int i=0;i<4;i++){
		w[i].update();
	}
}
class Wave{
	int c;
	float n;
	float step;
	ArrayList<Float> list = new ArrayList<Float>();
	float step_noise=0.002f;
	Wave(int c,float s){
		this.c=c;
		n=random(10);
		step=s;
		for(int i=0;i<width;i++){
			list.add(noise(n));
			n+=step_noise;
		}
	}
	public void update(){
		list.add(noise(n));
		list.remove(0);
		n+=step_noise;
		beginShape();
		vertex(width,height);
		vertex(0,height);
		for(int i=0;i<width;i++){
			noStroke();
			fill(c);
			vertex(i,list.get(i)*200+step);
		}
		vertex(width,height);
		endShape();
	}
}
  public void settings() { 	fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Scatter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
