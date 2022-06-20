#ifndef DISTANCE_SENSOR_H
#define DISTANCE_SENSOR_H

#include "Arduino.h"

class DistanceSensor
{
private:
  float _distance;
  float _duration;
  int _trigPin;
  int _echoPin;

public:
  DistanceSensor(int trigPin, int echoPin);
  float getDistance();
  float convertCMtoM(float distance);
  float convertCMtoMM(float distance);
};

#endif