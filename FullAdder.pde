class FullAdder extends Gate {
  FullAdder(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, -Height/4, -1));
    connections.add(new Connection(this, 0, 0, -1));
    connections.add(new Connection(this, 0, Height/4, -1));
    connections.add(new Connection(this, Width, -Height/4, 1));
    connections.add(new Connection(this, Width, Height/4, 1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);
    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }

    drawfullAdder(x, y, Width, Height);
    evaluate();
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void  drawfullAdder(float x, float  y, float Width, float  Height) {
    stroke(150);
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(10);
    text("I", x+2, y-Height/4);
    text("I", x+2, y);
    text("C", x+Width-20, y+Height/4);
    text("SUM", x+Width-20, y-Height/4);
    text("CARRY", x+Width-20, y+Height/4);
    text("FULLADDER", x+Width/2-10, y);
  }
  boolean evaluate() {
    getInputs();
    boolean sum1= xor(connections.get(0).value, connections.get(1).value);
    connections.get(3).value=xor(connections.get(2).value, sum1);
    boolean c1=connections.get(0).value && connections.get(1).value;
    boolean c2=connections.get(2).value && sum1;
    connections.get(4).value=c1||c2;
    return true;
  }
  private boolean xor(boolean n1, boolean n2) {
    return( (n1&!n2) || (n2&!n1));
  }
}
