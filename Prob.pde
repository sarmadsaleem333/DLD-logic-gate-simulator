class Prob extends Gate {
  Toggle t1;
  Toggle t2;
  
  boolean output;
  Prob(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    output=false;
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, 0, Height/2, -1));
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
    rect(x, y, Width, Height);
   if (output) fill(#F53434);
    else fill( #0FA036);
    rect(x + 10, y + 10, Width - 20, Height - 20);
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  boolean evaluate() {
    getInputs();
    if (connections.get(0).value) output=true;
    else output=false;
    return connections.get(0).value;
  }
}
