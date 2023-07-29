class dFlipFlop extends sequentialCircuits {
  boolean memory;
  dFlipFlop(float x, float  y, float Width, float  Height) {
    super(x, y, Width, Height, "C", "D", "Q", "Q'", "D");
  }
  boolean evaluate() {
    if (!connections.get(0).value) {
      connections.get(2).value=memory;
      connections.get(3).value=!memory;
      return true;
    } else {
      connections.get(2).value=connections.get(1).value;
      connections.get(3).value=!connections.get(1).value;
      memory= connections.get(1).value;
      return connections.get(2).value;
    }
  }
}
