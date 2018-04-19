final float gravity=9.8;
Ball b=new Ball(random(width),0,10,10);
void setup() {
	fullScreen();
}

void draw() {
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
	void update(){
		ellipse(x, y,10,10);
		spy+=gravity/60;
		y+=spy;
	}
}