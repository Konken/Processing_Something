import de.bezier.data.*;
XlsReader reader;
PImage img;
int howmanyContry=8;
String[]country=new String[howmanyContry];
float[][]per=new float[howmanyContry][11];
float[][]numOfPeople=new float[howmanyContry][11];
float[]x=new float[howmanyContry];
float[]y=new float[howmanyContry];
float japan_X=804;
float japan_y=470;
void setup() {
	size(1710,1137);
	img=loadImage("4.jpg");
	reader = new XlsReader( this, "kankou_syukuhakukyaku.xls" );
	for(int i=0;i<country.length;i++){
		country[i]=reader.getString( i*4+4, 0 );
		for(int j=0;j<11;j++){
			per[i][j]=reader.getFloat( i*4+4, 3+j );
			println(per[i][j]);
			numOfPeople[i][j]=reader.getFloat( i*4+5, 3+j );
		}
		println();
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

void mousePressed() {
	println(mouseX+","+mouseY);
}
void draw() {
	image(img, 0, 0, img.width/2*1.5, img.height/2*1.5);
	for(int i=0;i<country.length;i++){
		fill(per[i][0]*2,100,255);
		noStroke();
		ellipse(x[i], y[i], per[i][0]+20, per[i][0]+20);
	}
}