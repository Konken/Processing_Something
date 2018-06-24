ArrayList<Raindrop> r= new ArrayList<Raindrop>();
void setup(){
	fullScreen(P3D);
	for(int i=0;i<30;i++){
		r.add(new Raindrop(random(-width/2,width/2),random(-height/2,height/2),random(500),100));
	}
}

void draw() {
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
	boolean draw(){
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
	boolean ripple(){
		boolean b=false;
		beginShape();
		stroke(255,255-nowRad*4);
		noFill();
		for(int i=0;i<360;i++){
			vertex(x+nowRad*cos(radians(i)),y+nowRad*sin(radians(i)),0);
		}
		endShape();	
		nowRad+=1.5;
		if(rad<nowRad){
			b=true;
		}
		return b;
	}
}