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
 Float lat;
 Float lon;
 int x;
 int y;
 
 
 void setup(){
   size(1000, 500);
   map = loadImage("worldmap.jpg");
   map.resize(1000, 500);
   //surface.setResizable(true);
   //surface.setSize(map.width, map.height);
   background(map);
   String url = "http://api.open-notify.org/iss-now.json";
   JSONObject json = loadJSONObject(url);
   //JSONArray json2 = JSONArray("file.json");
   print(json);
   //JSONObject json JSON xml = loadXML(url);
   //print(xml);
   
 }
 
 void draw(){
   background(map);
   int x =  (int) ((width/360.0) * (180 + lon));
   int y =  (int) ((height/180.0) * (90 - lat));
 }
