/*
 MSDS 6390 Assignment 6: Net Visualization
 Plotting ISS Space Station
 Team: Jostein Barry-Straume, Brian Yu
 Date: 06/10/18
 Sources:
  http://www.tsiosophy.com/wp/wp-content/uploads/2011/04/Worldmap_LandAndPolitical.jpg
  https://stackoverflow.com/questions/1369512/converting-longitude-latitude-to-x-y-on-a-map-with-calibration-points
  http://open-notify.org/Open-Notify-API/ISS-Location-Now/
  https://processing.org/tutorials/data/
  https://processing.org/reference/curveVertex_.html
 */
 
 import processing.opengl.*;
 
JSONObject ISSdata;
JSONObject ISSloc;
PImage map;
String url;
JSONObject json;
JSONObject positionData;
PImage ISSTexture;
Float r = 0.0;
ArrayList<PVector> curve;
PShape Curve;
PImage earth; 
PShape globe, ISS;
float rot = 0;
float radius = 200;
float latitude, longitude;
Float x;
Float y;
 
 void setup(){
   size(1000, 1000, P3D);
   //map = loadImage("worldmap.jpg");
   //map.resize(1000, 500);
   background(map);
   
  // 1. Data -------------------------------------------------------------
  ISSdata = loadJSONObject("http://api.open-notify.org/iss-now.json");
  ISSloc = ISSdata.getJSONObject("iss_position");
  latitude = ISSloc.getFloat("latitude");
  longitude = ISSloc.getFloat("longitude");

  // additional
  x =  (((width/360.0) * (180 + longitude)));// % width;
  y =  (((height/180.0) * (90 - latitude)));
  curve = new ArrayList();
  curve.add(new PVector(x, y));
  //API.getJSON(url);

  // ---------------------------------------------------------------------
  lights();
  earth = loadImage("data/worldmap.jpg");
  noStroke();
  globe = createShape(SPHERE, 120); 
  globe.setTexture(earth);
  ISS = createShape(SPHERE, 5);
}
 
 void draw(){
  // 2. Algorithm --------------------------------------------------------
  float radLat = map(latitude, -90, 90, 0, PI);              // Geolocation Latitude ranges from -90 to 90 and is mapped 
  // to spherical coordinates (0, PI)
  float radLong = map(longitude, -180, 180, -PI, PI);
  //float radLat = radians(latitude);
  //float radLong = radians(longitude);
  float x = radius * sin(radLat) * cos(radLong);
  float y = radius * sin(radLat) * sin(radLong); 
  float z = radius * cos(radLat); 
  // ---------------------------------------------------------------------

  // 3. Mapping + 4. Sensoric output -------------------------------------
  background(0);
  translate(width/2, height/2); 
  rotateY(rot);
  shape(globe);
  translate(x, y, z);
  shape(ISS);
  // ---------------------------------------------------------------------

  curve.add(new PVector(x, y));
  noFill();
  stroke(255, 0, 0);
  strokeWeight(10);
  beginShape();
  for (int i = curve.size() - 1; i >= 0; i--) {
    PVector v = curve.get(i);
    curveVertex(v.x, v.y);
  }
  endShape();
  ellipse(x,y,50,50);
  //shape(ISS, x, y);

  rot+= 0.002;
}
