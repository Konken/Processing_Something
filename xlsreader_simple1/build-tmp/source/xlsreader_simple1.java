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

public class xlsreader_simple1 extends PApplet {

ArrayList hist = new ArrayList();
float joinDist = 90;
float tx,ty;
public void setup() {
	
	background(0xff1AC8ED);
	tx=0;
	ty=height/2;
}

public void draw() {
	for(int i=0;i<width;i+=20){
		for(int j=0;j<height;j+=20){
			make(random(i-10,i+10),random(j-10,j+10));
		}
	}
}

public void mouseDragged() {
	make(mouseX,mouseY);
}
public void make(float x,float y){
	stroke(0xff8C2155, 25);
	strokeWeight(1);
	PVector d = new PVector(x,y, 0);
	hist.add(0,d);
	for (int p = 0; p < hist.size(); p++) {
		PVector v = (PVector) hist.get(p);
		float joinChance = p/hist.size() +
		d.dist(v)/joinDist;
		if (joinChance < random(1))
			line(d.x, d.y, v.x, v.y);
	}
}
public void keyPressed() {
	if (key == ' ') {
		background(0xff1AC8ED);
		hist.clear();
	}
}











/*ArrayList hist = new ArrayList();
float joinDist = 90;
float tx,ty;
float xstep=2;
float n=random(10);
void setup() {
	fullScreen();
	background(#1AC8ED);
	tx=0;
	ty=height/2;
}

void draw() {
	make(tx,ty);
	tx+=xstep;
	ty+=(0.5-noise(n))*10;
	n+=0.1;
}

void mouseDragged() {
	make(mouseX,mouseY);
}
void make(float x,float y){
	stroke(#8C2155, 25);
	strokeWeight(1);
	PVector d = new PVector(x,y, 0);
	hist.add(0,d);
	for (int p = 0; p < hist.size(); p++) {
		PVector v = (PVector) hist.get(p);
		float joinChance = p/hist.size() +
		d.dist(v)/joinDist;
		if (joinChance < random(1))
			line(d.x, d.y, v.x, v.y);
	}
}
void keyPressed() {
	if (key == ' ') {
		background(#1AC8ED);
		hist.clear();
	}
}*/
  public void settings() { 	fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "xlsreader_simple1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
