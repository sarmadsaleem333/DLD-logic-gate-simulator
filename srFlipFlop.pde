import javax.swing.*;
class srFlipFlop extends sequentialCircuits {
  srFlipFlop(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height, "S", "r", "Q", "Q'", "SR");
  }
  boolean evaluate() {
    if (connections.get(0).value &&connections.get(1).value) {
      connections.get(2).value=false;
      connections.get(3).value=false;
      return true;
    }
    boolean temp= connections.get(2).value;
    connections.get(2).value=(connections.get(0).value)||(!connections.get(1).value&& temp);
    connections.get(3).value=!temp;
    return connections.get(2).value;
  }
}
