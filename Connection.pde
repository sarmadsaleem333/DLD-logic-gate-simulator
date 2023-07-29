float connectionWidth = 30;

class Connection
{
  float x;
  float y;
  float dx;
  float dy;
  boolean value;
  int type;
  boolean connected;
  Gate parent;
  Wire wire;
  boolean alreadyConnected;
  Connection(Gate parent, float dx, float dy, int type)
  {
    this.parent = parent;
    this.dx = dx;
    this.dy = dy;
    this.x = parent.x+dx;
    this.y = parent.y+dy;
    this.type = type;
  }
  

  void show()
  {
    this.x = parent.x+dx;
    this.y = parent.y+dy;
    if (!connected) stroke(255);
    else stroke(value ? #F53434: #0FA036);
    if (isHover()) stroke(#ffff00);
    line(x, y, x+(type*connectionWidth), y);
  }

  boolean isHover()
  {
    float threshold = 5;
    if (type == 1) return (mouseX >= x && mouseX <= x+connectionWidth && mouseY >= y-threshold && mouseY <= y+threshold);
    if (type == -1) return (mouseX <= x && mouseX >= x-connectionWidth && mouseY >= y-threshold && mouseY <= y+threshold);
    return false;
  }

  void checkConnection()
  {
    if (isHover())
    {
      if (inConnection == null &&  canGiveInput())
      {
        inConnection = this ;
        alreadyConnected=true;
      } else if ( !alreadyConnected && inConnection!=null && !canGiveInput()) {
        outConnection = this;
        alreadyConnected=true;
      }
    }
  }
  boolean canGiveInput() {
    if (type==-1) return false;
    return true;
  }
}
