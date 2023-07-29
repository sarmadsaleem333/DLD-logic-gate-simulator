import g4p_controls.*;
float boxSize=8;
ArrayList<Gate> gate=new ArrayList<Gate>();
ArrayList<Wire> wires = new ArrayList<Wire>();
Connection inConnection;
Connection outConnection;

void setup()
{
  size(1900, 1000);
  surface.setResizable(true);
  surface.setTitle("DIGITAL LOGIC DESIGN SIMULATOR(DEVELOPER: MSS)");
  PFont font = createFont("Times New Roman", 20);
  int style = java.awt.Font.PLAIN;

  GButton andbutton = new GButton(this, 10, 120, 270, 30, "AND GATE ");
  andbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  andbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  andbutton.addEventHandler(this, "andbutton");

  GButton orbutton = new GButton(this, 10, 160, 270, 30, "OR GATE ");
  orbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  orbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  orbutton.addEventHandler(this, "orbutton");

  GButton notbutton = new GButton(this, 10, 200, 270, 30, "NOT GATE ");
  notbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  notbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  notbutton.addEventHandler(this, "notbutton");

  GButton nandbutton = new GButton(this, 10, 240, 270, 30, "NAND GATE ");
  nandbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  nandbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  nandbutton.addEventHandler(this, "nandbutton");

  GButton norbutton = new GButton(this, 10, 280, 270, 30, "NOR GATE");
  norbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  norbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  norbutton.addEventHandler(this, "norbutton");

  GButton probbutton = new GButton(this, 10, 440, 270, 30, "LOGIC PROB");
  probbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  probbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  probbutton.addEventHandler(this, "probbutton");

  GButton togglebutton = new GButton(this, 10, 400, 270, 30, "LOGIC TOGGLE");
  togglebutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  togglebutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  togglebutton.addEventHandler(this, "togglebutton");

  GButton mulbutton = new GButton(this, 10, 560, 270, 30, "2-1 MULTIPLEXER");
  mulbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  mulbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  mulbutton.addEventHandler(this, "mulbutton");

  GButton mul4button = new GButton(this, 10, 600, 270, 30, "4 TO 1 MULTIPLEXER");
  mul4button.setLocalColorScheme(GCScheme.RED_SCHEME);
  mul4button.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  mul4button.addEventHandler(this, "mul4button");

  GButton halfadderbutton = new GButton(this, 10, 520, 270, 30, "HALF ADDER");
  halfadderbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  halfadderbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  halfadderbutton.addEventHandler(this, "halfadderbutton");

  GButton xorbutton = new GButton(this, 10, 360, 270, 30, "XOR");
  xorbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  xorbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  xorbutton.addEventHandler(this, "xorbutton");

  GButton xnorbutton = new GButton(this, 10, 320, 270, 30, "XNOR");
  xnorbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  xnorbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  xnorbutton.addEventHandler(this, "xnorbutton");

  GButton displaybutton = new GButton(this, 10, 640, 270, 30, "SEVEN SEGMENT DISPLAY");
  displaybutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  displaybutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  displaybutton.addEventHandler(this, "displaybutton");

  GButton fulladderbutton= new GButton(this, 10, 680, 270, 30, "FULL ADDER");
  fulladderbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  fulladderbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  fulladderbutton.addEventHandler(this, "fulladderbutton");

  GButton decoder1button= new GButton(this, 10, 720, 270, 30, "DECODER (2 TO 4 LINES)");
  decoder1button.setLocalColorScheme(GCScheme.RED_SCHEME);
  decoder1button.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  decoder1button.addEventHandler(this, "decoder1button");

  GButton halfsubtractorbutton= new GButton(this, 10, 760, 270, 30, "HALF SUBTRACTOR ");
  halfsubtractorbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  halfsubtractorbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  halfsubtractorbutton.addEventHandler(this, "halfsubtractorbutton");

  GButton jkbutton= new GButton(this, 10, 840, 270, 30, "JK FLIP FLOP");
  jkbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  jkbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  jkbutton.addEventHandler(this, "jkbutton");

  GButton srbutton= new GButton(this, 10, 880, 270, 30, "SR FLIP FLOP");
  srbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  srbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  srbutton.addEventHandler(this, "srbutton");

  GButton dbutton= new GButton(this, 10, 920, 270, 30, "D FLIP FLOP");
  dbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  dbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  dbutton.addEventHandler(this, "dbutton");

  GButton tbutton= new GButton(this, 10, 960, 270, 30, "T FLIP FLOP");
  tbutton.setLocalColorScheme(GCScheme.RED_SCHEME);
  tbutton.setFont(new java.awt.Font(font.getName(), style, font.getSize()));
  tbutton.addEventHandler(this, "tbutton");
}

void draw() {
  background(0);
  fill(#F53434);
  rect(50, 2, 82, 70);
  fill(#403738);
  rect(50, 28, 82, 20);
  textSize(15);
  fill(#DFE2EA);
  text("HIGH", 79, 40);
  fill(#0FA036);
  rect(150, 2, 82, 70);
  fill(#403738);
  rect(150, 28, 82, 20);  //
  textSize(15);
  fill(#DFE2EA);
  text("LOW", 180, 40);
  fill(#403738);
  rect(10, 80, 270, 30);
  textSize(20);
  fill(#DFE2EA);
  text("LOGIC GATES", 85, 100);
  fill(#403738);
  rect(10, 480, 270, 30);
  textSize(20);
  fill(#DFE2EA);
  text("COMBINATIONAL CIRCUITS", 35, 500);
  fill(#403738);
  rect(10, 800, 270, 30);
  textSize(20);
  fill(#DFE2EA);
  text("SEQUENTIAL CIRCUITS", 55, 820);
  for (int i=300; i<=width; i+=boxSize) {
    stroke(#4B4D46);
    strokeWeight(0.5);
    line(i, 0, i, height);
  }
  for (int i=0; i<=height; i+=boxSize) {
    stroke(#4B4D46);
    strokeWeight(0.5);
    line(300, i, width, i);
  }
  for (int i=0; i<gate.size(); i++)  gate.get(i).show();
  for (Wire w : wires) w.show();

  if (inConnection != null)
  {
    stroke(#ffffff);
    line(inConnection.x + inConnection.type*connectionWidth, inConnection.y, mouseX, mouseY);
  }
}
void mousePressed() {
  for (int i=gate.size()-1; i>=0; i--) {
    gate.get(i).select=false;
    if (gate.get(i).drag()) break;
  }
  for (int i=wires.size()-1; i>=0; i--)
  {
    wires.get(i).selectWire();
  }
  for (Gate g : gate) for (Connection c : g.connections) c.checkConnection();
  if (inConnection != null && outConnection != null )  makeConnection();
}
void mouseClicked() {
  for (int i=0; i<gate.size(); i++) {
    gate.get(i).switchButton();
  }
}

void mouseReleased() {
  for (int i=0; i<gate.size(); i++) {
    gate.get(i).release();
  }
}
void keyPressed() {
  if (key=='d') {
    for (int i=0; i<gate.size(); i++)gate.get(i).delete();
    for (int i=0; i<wires.size(); i++) wires.get(i).delete();
  }
  if (key=='q') {
    gate.clear();
    wires.clear();
  }
}

void andbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new And(width/2, height/2, 100, 100));
}
void orbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new Or(width/2, height/2, 100, 100));
}
void notbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new Not(width/2, height/2, 100, 100));
}
void nandbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new Nand(width/2, height/2, 100, 100));
}
void norbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)  gate.add(new Nor(width/2, height/2, 100, 100));
}
void probbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)  gate.add(new Prob(width/2, height/2, 50, 50));
}
void togglebutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)  gate.add(new Toggle(width/2, height/2, 50, 50));
}
void mulbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)    gate.add(new Multiplexer2(width/2, height/2, 100, 200));
}
void mul4button(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)    gate.add(new Multiplexer4(width/2, height/2, 100, 200));
}
void halfadderbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)    gate.add(new HalfAdder(width/2, height/2, 200, 100));
}
void xorbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)    gate.add(new Xor(width/2, height/2, 100, 100));
}
void xnorbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)    gate.add(new Xnor(width/2, height/2, 100, 100));
}
void displaybutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)    gate.add(new SevenSegmentDisplay(width/2, height/2, 100, 100));
}
void fulladderbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)     gate.add(new FullAdder(width/2, height/2, 100, 100));
}
void decoder1button(GButton source, GEvent event) {
  if (event==GEvent.CLICKED)  gate.add(new Decoder1(width/2, height/2, 100, 200));
}
void halfsubtractorbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new HalfSubtractor(width/2, height/2, 200, 100));
}
void jkbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new jkFlipFlop(width/2, height/2, 100, 200));
}
void srbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new srFlipFlop(width/2, height/2, 100, 200));
}
void dbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new dFlipFlop(width/2, height/2, 100, 200));
}
void tbutton(GButton source, GEvent event) {
  if (event==GEvent.CLICKED) gate.add(new tFlipFlop(width/2, height/2, 100, 200));
}

void makeConnection()
{
  Wire newWire = new Wire(inConnection, outConnection);
  wires.add(newWire);
  inConnection = null;
  outConnection=null;
}
