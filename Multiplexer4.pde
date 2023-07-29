class Multiplexer4 extends Gate {
  Multiplexer4(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, -Height/2, -1));
    connections.add(new Connection(this, 0, -Height/4, -1));
    connections.add(new Connection(this, 0, 0, -1));
    connections.add(new Connection(this, 0, Height/8, -1));
    connections.add(new Connection(this, 0, Height/4, -1));
    connections.add(new Connection(this, 0, Height/2, -1));
    connections.add(new Connection(this, Width, 0, 1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);
    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }
    drawMultiplexer4(x, y, Width, Height);
    evaluate();
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void drawMultiplexer4(float  x, float  y, float Width, float  Height) {
    stroke(150);
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(15);
    text("S", x+2, y-Height/2+10);
    text("S", x+2, y-Height/4);
    text("I", x+2, y);
    text("I", x+2, y+Height/8);
    text("I", x+2, y+Height/4);
    text("I", x+2, y+Height/2);


    textSize(10);
    text("MUX", x+Width/2, y);
  }
  boolean evaluate() {
    getInputs();
    connections.get(6).value=(!connections.get(0).value&& !connections.get(1).value && connections.get(2).value)||(!connections.get(0).value&& connections.get(1).value && connections.get(3).value)||(connections.get(0).value&& !connections.get(1).value && connections.get(4).value)||(connections.get(0).value&&connections.get(1).value && connections.get(5).value);
    return connections.get(6).value;
  }
}
