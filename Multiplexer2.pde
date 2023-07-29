class Multiplexer2 extends Gate {
  Multiplexer2(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, -Height/4, -1));
    connections.add(new Connection(this, 0, 0, -1));
    connections.add(new Connection(this, 0, Height/4, -1));
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
    drawMultiplexer(x, y, Width, Height);
    evaluate();
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void drawMultiplexer(float  x, float  y, float Width, float  Height) {
    stroke(150);
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(25);
    text("S", x+2, y-Height/4);
    text("I", x+2, y);
    text("I", x+2, y+Height/4);
    text("O", x+Width-20, y);
    textSize(10);
    text("MUX", x+Width/2, y);
  }
  boolean evaluate() {
    getInputs();
    connections.get(3).value=connections.get(1).value&&(!connections.get(0).value)||connections.get(2).value&&(connections.get(0).value);
    return connections.get(3).value;
  }
}
