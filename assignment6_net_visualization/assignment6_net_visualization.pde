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
 
 PImage map;
 String url;
 JSONObject json;
 JSONObject positionData;
 Float latitude;
 Float longitude;
 Float x;
 Float y;
 PShape ISS;
 PImage ISSTexture;
 Float r = 0.0;
 
 void setup(){
   size(1000, 500, P3D);
   map = loadImage("worldmap.jpg");
   map.resize(1000, 500);
   background(map);
   
   url = "http://api.open-notify.org/iss-now.json";
   json = loadJSONObject(url);
   positionData = json.getJSONObject("iss_position");
   latitude = positionData.getFloat("latitude");
   longitude = positionData.getFloat("longitude");
   
   ISS = loadShape("Grunt2.obj");
   //ISSTexture = loadImage("foil_5.jpg");
   //ISS.setTexture(ISSTexture);
   ISS.scale(20);
   
   // ***********************************************************
   // Texture not loading properly, not sure why
   
   // Initial vertices set from initial call to ISS API
   // For each call to the API, update draing the vertexCurve
   // So continually add new vertexes, probably in an array?
   // ***********************************************************
 }
 
 void draw(){
   lights();
   background(map);
   json = loadJSONObject(url);
   positionData = json.getJSONObject("iss_position");
   latitude = positionData.getFloat("latitude");
   longitude = positionData.getFloat("longitude");
   
   x =  (((width/360.0) * (180 + longitude))) % width;
   y =  (((height/180.0) * (90 - latitude))) % height;
   println(x, y);
   shape(ISS, x, y);
   
   // x =  ((width/360.0) * (180 + longitude));
   // y =  ((height/180.0) * (90 - latitude));
   //println(x, y);
   
   //x = longitude % (width);
   //y = latitude % height;
   //println(x, y);
/*   
   pushMatrix();
   translate(width/2, height/2);
   rotateY(PI);
   rotateX(PI);
   shape(ISS, x, y);
   popMatrix();
 */
 }
