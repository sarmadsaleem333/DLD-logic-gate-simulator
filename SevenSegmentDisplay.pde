class SevenSegmentDisplay extends Gate {
  boolean A, B, C, D, E, F, G;
  SevenSegmentDisplay(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height);
    connections = new ArrayList<Connection>();
    connections.add(new Connection(this, -10, -Height/2+40, -1));
    connections.add(new Connection(this, -10, -Height/4+40, -1));
    connections.add(new Connection(this, -10, Height/4+40, -1));
    connections.add(new Connection(this, -10, Height/2+40, -1));
  }
  void show() {
    if (picked||select) fill(255);
    else fill(150);
    if (picked)
    {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }

    drawDisplay(x, y, Width, Height/2);
    evaluate();
    strokeWeight(3);
    evaluate();
    for (Connection c : connections) c.show();
    strokeWeight(1);
  }
  private void drawDisplay(float x, float  y, float Width, float  Height) {
    fill(A? #00ff00 : #FBFFFA);
    rect(x, y-Height/2, Width, Height/4);

    fill(F? #00ff00 : #FBFFFA);
    rect(x-10, y-Height/2+10, 10, Width/2);
    fill(E? #00ff00 : #FBFFFA);
    rect(x-10, y-Height/2+10+Width/2, 10, Width/2);

    fill(D? #00ff00 : #FBFFFA);
    rect(x, y-Height/2+10+Width, Width, 10);

    fill(B? #00ff00 : #FBFFFA);
    rect(x+Width, y-Height/2+10, 10, Width/2);

    fill(C? #00ff00 : #FBFFFA);
    rect(x+Width, y-Height/2+10+Width/2, 10, Width/2);

    fill(G? #00ff00 : #FBFFFA);
    rect(x, y+Height/2, Width, Height/4);
  }
  boolean evaluate() {
    getInputs();
    boolean a=connections.get(0).value;
    boolean b=connections.get(1).value;
    boolean c=connections.get(2).value;
    boolean d=connections.get(3).value;
    A=(!a&&c) || (!a&&b&&d)|| (!b&&!c&&!d)|| (a&&!b&&!c);
    B=(!a&&!b) ||(!a&&!c&&!d) || (!a&&c&&d) ||(a&&!b&&!c);
    C= (!a&&b)||(!a&&d )||(!b&&!c&&!d)||(a&&!b&&!c);
    D=(!a&&c&&!d)||(!a&&!b&&c) ||(!b&&!c&&!d)||(a&&!b&&!c)||(!a&&b&&!c&&d);
    E=(!a&&c&&!d)||(!b&&!c&&!d);
    F=(!a&&b&&!c)||(!a&&!c&&!d)||(!a&&b&&d)||(a&&!b&&!c);
    G=(!a&&c&&!d)||(!a&&!b&&c)||(!a&&b&&!c)||(a&&!b&&!c );
    return true;
  }
}
