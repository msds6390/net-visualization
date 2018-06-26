//class CurveSystem {
//  ArrayList<Curve> Curves;
//  PVector position
  
//  CurveSystem(PVector l){
//    position = l.copy();
//    Curves = new ArrayList<Curve>();
//  }
  
//  void addCurve(PVector l) {
//    Curves.add(new Curve(position));
//  }
  
//  void run() {
//    noFill();
//    beginShape();
//    for (int i = Curves.size() -1 ; i >= 0; i--) {
//      Curve c = Curves.get(i);
//      curveVertex(c.x, c.y);
//    }
//    endShape();
//  }
//}
