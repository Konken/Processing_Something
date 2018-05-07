ArrayList hist = new ArrayList();
float joinDist = 90;
float tx,ty;
void setup() {
	fullScreen();
	background(#1AC8ED);
	tx=0;
	ty=height/2;
}

void draw() {
	for(int i=0;i<width;i+=20){
		for(int j=0;j<height;j+=20){
			make(random(i-10,i+10),random(j-10,j+10));
		}
	}
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