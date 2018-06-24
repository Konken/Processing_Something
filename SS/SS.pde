Cell[]c;
Country[]con;
int howManyContry=6;
PVector[]xy;
color[]tempColor;
float rad=70;
float h1=0;
float h2=0;
void setup() {
	fullScreen();
	c=new Cell[100];
	textSize(30);
	con=new Country[howManyContry];
	xy=new PVector[howManyContry];
	tempColor=new color[howManyContry];
	tempColor[0]=color(186,208,185);
	tempColor[1]=color(112,88,110);
	tempColor[2]=color(139,139,152);
	tempColor[3]=color(212,218,210);
	tempColor[4]=color(96,124,115);
	tempColor[5]=color(179,175,158);
	int count=0;
	for(int i=0;i<3;i++){
		for(int j=0;j<2;j++){
			xy[count]=new PVector(width/3*(i+1)-width/6,height/2*(j+1)-height/3+50);
			count++;
		}
	}
	for(int i=0;i<howManyContry;i++){
		con[i]=new Country(xy[i].x,xy[i].y,tempColor[i]);
	}
	for(int i=0;i<c.length;i++){
		c[i]=new Cell(random(width),random(height));
	}
}

void draw() {
	background(206, 183, 181);
	stroke(255);
	fill(157,197,191);
	triangle(225,100,225,100+rad,225-rad*sqrt(3)/2,100+rad-rad/2);
	triangle(width-225,100,width-225,100+rad,width-225+rad*sqrt(3)/2,100+rad-rad/2);
	noStroke();
	for(int i=0;i<c.length;i++){
		c[i].move();
		c[i].draw();
	}
	if((225>mouseX&&mouseX>225-rad*sqrt(3)/2)&&(100<mouseY&&mouseY<100+rad)){
		println("10");
		if(h1<69){
			h1+=10;
		}
		else{
			h1=69;
		}
	}
	else{
		if(0<h1){
			h1-=10;
		}
		else h1=0;
	}
	fill(157,197,191,100);
	noStroke();
	beginShape();
	vertex(226,100);
	vertex(226,100+h1);

	vertex(226-h1*sqrt(3),100+h1);
	endShape(CLOSE);
}
/*void mousePressed(){
	if((225<mouseX&&mouseX<225-rad)&&(100<mouseY&&mouseY<100+rad)){
		background(0);
	}
}*/
void mousePressed(){
	if((225<mouseX&&mouseX<225-rad)&&(100<mouseY&&mouseY<100+rad)){
		background(0);
	}
	for(int i=0;i<c.length;i++){
		int t=(int)random(howManyContry);
		PVector temp=con[t].change();
		PVector addTemp=con[t].add();
		temp.x+=addTemp.x;
		temp.y+=addTemp.y;
		c[i].update(temp,con[t].getNumber());
		c[i].propertiesColor(con[t].getColor());
	}
	for(int i=0;i<con.length;i++){
		con[i].refresh();
	}
}
class Cell{
	PVector pp;
	PVector target;
	float disx=0;
	float disy=0;
	float how=30;
	color c;
	int count=0;
	int number=-1;
	Cell(float x,float y){
		pp=new PVector(x,y);
		target=new PVector(x,y);
	}
	void propertiesColor(color c){
		this.c=c;
	}
	void update(PVector otaku,int number){
		target.x=otaku.x;
		target.y=otaku.y;
		disx=(pp.x-target.x)/60;
		disy=(pp.y-target.y)/60;
		this.number=number;
	}
	void move(){
		if((target.x-2<pp.x&&pp.x<target.x+2)||(target.y-2<pp.y&&pp.y<target.y+2)){
			pp.x=target.x;
			pp.y=target.y;
		}
		else{
			pp.x-=disx;
			pp.y-=disy;
		}
	}
	void draw(){
		fill(c);
		stroke(255);
		strokeWeight(2);
		ellipse(pp.x, pp.y, 60, 60);
		fill(255);
		text(number,pp.x-15,pp.y+15);
	}
	void refresh(){
		target.x=0;
		target.y=0;
		disx=0;
		disy=0;
	}
}
class Country{
	color c;
	PVector step=new PVector(-180,0);
	int count=0;
	int countNumber=0;
	float x;
	float y;
	Country(float x,float y,color c){
		this.x=x;
		this.y=y;
		this.c=c;
	}
	PVector change(){
		return new PVector(x,y);
	}
	color getColor(){
		return c;
	}
	void refresh(){
		step=new PVector(-180,0);
		count=0;
		countNumber=0;
	}
	int getNumber(){
		countNumber++;
		return countNumber;
	}
	PVector add(){
		if(count<5){
			step.x+=60;
			count++;
		}
		else{
			step.x=-120;
			step.y+=60;
			count=1;
		}
		return step;
	}
}