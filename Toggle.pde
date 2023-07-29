class  Toggle extends Gate {
  boolean connected;
  boolean Switch;
  Toggle(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    this.Switch=true;
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, Width, Height/2, +1));
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
    if (Switch) fill(#F53434);
    else fill( #0FA036);
    rect(x + 10, y + 10, Width - 20, Height - 20);
    strokeWeight(3);
    for (Connection c : connections) c.show();
    strokeWeight(1);

    if (isHoverSwitch()) {
      fill(#1C47C4);
    }
  }
  void changeButton() {
    Switch=!Switch;
  }
  void switchButton() {
    if (isHoverSwitch())  Switch=!Switch;
  }

  boolean evaluate() {
    connections.get(0).value=Switch;
    return  connections.get(0).value;
  }
  boolean isHoverSwitch() {
    return(mouseX>=x + 10 &&mouseX<=x + 10+Width - 20&& mouseY>=y+10 &&mouseY<=y+10+Height-20);
  }
}
