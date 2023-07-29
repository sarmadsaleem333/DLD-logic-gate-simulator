class Not extends Gate {  //<>//
  Not(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, 0, -1));
    connections.add(new Connection(this, Width-45, 0, 1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);
    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }
    evaluate();
    for (Connection c : connections) c.show();
    strokeWeight(1);
    drawNot(x, y, Width/2, Height/2);
  }
  private void drawNot(float  x, float  y, float Width, float  Height) {
    stroke(150);
    triangle(x, y-Height/2, x, y+Height/2, x+Width, y);
    ellipse(x+Width, y, Width/5, Width/5);
    strokeWeight(3);
  }
  boolean evaluate() {
    getInputs();
    connections.get(1).value = !(connections.get(0).value);
    return connections.get(1).value;
  }
}
