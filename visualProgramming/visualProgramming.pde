Brush b;

void setup() {
	fullScreen();
	translate(width/2,height/2);
	b=new Brush(0,0,random(360),200,40,600);
	background(0);
	stroke(255);
	b.drawBrush();
}

void draw() {
	
}

class Brush{
	float x,y,ang,len,howMany,howLong;
	float sx=random(10);
	float sy=random(10);
	float ny=sy;
	Brush(float x,float y,float ang,float len,float howMany,float howLong){
		this.x=x;
		this.y=y;
		this.ang=ang;
		this.len=len+random(-5,5);
		this.howMany=howMany;
		this.howLong=howLong;
	}
	void drawBrush(){
		pushMatrix();
		translate(x,y);
		rotate(radians(ang));
		for(int i=0;i<howMany;i++){
			ny=sy;
			float x1=len+random(-30,30);
			float y1=random(-30,30);
			float oldx=x1;
			float oldy=y1;
			for(int j=0;j<howLong;j++){
				x1-=len/howLong*2;
				y1+=(0.5-noise(ny));
				ny+=0.008;
				strokeWeight(5);
				line(x1,y1,oldx,oldy) ;
				oldx=x1;
				oldy=y1;
			}
		}
		popMatrix();
	}
}