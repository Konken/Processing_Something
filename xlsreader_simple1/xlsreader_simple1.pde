float tx,ty;
Node[][]n;
Node[][]n2;
Node[][]n3;
int len=10;
int len2=40;
int len3=80;
float ranSize=len/2;
float ranSize2=len2/2;
float ranSize3=len3/2;
PImage img;
int now=2;
void setup() {
	fullScreen(2);
	img = loadImage("meh.ro9480.jpg");
	image(img,0,0,width,height);
	loadPixels();
	tx=0;
	ty=height/2;
	n=new Node[width/len][height/len];
	n2=new Node[width/len2][height/len2];
	n3=new Node[width/len3][height/len3];
	for(int i=0;i<width/len;i++){
		for(int j=0;j<height/len;j++){
			n[i][j]=new Node(len,pixels[j*width*len + i*len],200);
		}
	}
	for(int i=0;i<width/len2;i++){
		for(int j=0;j<height/len2;j++){
			n2[i][j]=new Node(len2,pixels[j*width*len2 + i*len2],100);
		}
	}
	for(int i=0;i<width/len3;i++){
		for(int j=0;j<height/len3;j++){
			n3[i][j]=new Node(len3,pixels[j*width*len3 + i*len3],40);
		}
	}
	background(255);
}

void draw() {
	if(now==0){
		for(int i=0;i<width/len;i++){
			for(int j=0;j<height/len;j++){
				n[i][j].make(random(i*len-ranSize,i*len+ranSize),random(j*len-ranSize,j*len+ranSize));
			}
		}
	}
	else if(now==1){
		for(int i=0;i<width/len2;i++){
			for(int j=0;j<height/len2;j++){
				n2[i][j].make(random(i*len2-ranSize2,i*len2+ranSize2),random(j*len2-ranSize2,j*len2+ranSize2));
			}
		}
	}
	else if(now==2){
		for(int i=0;i<width/len3;i++){
			for(int j=0;j<height/len3;j++){
				n3[i][j].make(random(i*len3-ranSize3,i*len3+ranSize3),random(j*len3-ranSize3,j*len+ranSize3));
			}
		}
	}
	if(frameCount%200==0){
		now--;
	}
	saveFrame("pic/line-####.tif"); 
	if(frameCount==200*5){
		exit();
	}
}

void mouseDragged() {
	for(int i=0;i<width/len;i++){
		for(int j=0;j<height/len;j++){
			n[i][j].make(mouseX,mouseY);
		}
	}
}

void keyPressed() {
	now--;
}
class Node{
	ArrayList hist = new ArrayList();
	float joinDist = 90;
	float s;
	color c;
	float al;
	Node(float s,color c,float al){
		this.c=c;
		this.s=s;
		this.al=al;
	}
	void make(float x,float y){
		if(5<hist.size()){
			hist.remove(0);
		}
		stroke(c, al);
		strokeWeight(1);
		PVector d = new PVector(x+random(-s,s),y+random(-s,s), 0);
		hist.add(0,d);
		for (int p = 0; p < hist.size(); p++) {
			PVector v = (PVector) hist.get(p);
			float joinChance = p/hist.size() +
			d.dist(v)/joinDist;
			if (joinChance < random(1))
				line(d.x, d.y, v.x, v.y);
		}
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