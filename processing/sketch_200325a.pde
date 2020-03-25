JSONArray values;
JSONArray dataset;
FloatDict latitude;
FloatDict longitude;

float angle = 0.0;

float lon = 144.9631;
float lat = -37.8136;

 PImage(earth);
 PShape globe;


void setup() {

  size(600, 600, P3D);

  values = loadJSONArray("countries-latest.json");
  dataset = loadJSONArray("location.json");

}

void draw() {
//for setup

  for (int i = 0; i < values.size(); i++) {

    JSONObject data = values.getJSONObject(i);

    String id = data.getString("country");
    int species = data.getInt("confirmed");


  }
//for location
  for (int i = 0;i<dataset.size();i++){
    JSONObject location = dataset.getJSONObject(i);
    String countryname;
    float latitudelocation;
    float longitudelocation;
    countryname = location.getString("name");
    longitudelocation = location.getFloat("longitude");
    latitudelocation = location.getFloat("latitude");
    latitude.set(countryname,latitudelocation);
    longitude.set(countryname,longitudelocation);
   } 



  background(51);
  translate(width * 0.5, height * 0.5);
  rotateY(angle);
  angle += 0.05;

  lights();
  fill(200);
  noStroke();
  float r = 200;
  sphere(r);

  for (int i = 0; i < values.size(); i++) {

    JSONObject data = values.getJSONObject(i);

    String state = data.getString("country");
    int number = data.getInt("confirmed");
      
      
    lat = latitude.get(state);
    lon = longitude.get(state);
    


    float theta = radians(lat) + PI / 2;
    float phi = radians(lon) + PI;
    float x = r * sin(theta) * cos(phi);
    float y = r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    pushMatrix();
    

    translate(x,y,z);
    box(10);

    
    popMatrix();
  }
}