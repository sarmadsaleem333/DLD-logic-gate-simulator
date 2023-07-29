class HalfSubtractor extends Gate {
  HalfSubtractor(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, -Height/4, -1));
    connections.add(new Connection(this, 0, Height/4, -1));
    connections.add(new Connection(this, Width, -Height/4, 1));
    connections.add(new Connection(this, Width, +Height/4, 1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);
    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }

    drawSubtractor();
    evaluate();
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void drawSubtractor() {
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(20);
    text("DIFF", x+Width-40, y-Height/4);
    text("CARRY", x+Width-60, y+Height/4);
    fill(#0F0204);
    text("HALF SUB", (x+x+Width-90)/2, y);
  }
  boolean evaluate() {
    connections.get(2).value=xor(connections.get(0).value, connections.get(1).value);
    connections.get(3).value=!connections.get(0).value && connections.get(1).value;
    return true;
  }
  private boolean xor(boolean n1, boolean n2) {
    return( (n1&!n2) || (n2&!n1));
  }
}
