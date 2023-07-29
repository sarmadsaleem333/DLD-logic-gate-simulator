class Decoder1 extends Gate {
  Decoder1(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, -Height/4, -1));
    connections.add(new Connection(this, 0, 0, -1));
    connections.add(new Connection(this, 0, Height/4, -1));
    connections.add(new Connection(this, Width, -Height/2, 1));
    connections.add(new Connection(this, Width, -Height/4, 1));
    connections.add(new Connection(this, Width, +Height/4, 1));
    connections.add(new Connection(this, Width, +Height/2, 1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);

    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }
    drawDecoder(x, y, Width, Height);
    evaluate();
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void drawDecoder(float  x, float  y, float Width, float  Height) {
    stroke(150);
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(25);
    text("Enable", x+2, y-Height/4);
    text("I0", x+2, y);
    text("I1", x+2, y+Height/4);
    textSize(10);
    text("DEOCODER", x+Width/2, y);
  }
  boolean evaluate() {
    getInputs();
    boolean e,a,b;
    e=connections.get(0).value;
    a=connections.get(1).value;
    b=connections.get(2).value;
    connections.get(3).value=!(!a&&!b&&!e);
    connections.get(4).value=!(!a&&b&&!e);
    connections.get(5).value=!(a&&!b&&!e);
    connections.get(6).value= !(a&&b&&!e);
    return connections.get(3).value;
  }
}
