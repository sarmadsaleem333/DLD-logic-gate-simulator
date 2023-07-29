class tFlipFlop extends sequentialCircuits {
  boolean memory;
  tFlipFlop(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height, "C", "T", "Q", "Q'", "T");
  }
  boolean evaluate() {
    if (!connections.get(0).value) {
      connections.get(2).value=connections.get(1).value;
      connections.get(3).value=!connections.get(1).value;
      return true;
    } else {
      connections.get(2).value=!connections.get(1).value;
      connections.get(3).value=connections.get(1).value;
      memory= connections.get(1).value;
      return connections.get(2).value;
    }
  }
}
