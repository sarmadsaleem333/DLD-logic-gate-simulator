abstract class sequentialCircuits extends Gate {
  String n1, n2, n3, n4, name;
  sequentialCircuits(float x, float  y, float Width, float  Height, String n1, String n2, String n3, String n4, String name) {
    super(x, y, Width, Height);
    this.name=name;
    this.n1=n1;
    this.n2=n2;
    this.n3=n3;
    this.n4=n4;
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, -Height/4, -1));
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
    drawsequentialCircuits(x, y, Width, Height);
    evaluate();
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void  drawsequentialCircuits(float x, float  y, float Width, float  Height) {
    stroke(150);
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(25);
    text(n1, x+2, y-Height/4);
    text(n2, x+2, y+Height/4);
    text(n3, x+Width-20, y-Height/4);
    text(n4, x+Width-20, y+Height/4);
    text(name, x+Width/2-10, y);
  }
  private void  drawsequentialCircuits(float x, float  y, float Width, float  Height, String s2) {
    stroke(150);
    rect(x, y-Height/2, Width, Height);
    fill(#0F0204);
    textSize(25);
    text("I", x+2, y);
    text("O", x+Width-20, y);
    text("MUX", x+Width/2, y);
  }
}
