#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <DHT.h>
#include <DistanceSensor.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

//#define WIFI_SSID "Tec-IoT"
//#define WIFI_PASSWORD "PreguntarADeptoTI"
#define WIFI_SSID ""
#define WIFI_PASSWORD ""

#define dht_apin 14 // D5, es el sensor de temperatura
#define sensorTempName DHT11

#define pin_lumenes A0 // donde esta conectado el fotoresistor

#define VIN 5 // voltaje que le damos al fotoresistor
#define resistorLux 330 // los ohms de nuestro resistor que esta con el fotoresistor

#define foco D0 // led de la luz
#define valvula D8 // led de valvula
#define calentador D1 // El calentador

#define trigPin 12 // D6
#define echoPin 13 // D7

#define led D2 // led verde

DHT dhtSensor = DHT(dht_apin, sensorTempName);
DistanceSensor sensor(trigPin, echoPin);

const long utcOffsetInSeconds = -21600; // mexico city

char daysOfTheWeek[7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

// NTP Client para obtener el tiempo
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", utcOffsetInSeconds);

const char* host = "www.dweet.io";
const char* name  = "Huerto_HIdroponico_IoT";
const char* temperatura = "temp";
const char* humedad = "Hum";
const char* iluminacion = "iluminacion";
const char* distancia = "distancia"; // altura del agua
const char* focos = "foco";
const char* calentadorN = "calentador";
const char* valvulaN = "valvula";

//http://dweet.io/follow/Huerto_HIdroponico_IoT

float tempHum[2] = {0, 0};

bool luzPrendida = false;
bool valvulaPrendida = false;
bool calentadorPrendido = false;

int min_agua = 20; // siginfica que no hay agua, porque mide 20cm
int max_agua = 0; // significa que esta lleno, porque la distancia del sensor al agua es 0cm


void setup() {
    Serial.begin(9600);

    dhtSensor.begin();
    pinMode(led, OUTPUT);
    pinMode(foco, OUTPUT);
    pinMode(valvula, OUTPUT);
    pinMode(calentador, OUTPUT);

    delay(2000);
    Serial.println('\n');

    wifiConnect();

    timeClient.begin();
}  //End setup

void loop() {
  // obtener la hora
  getTime();
  
  // Obtener datos
  getTempHumidity(tempHum); // obtener temperatura y humedad
  int lumenes = getLumenes(); // obtener iluminacion
  float distance = sensor.getDistance();

  // prender luz
  int hora = timeClient.getHours();
  if(hora >= 20 || hora <= 7){
    luzPrendida = true;
    digitalWrite(foco, HIGH);
  } else {
    luzPrendida = false;
    digitalWrite(foco, LOW);
  }

  // prender valvula
  if(distance >= 20){
    distance = 20;
  }
  int agua_porcentaje = ((min_agua - distance) * 100) / min_agua; // porcentaje de agua

  if(agua_porcentaje < 40){
    digitalWrite(valvula, HIGH);
    valvulaPrendida = true;
  } else {
    digitalWrite(valvula, LOW);
    valvulaPrendida = false;
  }

  // prender calentador
  if(tempHum[0] < 16.0){
    digitalWrite(calentador, HIGH);
    calentadorPrendido = true;
  } else {
    digitalWrite(calentador, LOW);
    calentadorPrendido = false;
  }


  // Crear URL
  String url = "/dweet/for/";
  url += name;
  url += "?";
  url += temperatura;
  url += "=";
  url += tempHum[0];
  url += "&";
  url += humedad;
  url += "=";
  url += tempHum[1];
  url += "&";
  url += iluminacion;
  url += "=";
  url += lumenes;
  url += "&";
  url += distancia;
  url += "=";
  url += agua_porcentaje;
  url += "&";
  url += focos;
  url += "=";
  url += int(luzPrendida);
  url += "&";
  url += calentadorN;
  url += "=";
  url += int(calentadorPrendido);
  url += "&";
  url += valvulaN;
  url += "=";
  url += int(valvulaPrendida);

  // Send data and receive it
  sendDweet(url);
  //receiveDweet();

  // reconectar si se perdio la conexion
  if(WiFi.status() != WL_CONNECTED) {
     wifiConnect();
  }
  delay(10);
}  //End loop

void getTime(){
  //obtener el tiempo actual
  timeClient.update();

  Serial.print(daysOfTheWeek[timeClient.getDay()]);
  Serial.print(", ");
  Serial.print(timeClient.getHours());
  Serial.print(":");
  Serial.print(timeClient.getMinutes());
  Serial.print(":");
  Serial.println(timeClient.getSeconds());

  delay(10);
}

void wifiConnect() {
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);     //Conectar con la red WiFi
    Serial.print("Conectando WiFi --> ");
    Serial.print(WIFI_SSID); Serial.println(" ...");

    int teller = 0;
    while (WiFi.status() != WL_CONNECTED) {   //Esperar por la conexión WiFi
        digitalWrite(led, LOW);
        
        delay(500);

        digitalWrite(led, HIGH);
        Serial.print(++teller); Serial.print(' ');
        
        delay(500);
    }

    digitalWrite(led, HIGH);
    Serial.println('\n');
    Serial.println("WiFi conectado!");  
    Serial.print("IP address:\t");
    Serial.println(WiFi.localIP());         // Send the IP address of the ESP8266 to the computer
} //End wifiConnect()

// Enviar y recibir datos de Dweet
void sendDweet(String url){
  //ENVÍO A DWEET.IO

  WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    Serial.println("connection failed");
    return;
  }
  
  Serial.print("Requesting URL: ");
  Serial.println(url);
  
  // Enviar URL
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");

  int timeout = millis() + 5000;
  
  while (client.available() == 0) {
    if (timeout - millis() < 0) {
      Serial.println(">>> Client Timeout !");
      client.stop();
      return;
    }
  }
}

void receiveDweet(){
  WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    Serial.println("connection failed");
    return;
  }
  
  String getDataUrl = "/get/latest/dweet/for/Huerto_HIdroponico_IoT";
  Serial.print("Requesting URL: ");
  Serial.println(getDataUrl);
  
   // Recibir url
  
  client.print(String("GET ") + getDataUrl + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");

  Serial.println("Request sent");
  while (client.connected()) {
    String line = client.readStringUntil('\n');
    if (line == "\r") {
      Serial.println("Headers received");
      break;
    }
  }
  String line = client.readStringUntil('\n');

  Serial.println("Reply was:");
  Serial.println("==========");
  Serial.println(line);
  Serial.println("==========");
  Serial.println("Closing connection");

  DynamicJsonDocument doc(1024);
  deserializeJson(doc, line);

  if(doc["this"] == "succeeded"){
    String tempe = doc["with"][0]["content"]["temp"]; // get temperature from the json from dweet.io
    Serial.println(tempe);
  }
}

void getTempHumidity(float data[]){
  float temperature = dhtSensor.readTemperature();
  delay(200);
  float humidity = dhtSensor.readHumidity();

  data[0] = temperature;
  data[1] = humidity;

  delay(2000); // 2s
}

int getLumenes(){
  float value = analogRead(pin_lumenes);
  float VOUT = value * ((float)VIN / 1024);

  float RLDR = (resistorLux * (VIN - VOUT)) / VOUT;

  int lumens = 500 / (RLDR / 1000);

  return lumens;
}