abstract class Gate {
  float x;
  float y;
  float Width;
  float Height;
  boolean picked;
  boolean select;

  ArrayList<Connection> connections;

  Gate(float x, float  y, float Width, float  Height) {
    this.x=x;
    this.y=y;
    this.Height=Height;
    this.Width=Width;
    this.picked=false;
  }
  boolean isHover() {
    return (mouseX >= x && mouseX <= Width+x && mouseY >= y-Height/2 && mouseY <= y+Height/2);
  }
  boolean drag()
  {
    if (isHover())
    {
      for (int i=0; i<gate.size(); i++) gate.get(i).select=false;
      for (int i=0; i<wires.size(); i++) wires.get(i).select=false;
      gate.remove(this);
      gate.add(gate.size(), this);
      picked = true;
      select=true;
    }
    return picked;
  }
  void release()
  {
    if (isHover())
    {
      picked = false;
      roundOff();
    }
  }
  void delete() {
    if (select)
      gate.remove(this);
  }
  void roundOff() {
    int X= int(x/boxSize);
    int Y= int(y/boxSize);
    x=X*boxSize;
    y=Y*boxSize;
  }
  void getInputs()
  {
    for (Connection c : connections)
    {
      if (c.type == -1)c.value = c.value;
    }
  }
  void switchButton() {
  }

  abstract void show();
  abstract boolean evaluate();
}
