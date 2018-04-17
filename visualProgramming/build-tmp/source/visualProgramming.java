import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.bezier.data.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class visualProgramming extends PApplet {


XlsReader reader;
PImage img;
int howmanyContry=8;
String[]country=new String[howmanyContry];
float[][]per=new float[howmanyContry][11];
float[][]numOfPeople=new float[howmanyContry][11];
float[]x=new float[howmanyContry];
float[]y=new float[howmanyContry];
public void setup() {
	
	img=loadImage("4.jpg");
	reader = new XlsReader( this, "kankou_syukuhakukyaku.xls" );
	for(int i=0;i<country.length;i++){
		country[i]=reader.getString( i*4+5, 0 );
		for(int j=0;j<11;j++){
			per[i][j]=reader.getFloat( i*4+5, 3+j );
			numOfPeople[i][j]=reader.getFloat( i*4+6, 3+j );
		}
	}
	x[0]=726;
	y[0]=549;

	x[1]=759;
	y[1]=478;
	
	x[2]=629;
	y[2]=483;
	
	x[3]=694;
	y[3]=554;
	
	x[4]=1363;
	y[4]=457;
	
	x[5]=223;
	y[5]=398;
	
	x[6]=796;
	y[6]=792;
	
	x[7]=645;
	y[7]=584;
}

public void mousePressed() {
	println(mouseX+","+mouseY);
}
public void draw() {
	image(img, 0, 0, img.width/2*1.5f, img.height/2*1.5f);
	for(int i=0;i<country.length;i++){
		fill(255,0,0);
		ellipse(x[i], y[i], numOfPeople[i][0]*2, numOfPeople[i][0]*2);
	}
}
  public void settings() { 	size(1710,1137); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "visualProgramming" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
