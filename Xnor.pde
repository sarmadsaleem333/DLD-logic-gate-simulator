class Xnor extends Gate {
  Xnor(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections=new ArrayList<Connection>();
    connections.add(new Connection(this, 8, -Height/4, -1));
    connections.add(new Connection(this, 8, +Height/4, -1));
    connections.add(new Connection(this, 29+Width, 0, +1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);
    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }

    drawXnor(x, y, Width, Height/2);
    strokeWeight(3);
    evaluate();
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void drawXnor(float  x, float  y, float Width, float  Height) {
    stroke(150);
    beginShape();
    for (float i=radians(-90); i<=radians(90); i+=radians(0.1)) {
      vertex(x+Width/2+(Width-Width/3)*cos(i), y+Height*sin(i));
    }
    for (float i=radians(90); i>=radians(-90); i-=radians(0.1)) {
      vertex(x+Width/3*cos(i), y+Height*sin(i));
    }
    endShape();
    ellipse(x+Width/2+Width-Width/3+6, y, Width/6, Width/6);
    for (float  i=radians(-90); i<=radians(90); i+=radians(0.1)) {
      point(x+Width/3*cos(i)-20, y+Height*sin(i));
    }
  }

  boolean evaluate() {
    getInputs();

    connections.get(2).value = !(connections.get(0).value & (!connections.get(1).value)||connections.get(1).value & (!connections.get(0).value));
    return connections.get(2).value;
  }
}
