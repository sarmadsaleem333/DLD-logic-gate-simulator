class jkFlipFlop extends sequentialCircuits{
  boolean memory;
jkFlipFlop(float x, float  y, float Width, float  Height){
super(x, y, Width, Height,"J","K","Q","Q'","JK");
}
 boolean evaluate(){
    
   if(connections.get(0).value &&connections.get(1).value){
    connections.get(2).value=!memory;
    connections.get(3).value=!connections.get(2).value;
     return true;
   }
   memory=connections.get(2).value;
  boolean temp= connections.get(2).value;
 connections.get(2).value=(connections.get(0).value&& !temp)||(!connections.get(1).value&& temp);
 connections.get(3).value=!temp;
 return connections.get(2).value;
 }
}
