class Wire
{
  boolean select;
  Connection in;
  Connection out;

  Wire (Connection in, Connection out)
  {

    this.in = in;
    this.out = out;
    in.wire = this;
    out.wire = this;
  }

  void show()
  {
    float inX = in.x + in.type*connectionWidth;
    float outX = out.x + out.type*connectionWidth;
    stroke(#1CC0C4);
    if (isHover()) stroke(#93A00F);
    if (select) stroke(255);
    line(outX, out.y, inX, in.y);
    out.value=in.value;
    in.connected=true;
    out.connected=true;
  }
  void selectWire() {
    if (isHover())
    
    {
      for (int i=0; i<wires.size(); i++) wires.get(i).select=false;
      for (int i=0; i<gate.size(); i++) gate.get(i).select=false;
      wires.remove(this);
      wires.add(wires.size(), this);
      select=true;
    }
  }
  void delete() {
    if (select)
    {
      wires.remove(this);
      in.alreadyConnected=false;
      out.alreadyConnected=false;
    }
  }
  boolean isHover() {
    return (mouseX<=out.x + out.type*connectionWidth && mouseX>=in.x + in.type*connectionWidth && mouseY<=out.y  && mouseY>=in.y);//|| mouseY<=out.y || mouseX>=  in.x + in.type*connectionWidth+out.x + out.type*connectionWidth ||mouseY>=in.y+out.y
  }

}
