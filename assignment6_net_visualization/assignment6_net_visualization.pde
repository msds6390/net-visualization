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
 
 PImage map;
 String url;
 JSONObject json;
 JSONObject positionData;
 Float latitude;
 Float longitude;
 int x;
 int y;
 
 void setup(){
   size(1000, 500);
   map = loadImage("worldmap.jpg");
   map.resize(1000, 500);
   background(map);
   url = "http://api.open-notify.org/iss-now.json";
   json = loadJSONObject(url);
   println(json);
   JSONObject positionData = json.getJSONObject("iss_position");
   println(positionData);
   float latitude = positionData.getFloat("latitude");
   println(latitude);
   float longitude = positionData.getFloat("longitude");
   println(longitude);
 }
 
 void draw(){
   background(map);
   //url = "http://api.open-notify.org/iss-now.json";
   json = loadJSONObject(url);
   positionData = json.getJSONObject("iss_position");
   latitude = positionData.getFloat("latitude");
   longitude = positionData.getFloat("longitude");

   x =  (int) ((width/360.0) * (180 + longitude));
   y =  (int) ((height/180.0) * (90 - latitude));
   
   ellipse(x, y, 100, 100);
 }
